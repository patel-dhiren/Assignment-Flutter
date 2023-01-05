import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _focusedBorder = OutlineInputBorder(
      /*borderRadius: BorderRadius.circular(30),*/
      borderSide: BorderSide(color: Colors.red.shade300));

  final _activeBorder = const OutlineInputBorder(
      /*borderRadius: BorderRadius.circular(30),*/
      borderSide: BorderSide(color: Colors.transparent));

  final _errorBorder = const OutlineInputBorder(
      /*borderRadius: BorderRadius.circular(30),*/
      borderSide: BorderSide(color: Colors.red));

    final _formKey = GlobalKey<FormState>();

  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.red.shade300,
                Colors.red.shade200,
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_logo.png',
                    height: 80,
                    width: 80,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Signup\n',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Create your account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Please enter your name";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,

                        fillColor: Colors.grey.shade200,
                        labelText: 'Enter User Name',
                        labelStyle: TextStyle(color: Colors.red.shade300),
                        enabledBorder: _activeBorder,
                        focusedBorder: _focusedBorder,
                        errorBorder: _errorBorder),
                    cursorColor: Colors.red.shade300,
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (email) {
                      if(!Utils.isValidEmail(email!)){
                        return "Enter valid email address";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,

                      labelText: 'Enter email address',
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      enabledBorder: _activeBorder,
                      focusedBorder: _focusedBorder,
                    ),
                    cursorColor: Colors.red.shade300,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) {
                      if(!Utils.isValidContact(value!)){
                        return "Enter valid contact";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,

                      labelText: 'Enter Contact ',
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      enabledBorder: _activeBorder,
                      focusedBorder: _focusedBorder,
                    ),
                    cursorColor: Colors.red.shade300,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) {
                      if(!Utils.isValidPassword(value!)){
                        return "Enter valid password";
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      errorText: password,
                      fillColor: Colors.grey.shade200,
                      labelText: 'Enter Password',
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      enabledBorder: _activeBorder,
                      focusedBorder: _focusedBorder,
                    ),
                    cursorColor: Colors.red.shade300,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value != password){
                        return "Password mismatch";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,

                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.red.shade300),
                      enabledBorder: _activeBorder,
                      focusedBorder: _focusedBorder,
                    ),
                    cursorColor: Colors.red.shade300,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {

                      if(_formKey.currentState!.validate()){
                        print('all done');
                      }

                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.red.shade300,
                          Colors.red.shade200,
                        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
