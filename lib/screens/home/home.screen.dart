import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue,
      drawer: navbar(),
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isTablet(context))
                Expanded(
                  flex: 0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                ),
              Expanded(
                flex: 2,
                child: Responsive(
                  mobile: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.purple,
                        ),
                      )
                    ],
                  ),
                  tablet: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: navbar(),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  desktop: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ConstrainedBox navbar() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200),
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
