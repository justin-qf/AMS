import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/sign_in_form_validation.dart';
import 'internet_controller.dart';

class AppointmentBookingController extends GetxController {
  late final GetStorage _getStorage;
  final InternetController _networkManager = Get.find<InternetController>();

  late FocusNode CustomerNode,
      ServiceNode,
      SlotNode,
      AmountNode,
      NoteNode,
      RemindNode;

  late TextEditingController Customerctr,
      Servicectr,
      Slotctr,
      Amountctr,
      Notectr,
      Remindctr;

  final formKey = GlobalKey<FormState>();
  RxBool isClickd = false.obs;

  @override
  void onInit() {
    _getStorage = GetStorage();

    CustomerNode = FocusNode();
    ServiceNode = FocusNode();
    SlotNode = FocusNode();
    AmountNode = FocusNode();
    NoteNode = FocusNode();
    RemindNode = FocusNode();

    Customerctr = TextEditingController();

    Servicectr = TextEditingController();
    Slotctr = TextEditingController();
    Amountctr = TextEditingController();
    Notectr = TextEditingController();
    Remindctr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  void setOnClick(bool isClick) {
    isClickd.value = !isClick;
    update();
  }

  var isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var CustomerModel = ValidationModel(null, null, isValidate: false).obs;
  var ServiceModel = ValidationModel(null, null, isValidate: false).obs;
  var SlotModel = ValidationModel(null, null, isValidate: false).obs;
  var AmountModel = ValidationModel(null, null, isValidate: false).obs;
  var NoteModel = ValidationModel(null, null, isValidate: false).obs;
  var RemindModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (CustomerModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (ServiceModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (SlotModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (AmountModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (NoteModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (RemindModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validateCustomer(String? val) {
    CustomerModel.update((model) {
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

  void validateService(String? val) {
    ServiceModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Service Name";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateAmount(String? val) {
    AmountModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Amount";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateNote(String? val) {
    NoteModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Enter Notes";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateRemind(String? val) {
    RemindModel.update((model) {
      if (val != null && val.isEmpty) {
        model!.error = "Reminder for Customer";
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
