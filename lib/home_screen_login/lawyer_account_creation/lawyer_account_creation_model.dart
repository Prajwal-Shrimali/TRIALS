import '/flutter_flow/flutter_flow_util.dart';
import 'lawyer_account_creation_widget.dart' show LawyerAccountCreationWidget;
import 'package:flutter/material.dart';

class LawyerAccountCreationModel
    extends FlutterFlowModel<LawyerAccountCreationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for BarID widget.
  FocusNode? barIDFocusNode;
  TextEditingController? barIDController;
  String? Function(BuildContext, String?)? barIDControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPassLawyer widget.
  FocusNode? confirmPassLawyerFocusNode;
  TextEditingController? confirmPassLawyerController;
  late bool confirmPassLawyerVisibility;
  String? Function(BuildContext, String?)? confirmPassLawyerControllerValidator;
  // State field(s) for Phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberController;
  String? Function(BuildContext, String?)? phonenumberControllerValidator;
  // State field(s) for AadharNumber widget.
  FocusNode? aadharNumberFocusNode;
  TextEditingController? aadharNumberController;
  String? Function(BuildContext, String?)? aadharNumberControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPassLawyerVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    userNameFocusNode?.dispose();
    userNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    barIDFocusNode?.dispose();
    barIDController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPassLawyerFocusNode?.dispose();
    confirmPassLawyerController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberController?.dispose();

    aadharNumberFocusNode?.dispose();
    aadharNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
