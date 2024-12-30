import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_login_page/sign_in_screen.dart';

import 'Constants/string_constants.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                textAlign: TextAlign.start,
                "Login In",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Email",
                    helperStyle: TextStyle(color: Colors.grey)),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.@[a-zA-Z]+")
                          .hasMatch(value)) {
                    return "Please Enter Email";
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),

              ValueListenableBuilder<bool>(
                valueListenable: _isObscure,
                builder: (BuildContext context, bool isObscure, Widget? child) {
                  return  TextFormField(
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _isObscure.value = !isObscure;
                          },),
                        hintText: "Password",
                        helperStyle: const TextStyle(color: Colors.grey)),
                    obscureText: isObscure,
                    validator: (value){
                      if(value == null || value.isEmpty || !RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(value)) {
                        return "Please Enter Password";
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {
                if(_formKey.currentState!.validate()){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                }
              }, child: Text("Login")),
              const SizedBox(height: 20,),
              const Text("OR"),
              const SizedBox(
                height: 10,
              ),
              const Text("Don't Have an Account Sign Up Here", style: TextStyle(
                fontSize: 16.0,
              ),),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,),
                  onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage())
                  );
                  },
                  child: const Text(
                    StringConstants.signUp,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
