import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_state_dynamic_model.dart';
export 'empty_state_dynamic_model.dart';

class EmptyStateDynamicWidget extends StatefulWidget {
  const EmptyStateDynamicWidget({
    super.key,
    this.icon,
    String? title,
    String? body,
    bool? showActionButton,
    this.buttonAction,
    String? buttonText,
  })  : this.title = title ?? 'No Friends',
        this.body = body ??
            'It seems that you dont\' have  any friends, find friends from searching users below.',
        this.showActionButton = showActionButton ?? false,
        this.buttonText = buttonText ?? 'Find friends';

  final Widget? icon;
  final String title;
  final String body;
  final bool showActionButton;
  final Future Function()? buttonAction;
  final String buttonText;

  @override
  State<EmptyStateDynamicWidget> createState() =>
      _EmptyStateDynamicWidgetState();
}

class _EmptyStateDynamicWidgetState extends State<EmptyStateDynamicWidget>
    with TickerProviderStateMixin {
  late EmptyStateDynamicModel _model;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateDynamicModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.icon!,
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
            child: Text(
              widget.body,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium,
            ),
          ),
          if (widget.showActionButton == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.buttonAction?.call();
                },
                text: widget.buttonText,
                options: FFButtonOptions(
                  height: 44.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
        ].divide(SizedBox(height: 8.0)),
      ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
    );
  }
}
