import '/flutter_flow/flutter_flow_util.dart';
import 'lawyer_account_createfor_u_t_p_widget.dart'
    show LawyerAccountCreateforUTPWidget;
import 'package:flutter/material.dart';

class LawyerAccountCreateforUTPModel
    extends FlutterFlowModel<LawyerAccountCreateforUTPWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameController1;
  String? Function(BuildContext, String?)? nameController1Validator;
  // State field(s) for PrisonerID widget.
  FocusNode? prisonerIDFocusNode;
  TextEditingController? prisonerIDController;
  String? Function(BuildContext, String?)? prisonerIDControllerValidator;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameController2;
  String? Function(BuildContext, String?)? nameController2Validator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordforUTP widget.
  FocusNode? passwordforUTPFocusNode;
  TextEditingController? passwordforUTPController;
  late bool passwordforUTPVisibility;
  String? Function(BuildContext, String?)? passwordforUTPControllerValidator;
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
    passwordforUTPVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode1?.dispose();
    nameController1?.dispose();

    prisonerIDFocusNode?.dispose();
    prisonerIDController?.dispose();

    nameFocusNode2?.dispose();
    nameController2?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    passwordforUTPFocusNode?.dispose();
    passwordforUTPController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberController?.dispose();

    aadharNumberFocusNode?.dispose();
    aadharNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
