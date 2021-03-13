import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:klarmd_test/screens/artists/stores/artists.store.dart';
import 'package:klarmd_test/screens/artists/widgets/HomePageScreen.dart';

import 'package:klarmd_test/states.dart';
import 'package:provider/provider.dart';

class ArtistsScreenArgs {
  final String name;

  ArtistsScreenArgs(this.name);
}

class ArtistsScreen extends StatefulWidget {
  static const String routeName = "/artists-screen";
  final String name;

  const ArtistsScreen({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArtistsScreenState();
  }
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  String get _name => widget.name;
  ArtistsStore _store;

  @override
  void didChangeDependencies() {
    _store ??= Provider.of<ArtistsStore>(context);
    _store.searchArtists(_name);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _store?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 14,
        iconSize: 35,
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

      body: Container(
        child: Column(

          children: [
            Observer(
              builder: (_) {
                switch (_store.state) {
                  case StoreState.loading:
                    return Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Loading...",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  default: return Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: HomePageScreen(
                            artists: _store.artistsResult ?? [],
                          ),
                        ),
                      ),
                    );
                }
              },
            ),
            Observer(
              builder: (_) => Visibility(
                visible: _store.errorMessage != null,
                child: Expanded(
                  child: Center(
                    child: Text(
                      _store.errorMessage ?? "",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
