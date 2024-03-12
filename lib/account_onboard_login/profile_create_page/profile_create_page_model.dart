import '/account_onboard_login/edit_profile_component/edit_profile_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_create_page_widget.dart' show ProfileCreatePageWidget;
import 'package:flutter/material.dart';

class ProfileCreatePageModel extends FlutterFlowModel<ProfileCreatePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for EditProfileComponent component.
  late EditProfileComponentModel editProfileComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    editProfileComponentModel =
        createModel(context, () => EditProfileComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editProfileComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
