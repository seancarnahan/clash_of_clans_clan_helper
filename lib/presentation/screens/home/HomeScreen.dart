import 'package:flutter/material.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/screen_size_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _clanNameController = TextEditingController();

  void _onSearch() {
    String clanName = _clanNameController.text;
    // Logic to search for the clan
    // If clan is found, navigate to ClanDashboard
    // If not found, show error toast
  }

  @override
  Widget build(BuildContext context) {
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
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.black45.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _onSearch,
                      child: const Text('Search Clan'),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
