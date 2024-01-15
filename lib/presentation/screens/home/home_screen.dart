import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/presentation/screens/home/widgets/clan_search_result_list_tile.dart';
import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/screen_size_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan_search_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClanService clanService;
  final TextEditingController _clanNameController = TextEditingController();
  List<ClanSearchResult> clanSearchResults = [];
  bool isError = false;
  String errorToastMsg = '';
  bool isProcessing = false;

  void _onSearch() async {
    setState(() {
      isError = false;
      clanSearchResults = [];
      isProcessing = true;
    });

    try {
      String clanName = _clanNameController.text;
      clanSearchResults = await clanService.searchClans(clanName);

      if (clanSearchResults.isEmpty) {
        setState(() {
          isError = true;
          errorToastMsg = 'Search query came back with no results';
          isProcessing = false;
        });
        // Show error toast
      } else {
        isError = true;
        errorToastMsg = '';
        isProcessing = false;
      }
    } catch (e) {
      setState(() {
        isError = true;
        errorToastMsg = 'There was an issue trying to fetch from Clash of Clans Api';
        isProcessing = false;
      });
      // Show error toast
    }
  }

  @override
  Widget build(BuildContext context) {
    clanService = Provider.of<ClanService>(context, listen: false);

    const String clashOfClansLogoPath = 'assets/clash-of-clans-logo.png';
    bool isMobileOrTablet = ScreenSizeService.isMobileOrTablet(context);
    double imageWidthMultiplier = isMobileOrTablet ? 0.75 : 0.5;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * imageWidthMultiplier;
    double imageHeight = imageWidth;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SizedBox(
                    width: imageWidth,
                    height: imageHeight,
                    child: const Image(
                      image: AssetImage(clashOfClansLogoPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    TextField(
                      controller: _clanNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Clan Name',
                        hintStyle: TextStyle(color: isError ? Colors.red : Colors.grey),
                        filled: true,
                        fillColor: Colors.black45.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search, color: isError ? Colors.red : Colors.grey[400]),
                        errorText: isError ? 'Clan not found or error occurred' : null,

                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _onSearch,
                      child: const Text('Search Clan'),
                    ),
                     if (clanSearchResults.isNotEmpty)
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: clanSearchResults.length,
                        itemBuilder: (context, index) {
                          return ClanSearchResultListTile(clanSearchResult: clanSearchResults[index]);
                        }
                      )
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
