import 'package:flutter/material.dart';
import 'package:servicelearningapp/homeview/others.dart';

class OnHoldList extends StatelessWidget {
  const OnHoldList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 255, 225),
        title: const GradientText(
          text: "On Hold",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          gradient: LinearGradient(
            colors: [Color(0xffff7b00), Color(0xffff8800)],
          ),
        ),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 253, 255, 225)),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Card title 1'),
                      subtitle: Text(
                        'Secondary Text',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF6200EE),
                            ),
                          ),
                          onPressed: () {
                            // Perform some action
                          },
                          child: const Text('View'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF6200EE),
                            ),
                          ),
                          onPressed: () {
                            // Perform some action
                          },
                          child: const Text('ACTION 2'),
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
