import 'package:flutter/material.dart';
import 'package:servicelearningapp/homeview/others.dart';

class FilterForm extends StatefulWidget {
  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  final classController = TextEditingController();
  final teamSizeController = TextEditingController();
  final teacherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD8F6FF),
        title: const GradientText(
          text: "Filter",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          gradient: LinearGradient(
            colors: [Color(0xff0d9ff0), Color(0xff175bed)],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: classController,
              decoration: InputDecoration(
                labelText: 'Class',
                prefixIcon: Icon(Icons.class_),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a class';
                }
                return null;
              },
            ),
            TextFormField(
              controller: teamSizeController,
              decoration: const InputDecoration(
                labelText: 'Team Size',
                prefixIcon: Icon(Icons.group),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a team size';
                }
                return null;
              },
            ),
            TextFormField(
              controller: teacherController,
              decoration: const InputDecoration(
                labelText: 'Teacher',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a teacher';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, fetch the data with the filter criteria
                    // specified in the controllers
                    // TODO: Fetch data here
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
