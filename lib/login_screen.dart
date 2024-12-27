import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Constants/string_constants.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if(value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                      return "Please Enter Email";
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if(value == null || value.isEmpty || !RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(value)){
                      return "Please Enter Valid Password";
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Valid Password";
                  }
                }
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                          text: "By clicking Sign Up you agree to the following ",
                          // Regular text
                          style: TextStyle(
                            color: Colors.black,
                            // Default color for unstyled text
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: "Terms and Conditions ", // Highlighted text
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "without reservations.",
                              style: TextStyle(
                                color: Colors.black,
                                // Default color for unstyled text
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){

                          }
                        },
                        child: const Text(
                          StringConstants.signUp,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Google", style: TextStyle(color: Colors.red),)),
                    ElevatedButton(onPressed: () {}, child: Text("FaceBook", style: TextStyle(color: Colors.blueAccent)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
