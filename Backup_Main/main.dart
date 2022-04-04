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
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Center(child: Text("Page 1")),
              Column(children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/Bp1.jpg'),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    ),
                  ],
                ),
              ]),
              Center(child: Text("Page 3")),
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
