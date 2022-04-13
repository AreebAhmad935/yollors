// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yollors/model.dart';
import 'package:yollors/screens/home.dart';
import 'package:yollors/screens/login/loginscr.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    //--------------------------------First Name
    final firstnamefield = TextFormField(
      autofocus: false,
      controller: firstnamecontroller,
      onSaved: (value) {
        firstnamecontroller.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter First Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          label: const Text('First Name'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Last Name
    final lastnamefeild = TextFormField(
      autofocus: false,
      controller: lastnamecontroller,
      onSaved: (value) {
        lastnamecontroller.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter last Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          label: const Text('Last Name'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Email
    final emailfeild = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Email");
        }
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value)) {
          return 'Invalid Email format';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          label: const Text('Email'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Password
    final passwordfeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordcontroller,
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min 6 character)");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.remove_red_eye),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          label: const Text('Password'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Confirm Password
    final confirmpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmpasswordcontroller,
      onSaved: (value) {
        confirmpasswordcontroller.text = value!;
      },
      validator: (value) {
        if (confirmpasswordcontroller.text != passwordcontroller.text) {
          return "Password dont Match";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.remove_red_eye),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          label: const Text('Confirm Password'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.yellow,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailcontroller.text, passwordcontroller.text);
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo.png",
                          width: 220,
                        )),
                    firstnamefield,
                    const SizedBox(
                      height: 20,
                    ),
                    lastnamefeild,
                    const SizedBox(
                      height: 20,
                    ),
                    emailfeild,
                    const SizedBox(
                      height: 20,
                    ),
                    passwordfeild,
                    const SizedBox(
                      height: 20,
                    ),
                    confirmpassword,
                    const SizedBox(
                      height: 30,
                    ),
                    loginbutton,
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const Login_Screen(),
                              ),
                            );
                          },
                          child: const Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {postDetailsToFirebase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  //postDetailsToFirebase
  postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstnamecontroller.text;
    userModel.lastname = lastnamecontroller.text;

    await firebaseFirestore
        .collection('user')
        .doc(user.uid)
        .set(userModel.tomap());
    Fluttertoast.showToast(msg: "Account created successfully :)");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
