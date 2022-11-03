import 'package:flutter/material.dart';
import 'package:servicelearningapp/api.dart';
import 'package:servicelearningapp/homeview/others.dart';

var api = APIHandler();

class IdeaView extends StatefulWidget {
  const IdeaView({Key? key}) : super(key: key);

  @override
  State<IdeaView> createState() => _IdeaViewState();
}

class _IdeaViewState extends State<IdeaView> {
  var data = {
    "name": "Loading...",
    "title": "",
    "desc": "",
    "team": [],
    "state": 0,
  };
  var name = "";
  List<Widget> datalist = [];

  @override
  void initState() {
    super.initState();
    api.getData("5BTCSB #2").then((value) {
      setState(() {
        data = value;
        name = '${data["name"]}';
      });
    });
    api.getCandidateList("5BTCSB #2").then((value) {
      setState(() {
        datalist = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: const Color(0xffffffff),
        title: Row(
          children: [
            GradientText(
              text: name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              gradient: const LinearGradient(
                colors: [Color(0xff355070), Color(0xff2b2d42)],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: Row(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: datalist,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.lightbulb),
                      title: const Text(
                        'Idea Presented',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        '${data["title"]}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text(
                      'Idea Explanation',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      '${data["desc"]}',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          enableFeedback: true,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffebfffc)),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff00947e),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            api.updateCandidateState("5BTCSB #2", context, 0);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          enableFeedback: true,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xfffeecf0),
                          ),
                        ),
                        child: const Text(
                          'Reject',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffcc0f35),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            api.updateCandidateState("5BTCSB #2", context, 1);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          enableFeedback: true,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xfffffaeb),
                          ),
                        ),
                        child: const Text(
                          'On Hold',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff946c00),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            api.updateCandidateState("5BTCSB #2", context, 2);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
