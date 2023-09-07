import 'package:flutter/material.dart';

import '../widget/custom_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _occustionIdController=TextEditingController();
  TextEditingController _specilaIdController=TextEditingController();
  TextEditingController _bmdcRegNoController=TextEditingController();
  TextEditingController _specialityRegNoController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomField(controller: _phoneController, hintText: 'phone number',),
            SizedBox(height: 10,),



            CustomField(controller: _passwordController, hintText: 'password',),
            SizedBox(height: 10,),




            CustomField(controller: _occustionIdController, hintText: 'Occuption Id',),
            SizedBox(height: 10,),


            CustomField(controller: _specilaIdController, hintText: 'Special Id',),
            SizedBox(height: 10,),

            CustomField(controller: _bmdcRegNoController, hintText: 'bmdc Reg no..',),
            SizedBox(height: 10,),

            CustomField(controller: _specialityRegNoController, hintText: 'Speciality',),
            SizedBox(height: 10,),




          ],
        ),
      ),
    );
  }
}
