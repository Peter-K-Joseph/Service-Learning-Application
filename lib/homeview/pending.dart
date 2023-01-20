import 'package:flutter/material.dart';
import 'package:servicelearningapp/homeview/filter.dart';
import 'package:servicelearningapp/homeview/ideaview.dart';
import 'package:servicelearningapp/homeview/others.dart';

class PendingList extends StatefulWidget {
  const PendingList({super.key});

  @override
  State<PendingList> createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
  ListView data = ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(
          "No pending requests",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      );
    },
  );

  @override
  void initState() {
    super.initState();
  }

  Future refresh() async {
    setState(
      () {
        data = ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              title: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.lightbulb),
                      title: const Text('5BTCSB #2'),
                      subtitle: Text(
                        'Team of 4',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                        'Create a service learning application portal for students to learn and share knowledge.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF6200EE),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IdeaView()),
                            );
                          },
                          child: const Text('View Idea Application'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xff175bed)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterForm()),
              );
            },
          ),
        ],
        backgroundColor: const Color(0xffD8F6FF),
        title: const GradientText(
          text: "Pending",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          gradient: LinearGradient(
            colors: [Color(0xff0d9ff0), Color(0xff175bed)],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffD8F6FF)),
        child: SafeArea(
          child: Column(
            children: [
              // search
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: refresh,
                  child: data,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
