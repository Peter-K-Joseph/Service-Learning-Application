import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  getData(String id) async {
    // STATE CODE 0 > Pending, 1 > Accepted, 2 > Rejected, 3 > On Hold
    return {
      "name": "5BTCSB #2",
      "title":
          "Create a service learning application portal for students to learn and share knowledge.",
      "desc":
          "Loreum ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisi vel consectetur interdum, nisi nisi consectetur nisi, nisi nisi consectetur nisi",
      "team": [
        {"name": "Marc Pervez Boocha", "leader": 1, "admno": 2060110},
        {"name": "Peter K Joseph", "leader": 0, "admno": 2062209},
        {"name": "Christy Jose", "leader": 0, "admno": 2062041},
        {"name": "Sookthy Daniel", "leader": 0, "admno": 2062110},
        {"name": "Milton Thachil", "leader": 0, "admno": 2011015}
      ],
      "state": 0,
    };
  }

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String serverURL = "http://localhost:3000/api";

  Future<http.Response> authentication(String username, String password) async {
    return await http.post(
      Uri.parse("$serverURL/auth"),
      headers: _headers,
      body: {
        "username": username,
        "password": password,
        "access": "mobileapp",
      },
    );
  }

  getCandidateList(String id) async {
    var data = await getData(id);
    List<Widget> candidateList = [
      const Padding(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Text(
          "Team List",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    ];
    for (var i = 0; i < data["team"].length; i++) {
      candidateList.add(
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            '${data["team"][i]["name"]}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            '${(data["team"][i]["leader"] == 1) ? "Leader" : "Member"} | ${data["team"][i]["admno"]}',
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
      );
    }
    return candidateList;
  }

  updateCandidateState(String teamID, context, action) {
    if (teamID == "" || teamID.isEmpty) {
      return;
    }
    var actions = [
      "Are you sure you want to approve the idea of $teamID?",
      "Are you sure you want to reject the idea of $teamID?",
      "Are you sure you want to put on hold the idea of $teamID?",
    ];
    var actionConfirm = [
      "Idea Approved",
      "Idea Rejected",
      "Idea On Hold",
    ];
    var snackbar = SnackBar(
      content: Text(actionConfirm[action]),
    );
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Confirm Action'),
        content: Text(
          '${actions[action]}. Once processed, you cannot revert the action.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Authorise'),
            onPressed: () => {
              Navigator.pop(context),
              ScaffoldMessenger.of(context).showSnackBar(snackbar),
            },
          ),
        ],
      ),
    );
  }
}
