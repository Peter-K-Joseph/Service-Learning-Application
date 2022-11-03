import 'package:flutter/material.dart';
import 'package:servicelearningapp/homeview/others.dart';
import 'package:servicelearningapp/homeview/ideaview.dart';

class AcceptedList extends StatelessWidget {
  const AcceptedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 219, 255, 222),
        title: Row(
          children: const [
            GradientText(
              text: "Accepted",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              gradient: LinearGradient(
                colors: [Color(0xff38b000), Color(0xff006400)],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 219, 255, 222)),
        child: ListView.builder(
          itemCount: 2,
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
        ),
      ),
    );
  }
}
