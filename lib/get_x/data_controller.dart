
import 'dart:ffi';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tafadzwa/models/user_model.dart';

class DataController extends GetxController{
  var user  = UserModel().obs;
  var isApiCalling = false.obs;
  var userName = "".obs;
  var userPassword = "".obs;

  void setUser(UserModel userModel){
    user.value = userModel;
    update();
  }

  void updateIsApiCalling(bool isApiCalling){
    this.isApiCalling.value = isApiCalling;
    update();
  }

  void updateUserName(String nameError){
    userName.value = nameError;
    update();
  }

  void updatePassword(String passwordError){
    userPassword.value = passwordError;
    update();
  }
}