
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_cart/app/data/APIs/APIFunctions.dart';

import '../../../model/users.dart';



class LogInScreenController extends GetxController {

  final APIFunctions functions = APIFunctions();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  late User logInUser;

  Future<void> logIn (String userName, String password) async {

    User user =  await functions.logIn(userName, password);

    logInUser = user;

  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return super.onDelete;
  }

}
