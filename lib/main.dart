import 'package:flutter/material.dart';
import 'package:servicelearningapp/afterlogin_home.dart';
import 'package:servicelearningapp/others/helper.dart';

void main() {
  runApp(const InitState());
}

class InitState extends StatelessWidget {
  const InitState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginEvent(),
    );
  }
}

class LoginEvent extends StatefulWidget {
  const LoginEvent({super.key});

  @override
  State<LoginEvent> createState() => _LoginEventState();
}

class _LoginEventState extends State<LoginEvent> {
  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();
  AlertingServices alerts = AlertingServices();
  Color btnColor = Colors.grey;
  Color inputColor = Colors.grey[200]!;
  bool enableAuthTrust = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    passwd.dispose();
    super.dispose();
  }

  login(BuildContext context) {
    if (enableAuthTrust == true) {
      alerts.alertingMesseger(context, "info", "Authenticating...",
          "Session authentication in progress... Please wait", null);
      if (email.text == "peter.k@btech.christuniversity.in" &&
          passwd.text == "12345678") {
        alerts.alertingMesseger(
          context,
          "success",
          "Signed in as Peter",
          "Welcome back Peter, you have been signed in successfully",
          Icons.check_circle,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(() {
          inputColor = Colors.red[800]!;
        });
        alerts.alertingMesseger(
          context,
          "error",
          "No records found",
          "Check your credentials and try again",
          Icons.no_encryption_sharp,
        );
      }
    } else {
      alerts.alertingMesseger(
        context,
        "warning",
        "Required Information",
        "Please enter your Christ University mail ID and password",
        Icons.data_array,
      );
    }
  }

  inputCheck() {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = RegExp(pattern);
    if (email.text == "" ||
        passwd.text == "" ||
        email.text.contains("christuniversity.in") == false ||
        passwd.text.length < 8 ||
        email.text.length < 19 ||
        !regExp.hasMatch(email.text)) {
      setState(() {
        enableAuthTrust = false;
        btnColor = Colors.grey;
        inputColor = Colors.grey[500]!;
      });
    } else {
      setState(() {
        enableAuthTrust = true;
        btnColor = Colors.blue;
        inputColor = Colors.grey[500]!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset("asset/logo.png", width: 250),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Hello Again!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome back! Sign in using your Portal ID to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: inputColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          controller: email,
                          onChanged: (string) => {inputCheck()},
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Enter your Email ID',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: inputColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          onChanged: (string) => {inputCheck()},
                          controller: passwd,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            border: InputBorder.none,
                            hintText: 'Enter your Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextButton(
                      style: const ButtonStyle(
                        enableFeedback: true,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login(context)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: btnColor,
                          borderRadius: BorderRadius.circular(12),
                          backgroundBlendMode: BlendMode.darken,
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
