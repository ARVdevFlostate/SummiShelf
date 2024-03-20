import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'edit_profile_component_model.dart';
export 'edit_profile_component_model.dart';

class EditProfileComponentWidget extends StatefulWidget {
  const EditProfileComponentWidget({
    super.key,
    String? title,
    String? buttonText,
    required this.navigateAction,
  })  : title = title ?? 'Create/ Edit Profile',
        buttonText = buttonText ?? 'Create / Save';

  final String title;
  final String buttonText;
  final Future Function()? navigateAction;

  @override
  State<EditProfileComponentWidget> createState() =>
      _EditProfileComponentWidgetState();
}

class _EditProfileComponentWidgetState
    extends State<EditProfileComponentWidget> {
  late EditProfileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileComponentModel());

    _model.displaynameTextFieldController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.displaynameTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: FlutterFlowTheme.of(context).displaySmall,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: Text(
              'Change the details of your profile',
              style: FlutterFlowTheme.of(context).labelLarge,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent2,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondary,
                    width: 2.0,
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/defaultAvatar-v2.png',
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if ((currentUserPhoto != '') &&
                            (_model.uploadedFileUrl == '')) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 200),
                              fadeOutDuration: const Duration(milliseconds: 200),
                              imageUrl: valueOrDefault<String>(
                                currentUserPhoto,
                                'https://firebasestorage.googleapis.com/v0/b/summi-shelf-z6nbpi.appspot.com/o/assets%2FdefaultAvatar-v2.png?alt=media&token=706a34fc-8a48-4f5f-8831-7c860e0773a9',
                              ),
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 200),
                              fadeOutDuration: const Duration(milliseconds: 200),
                              imageUrl: valueOrDefault<String>(
                                _model.uploadedFileUrl,
                                'https://firebasestorage.googleapis.com/v0/b/summi-shelf-z6nbpi.appspot.com/o/assets%2FdefaultAvatar-v2.png?alt=media&token=706a34fc-8a48-4f5f-8831-7c860e0773a9',
                              ),
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 32.0),
              child: FFButtonWidget(
                onPressed: () async {
                  final selectedMedia = await selectMedia(
                    maxWidth: 300.00,
                    maxHeight: 300.00,
                    mediaSource: MediaSource.photoGallery,
                    multiImage: false,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }

                  setState(() {});
                },
                text: 'Change Photo',
                options: FFButtonOptions(
                  height: 44.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent2,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
          ),
          AuthUserStreamWidget(
            builder: (context) => SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.displaynameTextFieldController,
                focusNode: _model.displaynameTextFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.displaynameTextFieldController',
                  const Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Display name',
                  labelStyle: FlutterFlowTheme.of(context).labelLarge,
                  hintText: 'Enter your display name',
                  hintStyle: FlutterFlowTheme.of(context).labelLarge,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  prefixIcon: Icon(
                    Icons.person_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 18.0,
                  ),
                  suffixIcon:
                      _model.displaynameTextFieldController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.displaynameTextFieldController?.clear();
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 18.0,
                              ),
                            )
                          : null,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge,
                cursorColor: FlutterFlowTheme.of(context).primary,
                validator: _model.displaynameTextFieldControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (_model.formKey.currentState == null ||
                    !_model.formKey.currentState!.validate()) {
                  return;
                }
                if (widget.title == 'Create Profile') {
                  await currentUserReference!.update(createUsersRecordData(
                    displayName: _model.displaynameTextFieldController.text,
                    photoUrl: _model.uploadedFileUrl != ''
                        ? _model.uploadedFileUrl
                        : valueOrDefault<String>(
                            currentUserPhoto,
                            'https://firebasestorage.googleapis.com/v0/b/summi-shelf-z6nbpi.appspot.com/o/assets%2FdefaultAvatar-v2.png?alt=media&token=706a34fc-8a48-4f5f-8831-7c860e0773a9',
                          ),
                    isFreeUser: true,
                  ));
                } else {
                  await currentUserReference!.update(createUsersRecordData(
                    displayName: _model.displaynameTextFieldController.text,
                    photoUrl: _model.uploadedFileUrl != ''
                        ? _model.uploadedFileUrl
                        : valueOrDefault<String>(
                            currentUserPhoto,
                            'https://firebasestorage.googleapis.com/v0/b/summi-shelf-z6nbpi.appspot.com/o/assets%2FdefaultAvatar-v2.png?alt=media&token=706a34fc-8a48-4f5f-8831-7c860e0773a9',
                          ),
                  ));
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Profile has been updated!',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).info,
                          ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
                await widget.navigateAction?.call();
              },
              text: widget.buttonText,
              options: FFButtonOptions(
                width: double.infinity,
                height: 44.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              showLoadingIndicator: false,
            ),
          ),
        ],
      ),
    );
  }
}
