import 'package:aiataf/models/brands_models.dart';
import 'package:flutter/cupertino.dart';



class UserProvider extends ChangeNotifier{


  Data _data=Data(
    companyId: 0,
     form: "",
    name: "",
    price: "",
    strength: "",
    id: 0,
  );



  Data get user=>_data;


  // void setUser(String user){
  //   _user=Data.fromJson(user as Map<String, dynamic>);
  //   notifyListeners();
  // }
  //
  //
  //
  //
  // void setUserFromModel(Data user){
  //   _user=user;
  //   notifyListeners();
  // }
}