import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/sign_in_form_validation.dart';
import 'internet_controller.dart';

class AddCourseController extends GetxController {
  late final GetStorage _getStorage;
  final InternetController _networkManager = Get.find<InternetController>();

  late FocusNode StudentNode,
      CourseNode,
      FeesNode,
      StartNode,
      DescNode,
      NotesNode,
      IdNode;

  late TextEditingController Studentctr,
      Coursectr,
      Feesctr,
      Startctr,
      Descctr,
      Notesctr,
      Idctr;

  @override
  void onInit() {
    _getStorage = GetStorage();

    StudentNode = FocusNode();
    CourseNode = FocusNode();
    FeesNode = FocusNode();
    StartNode = FocusNode();
    DescNode = FocusNode();
    NotesNode = FocusNode();
    IdNode = FocusNode();

    Studentctr = TextEditingController();
    Coursectr = TextEditingController();
    Feesctr = TextEditingController();
    Startctr = TextEditingController();
    Descctr = TextEditingController();
    Notesctr = TextEditingController();
    Idctr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  var isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var StudentModel = ValidationModel(null, null, isValidate: false).obs;
  var CourseModel = ValidationModel(null, null, isValidate: false).obs;
  var FeesModel = ValidationModel(null, null, isValidate: false).obs;
  var StartModel = ValidationModel(null, null, isValidate: false).obs;
  var DescModel = ValidationModel(null, null, isValidate: false).obs;
  var NotesModel = ValidationModel(null, null, isValidate: false).obs;
  var IdModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (StudentModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (CourseModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (FeesModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (StartModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (DescModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (NotesModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (IdModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
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
