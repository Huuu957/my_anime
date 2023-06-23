import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';
import 'package:my_anime_list/screens/anime_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'Browse Anime',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontFamily: 'Ubuntu',
                ),
              ),
              leading: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.filter,
                  color: kSecondaryColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: kSecondaryColor,
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding:
                    EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                tabs: [
                  Text(
                    'Anime',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: kDefaultPadding * 1.75,
                    ),
                  ),
                  Text(
                    'Manga',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: kDefaultPadding * 1.75,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AnimeScreen(),
              Text('yep'),
            ],
          ),
        ),
      ),
    );
  }
}
