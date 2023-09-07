import 'package:aiataf/pages/registration_pages.dart';
import 'package:aiataf/services/login_service.dart';
import 'package:flutter/material.dart';

import '../widget/button_widget.dart';
import '../widget/custom_text_field.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  LoginService loginService=LoginService();
  void signin(){
    loginService.signInUser(context: context, email: _emailController.text, password: _passwordController.text);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _signInFormKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                CustomField(
                  controller: _emailController,
                  hintText: 'email',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomField(
                  controller: _passwordController,
                  hintText: 'password',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButtonWidget(
                  text: 'Login',
                  onTap: () {

                    if(_signInFormKey.currentState!.validate()){
                      signin();
                    }

                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Text(
                        "Don't have any Account?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage()));
                          },
                          child: Text(
                            "  SignUp",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
