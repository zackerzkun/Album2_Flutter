import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: Color.fromRGBO(255, 89, 199, 1),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Album Blackpink",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/BpBar2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                      new Tab(icon: new Icon(Icons.article), text: "Personil Data"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        for (var i = 0; i < 5; i++)
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            leading: SizedBox(
                                height: 100.0,
                                width: 100.0, // fixed width and height
                                child: Image.asset('assets/images/Bp1.jpg')),
                            title: Text('BLACKPINK - BOMBAYAH M/V'),
                          ),
                        for (var i = 0; i < 5; i++)
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            leading: SizedBox(
                                height: 100.0,
                                width: 100.0, // fixed width and height
                                child: Image.asset('assets/images/Bp2.jpg')),
                            title: Text('BLACKPINK - STAY M/V'),
                          ),
                        for (var i = 0; i < 5; i++)
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            leading: SizedBox(
                                height: 100.0,
                                width: 100.0, // fixed width and height
                                child: Image.asset('assets/images/Bp4.jpg')),
                            title: Text('BLACKPINK - AS OF ITS YOUR LAST M/V'),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  for (var i = 0; i < 3; i++)
                    Container(
                      child: Image.asset('assets/images/Bp1.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                  for (var i = 0; i < 3; i++)
                    Container(
                      child: Image.asset('assets/images/Bp2.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                  for (var i = 0; i < 3; i++)
                    Container(
                      child: Image.asset('assets/images/Bp4.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                  for (var i = 0; i < 3; i++)
                    Container(
                      child: Image.asset('assets/images/Bp5.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                  for (var i = 0; i < 3; i++)
                    Container(
                      child: Image.asset('assets/images/Bp6.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                  for (var i = 0; i < 3; i++)
                    Container(
                      child: Image.asset('assets/images/BpBar.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                ],
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset('assets/images/jennie.jpg')),
                          title: Text('Jennie Kim'),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset('assets/images/lisa.png')),
                          title: Text('Lisa'),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset('assets/images/rose.webp')),
                          title: Text('Rose'),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset('assets/images/jiso.jpg')),
                          title: Text('Jiso'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      decoration: BoxDecoration(color: Color.fromRGBO(255, 89, 199, 1)),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
