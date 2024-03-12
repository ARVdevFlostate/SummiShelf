import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_component_widget.dart' show EditProfileComponentWidget;
import 'package:flutter/material.dart';

class EditProfileComponentModel
    extends FlutterFlowModel<EditProfileComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for displaynameTextField widget.
  FocusNode? displaynameTextFieldFocusNode;
  TextEditingController? displaynameTextFieldController;
  String? Function(BuildContext, String?)?
      displaynameTextFieldControllerValidator;
  String? _displaynameTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your display name';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    displaynameTextFieldControllerValidator =
        _displaynameTextFieldControllerValidator;
  }

  @override
  void dispose() {
    displaynameTextFieldFocusNode?.dispose();
    displaynameTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
