import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/sign_in_form_validation.dart';
import 'internet_controller.dart';

class ChangePasswordController extends GetxController {
  late final GetStorage _getStorage;
  final InternetController _networkManager = Get.find<InternetController>();

  final formKey = GlobalKey<FormState>();

  late FocusNode PreNode, NewNode, ConfirmNode;

  late TextEditingController prectr, newctr, confirmctr;

  @override
  void onInit() {
    _getStorage = GetStorage();

    PreNode = FocusNode();
    NewNode = FocusNode();
    ConfirmNode = FocusNode();

    prectr = TextEditingController();
    newctr = TextEditingController();
    confirmctr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  var isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var PreModel = ValidationModel(null, null, isValidate: false).obs;
  var NewModel = ValidationModel(null, null, isValidate: false).obs;
  var ConfirmModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (PreModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (NewModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (ConfirmModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validatePrePass(String? val) {
    PreModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Name";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateNewPass(String? val) {
    NewModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Time";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateConfirmPass(String? val) {
    ConfirmModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Approx Sitting";
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
