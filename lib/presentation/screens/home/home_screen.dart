import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/presentation/screens/home/widgets/clan_search_result_list_tile.dart';
import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/screen_size_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClanService clanService;
  final TextEditingController _clanNameController = TextEditingController();
  List<Clan> clanSearchResults = [];
  bool isError = false;
  String errorToastMsg = '';
  bool isProcessing = false;

  @override
  void dispose() {
    _clanNameController.dispose();
    super.dispose();
  }

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
      } else {
        setState(() {
          isError = false;
          errorToastMsg = '';
          isProcessing = false;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        errorToastMsg = 'There was an issue trying to fetch from Clash of Clans Api';
        isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    clanService = Provider.of<ClanService>(context, listen: false);
    /* Temporary for testing -> to auto navigate to Dashboard for a clan */
    // return FutureBuilder(
    //   future: clanService.searchClans('OnlyStans'),
    //   builder: (BuildContext context, AsyncSnapshot<List<Clan>> snapshots) {
    //     if (snapshots.hasData && snapshots.connectionState == ConnectionState.done) {
    //         var tempClan = snapshots.data![0];
    //         WidgetsBinding.instance.addPostFrameCallback((_) {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => ClanDashboardScreen(clan: tempClan)),
    //           );
    //         });
    //     }
    //     return const Text('Loading');
    //   }
    // );
    
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    TextField(
                      controller: _clanNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter Clan Name (minimum 3 characters)',
                        hintStyle: TextStyle(color: isError ? Colors.red : Colors.grey),
                        filled: true,
                        fillColor: Colors.black45.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search, color: isError ? Colors.red : Colors.grey[400]),
                        errorText: isError ? errorToastMsg : null,
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: _clanNameController,
                      builder: (context, value, child) {
                        bool isValidSearch = _clanNameController.text.length >= 3;
                        bool isSearchBtnDisabled = !isValidSearch || isProcessing;

                        return ElevatedButton(
                          onPressed: isSearchBtnDisabled ? null : _onSearch,
                          style: isSearchBtnDisabled ? ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ) : null,
                          child: isProcessing
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text('Search Clan', style: isValidSearch ? null : const TextStyle(color: Colors.grey, fontFamily: 'CustomClashOfClans')),
                        );
                      }
                    ),
                    const SizedBox(height: 20),
                    if (clanSearchResults.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: clanSearchResults.length,
                          itemBuilder: (context, index) {
                            return ClanSearchResultListTile(clan: clanSearchResults[index]);
                          },
                        ),
                      ),
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
