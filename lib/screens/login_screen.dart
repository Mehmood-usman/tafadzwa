import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafadzwa/get_x/data_controller.dart';
import 'package:tafadzwa/models/user_model.dart';
import 'package:tafadzwa/networking/api_calls.dart';
import 'package:tafadzwa/screens/employee.dart';
import 'package:tafadzwa/utils/general_widgets.dart';
import 'package:tafadzwa/utils/utils.dart';

import 'client.dart';
import 'manager.dart';

class Login extends StatelessWidget {
  final controller = Get.put(DataController());
  bool isApiCalling = false;
  late List<UserModel> usersList;

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? userNameError;
  String? passwordError;
  late var dataProvider;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Application")),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
                  child: TextInput(
                    onChange: (value) {
                      controller.updateUserName("");
                    },
                    controller: userController,
                    label: "Username",
                    inputType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
                  child: TextInput(
                    onChange: (value) {
                      controller.updatePassword("");
                    },
                    controller: passwordController,
                    label: "Password",
                    isSecure: true,
                    inputType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GeneralButton(
                    text: "Login",
                    onPress: () {
                      if (_validateUsername() && checkPasswordValidation()) {
                        isInternet().then((value) => {
                          if (value)
                            {getUsers(context)}
                          else
                            alertDialoge(
                                "Please check your internet", context)
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
          GetX<DataController>(
              builder: (_) => controller.isApiCalling.value
          ? const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      )
          : const SizedBox())

        ],
      ),
    );
  }


  bool checkPasswordValidation() {
    if (passwordController.text.isNotEmpty &&
        !(passwordController.text.length > 5)) {

      controller.updatePassword("Password should contain more that 5 characters");
      return false;
    } else if (passwordController.text.isEmpty) {
      controller.updatePassword("Please enter you password");

      return false;
    }
    return true;
  }

  bool _validateUsername() {
    if (userController.text.length == 0) {
      controller.updateUserName("Please enter email");
      return false;
    } else if (!_isEmailValid(userController.text)) {

      controller.updateUserName("Must be valid username");
      return false;
    }
    return true;
  }

  bool _isEmailValid(String value) {
    String pattern =
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
    RegExp regExp = new RegExp(pattern);

    return regExp.hasMatch(value);
  }

  bool checkUsernameValidations() {
    if (userController.text.isEmpty) {
      controller.updateUserName("Please enter username");
      return false;
    }
    return true;
  }

  void getUsers(BuildContext context) {

    controller.updateIsApiCalling(true);
    ApiCalls().fetchUsers().then((value) => {
      usersList = value.map((data) => UserModel.fromJson(data)).toList(),
      checkUserExist(usersList,context),
      controller.updateIsApiCalling(false)
    });
  }

  void checkUserExist(List<UserModel> userList,BuildContext context) {
    bool isUserFound = false;
    for (var user in usersList) {
      if (user.username == userController.text &&
          user.password == passwordController.text) {
        controller.setUser(user);
        navigateToNextScreen(user,context);
        isUserFound = true;
        break;
      } else {
        isUserFound = false;
      }
    }
    if(!isUserFound) {
      alertDialoge("User not exist on check your credentials", context);
    }
  }
  void navigateToNextScreen(UserModel getUser,BuildContext context) {
    if(getUser.type==1) {
      Navigator.pushNamed(context, Client.id);
    } else if( getUser.type ==2) {
      Navigator.pushNamed(context, Employee.id);
    } else if (getUser.type==3) {
      Navigator.pushNamed(context, Manager.id);
    }
  }
}