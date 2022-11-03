import 'package:flutter/material.dart';
import 'package:servicelearningapp/homeview/accepted.dart';
import 'package:servicelearningapp/homeview/onhold.dart';
import 'package:servicelearningapp/homeview/pending.dart';
import 'package:servicelearningapp/homeview/rejected.dart';
import 'package:servicelearningapp/homeview/settings.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: const TabBarView(
            children: [
              Scaffold(
                body: PendingList(),
                backgroundColor: Colors.white,
              ),
              Scaffold(
                body: AcceptedList(),
                backgroundColor: Colors.white,
              ),
              Scaffold(
                body: RejectedList(),
                backgroundColor: Colors.white,
              ),
              Scaffold(
                body: OnHoldList(),
                backgroundColor: Colors.white24,
              ),
              Scaffold(
                body: Settings(),
                backgroundColor: Colors.white24,
              ),
            ],
          ),
          bottomNavigationBar: bottomMenuItems(),
        ),
      ),
    );
  }

  Widget bottomMenuItems() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(0, 246, 246, 248),
            width: 1,
          ),
        ),
      ),
      child: const TabBar(
        labelColor: Color(0xffd39d7d),
        unselectedLabelColor: Colors.black54,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(7.0),
        indicatorColor: Colors.black45,
        enableFeedback: true,
        tabs: [
          Tab(
            icon: Icon(Icons.access_time),
          ),
          Tab(
            icon: Icon(Icons.check_rounded),
          ),
          Tab(
            icon: Icon(Icons.clear_rounded),
          ),
          Tab(
            icon: Icon(Icons.warning),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
