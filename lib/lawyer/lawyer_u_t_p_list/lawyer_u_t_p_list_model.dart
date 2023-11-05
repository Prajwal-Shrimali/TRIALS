import '/flutter_flow/flutter_flow_util.dart';
import '/lawyer/u_t_p_detail/u_t_p_detail_widget.dart';
import 'lawyer_u_t_p_list_widget.dart' show LawyerUTPListWidget;
import 'package:flutter/material.dart';

class LawyerUTPListModel extends FlutterFlowModel<LawyerUTPListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UTPDetail component.
  late UTPDetailModel uTPDetailModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    uTPDetailModel = createModel(context, () => UTPDetailModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    uTPDetailModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
