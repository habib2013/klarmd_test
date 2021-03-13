import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klarmd_test/models/models.dart';
import 'package:klarmd_test/screens/artists/widgets/HomePageScreen.dart';

class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _currentTab = 0;

  List<Widget> tabs = [
    HomePageScreen(),
    Portfolio(),
    Portfolio(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Icon(Icons.notification_important,color: Colors.blueGrey[200],size: 35,),
              Text('Notification',style: TextStyle(color: Colors.blueGrey,fontSize: 8),),
            ],
          ),
        ),
          actions: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 5),
                  child: Image.asset('assets/images/Medium.png',height: 35,width: 35,),
                ),
                SizedBox(height: 1,),
                 Text('John Doe',style: TextStyle(color: Colors.blueGrey,fontSize: 8),),
              ],
            ),

        ],
      ),
      body: tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 14,
        iconSize: 35,
       
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Colored.png"),

            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
          AssetImage("assets/images/Regular.png"),

    ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'Report',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon:ImageIcon(
              AssetImage("assets/images/Regular21.png"),

            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                'Inbox',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }


}



class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
