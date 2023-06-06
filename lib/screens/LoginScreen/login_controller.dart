import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/sign_in_form_validation.dart';
import '../../controllers/internet_controller.dart';

class LoginController extends GetxController {
  late final GetStorage _getStorage;
  final InternetController _networkManager = Get.find<InternetController>();

  late FocusNode Email, Pass;

  late TextEditingController emailctr, passctr;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _getStorage = GetStorage();

    Email = FocusNode();
    Pass = FocusNode();

    emailctr = TextEditingController();
    passctr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  var isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailModel = ValidationModel(null, null, isValidate: false).obs;
  var passModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (emailModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (passModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validateEmail(String? val) {
    emailModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Email";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validatePassword(String? val) {
    passModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Password";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  RxBool isFormInvalidate = false.obs;

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void navigate() {
    // Get.to(const SignUpScreen(false));
  }
}
