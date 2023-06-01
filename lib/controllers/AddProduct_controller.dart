import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/sign_in_form_validation.dart';
import 'internet_controller.dart';

class ProductController extends GetxController {
  late final GetStorage _getStorage;
  final InternetController _networkManager = Get.find<InternetController>();

  late FocusNode NameNode,
      productimgNode,
      descriptionNode,
      categoryNode,
      amountNode,
      quantitynode;

  late TextEditingController NameCtr,
      productimgCtr,
      descriptionCtr,
      categroryCtr,
      amountCtr,
      quantityCtr;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _getStorage = GetStorage();

    NameNode = FocusNode();
    productimgNode = FocusNode();
    descriptionNode = FocusNode();
    categoryNode = FocusNode();
    amountNode = FocusNode();
    quantitynode = FocusNode();

    NameCtr = TextEditingController();
    productimgCtr = TextEditingController();
    descriptionCtr = TextEditingController();
    categroryCtr = TextEditingController();
    amountCtr = TextEditingController();
    quantityCtr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  var isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var NameModel = ValidationModel(null, null, isValidate: false).obs;
  var productimgModel = ValidationModel(null, null, isValidate: false).obs;
  var descriptionModel = ValidationModel(null, null, isValidate: false).obs;
  var categroryModel = ValidationModel(null, null, isValidate: false).obs;
  var amountModel = ValidationModel(null, null, isValidate: false).obs;
  var quantityModel = ValidationModel(null, null, isValidate: false).obs;

  void validatename(String? val) {
    NameModel.update((model) {
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

  void validateProductimg(String? val) {
    productimgModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Product";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateDescription(String? val) {
    descriptionModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Description";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateCategory(String? val) {
    categroryModel.update((model) {
      if (val == null || val.isEmpty) {
        model!.error = "Enter Category";
        model.isValidate = false;
      } else if (!GetUtils.isEmail(val)) {
        model!.error = "Enter Category";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void validateAmount(String? val) {
    amountModel.update((model) {
      if (val == null || val.isEmpty) {
        model!.error = "Enter Amount";
        model.isValidate = false;
      } else if (val.replaceAll(' ', '').length < 10) {
        model!.error = "Enter Amount";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateQuantity(String? val) {
    quantityModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Quantity";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void enableSignUpButton() {
    if (NameModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (productimgModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (descriptionModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (categroryModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (amountModel.value.isValidate == false) {
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
