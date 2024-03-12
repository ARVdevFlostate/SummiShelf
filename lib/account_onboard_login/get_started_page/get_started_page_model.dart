import '/flutter_flow/flutter_flow_util.dart';
import 'get_started_page_widget.dart' show GetStartedPageWidget;
import 'package:flutter/material.dart';

class GetStartedPageModel extends FlutterFlowModel<GetStartedPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  String? _emailTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your email address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  String? _passwordTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your password';
    }

    if (val.length < 10) {
      return 'Password must be 10 or more characters';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailTextFieldControllerValidator = _emailTextFieldControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldControllerValidator =
        _passwordTextFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailTextFieldFocusNode?.dispose();
    emailTextFieldController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
