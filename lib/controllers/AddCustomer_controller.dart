import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/sign_in_form_validation.dart';
import 'internet_controller.dart';

class AddcustomerController extends GetxController {
  late final GetStorage _getStorage;
  final InternetController _networkManager = Get.find<InternetController>();

  final formKey = GlobalKey<FormState>();

  late FocusNode CustomerNode,
      ProfileNode,
      DobNode,
      DoaNode,
      AddressNode,
      Contact1Node,
      Contact2Node,
      WhatsappNode,
      EmailNode;

  late TextEditingController Customerctr,
      Profilectr,
      Dobctr,
      Doactr,
      Addressctr,
      Contact1ctr,
      Contact2ctr,
      Whatsappctr,
      Emailctr;

  @override
  void onInit() {
    _getStorage = GetStorage();

    CustomerNode = FocusNode();
    ProfileNode = FocusNode();
    DobNode = FocusNode();
    DoaNode = FocusNode();
    AddressNode = FocusNode();
    Contact1Node = FocusNode();
    Contact2Node = FocusNode();
    WhatsappNode = FocusNode();
    EmailNode = FocusNode();

    Customerctr = TextEditingController();
    Profilectr = TextEditingController();
    Dobctr = TextEditingController();
    Doactr = TextEditingController();
    Addressctr = TextEditingController();
    Contact1ctr = TextEditingController();
    Contact2ctr = TextEditingController();
    Whatsappctr = TextEditingController();
    Emailctr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  var isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var customerModel = ValidationModel(null, null, isValidate: false).obs;
  var profileModel = ValidationModel(null, null, isValidate: false).obs;
  var dobModel = ValidationModel(null, null, isValidate: false).obs;
  var doaModel = ValidationModel(null, null, isValidate: false).obs;
  var addressModel = ValidationModel(null, null, isValidate: false).obs;
  var contact1Model = ValidationModel(null, null, isValidate: false).obs;
  var contact2Model = ValidationModel(null, null, isValidate: false).obs;
  var whatsappModel = ValidationModel(null, null, isValidate: false).obs;
  var emailModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (customerModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (profileModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (dobModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (doaModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (addressModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (contact1Model.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (contact2Model.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (whatsappModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (emailModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validateCustomerName(String? val) {
    customerModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Customer Name";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateProfile(String? val) {
    profileModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Select Profile Photo";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateDob(String? val) {
    dobModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Select Date";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateDoa(String? val) {
    doaModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Select Date";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateAddree(String? val) {
    addressModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Address";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateContact1(String? val) {
    contact1Model.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Contact Number 1";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateContact2(String? val) {
    contact2Model.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Contact Number 2";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateWhatsapp(String? val) {
    whatsappModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Whatsapp Number";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateEmail(String? val) {
    emailModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Email Id";
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
