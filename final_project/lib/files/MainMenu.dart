import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'GetDataNews.dart';
import 'GetDataBatik.dart';
import 'AboutMe.dart';

class MainMenu extends StatefulWidget {

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    GetDataNews(),
    GetDataBatik(),
    AboutMe(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket, 
        child: currentScreen
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,
                        color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text( 
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue :Colors.grey
                            ),
                        )
                      ],
                    ),
                    ),
                    MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = GetDataNews();
                        currentTab = 1;
                      });
                      // Navigator.pushNamed(context, '/search');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.article,
                        color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text( 
                          'News',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue :Colors.grey
                            ),
                        )
                      ],
                    ),
                    ),
                    MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = GetDataBatik();
                        currentTab = 2;
                      });
                      // Navigator.pushNamed(context, '/search');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite,
                        color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text( 
                          'Interests',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue :Colors.grey
                            ),
                        )
                      ],
                    ),
                    ),
                    MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = AboutMe();
                        currentTab = 3;
                      });
                      // Navigator.pushNamed(context, '/search');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                        color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text( 
                          'Account',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue :Colors.grey
                            ),
                        )
                      ],
                    ),
                    ),
                ],
              )
            ],
            ),
        ),),
    );

  }
}