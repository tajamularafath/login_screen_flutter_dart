import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_login_page/login_in_screen.dart';

import 'Constants/string_constants.dart';

class SignUpPage extends StatelessWidget {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isPasswordObscure = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isConfirmPasswordObscure = ValueNotifier<bool>(true);
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
                ValueListenableBuilder(
                  valueListenable: _isPasswordObscure,
                  builder:
                      (BuildContext context, bool isObscure, Widget? child) {
                    return TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                              icon: Icon(
                                isObscure ? Icons.visibility : Icons.visibility_off,),
                              onPressed: (){
                                _isPasswordObscure.value = !isObscure;
                              },),
                      ),
                      obscureText: isObscure,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                .hasMatch(value)) {
                          return "Please Enter Valid Password";
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder(
                  valueListenable: _isConfirmPasswordObscure,
                  builder: (BuildContext context, bool isObscure, Widget? child) {
                    return  TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                _isConfirmPasswordObscure.value = !isObscure;
                            },),
                        ),
                        obscureText: isObscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if(value != _passwordController.text){
                            return "Password does not match";
                          }
                        }
                    );
                  },

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
                ),const SizedBox(height: 20,),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(height: 10,),
                    const Text("Already Have Account Login Here",style: TextStyle(
                      fontSize: 16.0,
                    ),),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginInScreen())
                      );
                    },
                        child: Text("Login"))
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
