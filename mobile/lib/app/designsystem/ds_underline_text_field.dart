import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_divider.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSUnderlineTextField extends StatefulWidget {
  final ValueChanged<String> onChange;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  const DSUnderlineTextField(
      {required this.onChange,
      this.textInputAction,
      this.textInputType,
      this.textCapitalization,
      this.hintText = '',
      this.obscureText = false,
      this.enableSuggestions = true,
      this.autocorrect = true,
      this.validator,
      this.maxLine = 1,
      Key? key})
      : super(key: key);

  @override
  _DSUnderlineTextFieldState createState() => _DSUnderlineTextFieldState();
}

class _DSUnderlineTextFieldState extends State<DSUnderlineTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  String errorText = '';

  bool get _shouldShowErrorMessage => errorText.isNotEmpty;

  void _onFocus() {
    _focusNode.addListener(() {
      /// TODO: Impl
    });
  }

  void _onTextChanged() {
    _controller.addListener(() {
      final value = _controller.text;
      widget.onChange.call(value);
      setState(() {
        errorText = widget.validator?.call(value) ?? '';
      });
    });
  }

  void _onClearTap() {
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    _onFocus();
    _onTextChanged();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: widget.textInputType,
                    maxLines: widget.maxLine,
                    textInputAction: widget.textInputAction,
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                    obscureText: widget.obscureText,
                    enableSuggestions: widget.enableSuggestions,
                    autocorrect: widget.autocorrect,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: DSTextStyle.tsMontserratT12R
                            .copyWith(color: Colors.white.withOpacity(0.5))),
                  ),
                ),
                const SizedBox(width: 5),
                _ClearWidget(
                  onTap: _onClearTap,
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          DSDivider.horizontal(),
          if (_shouldShowErrorMessage) _ErrorMessageWidget(errorText: errorText)
        ],
      );
}

class _ClearWidget extends StatelessWidget {
  final VoidCallback onTap;
  const _ClearWidget({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              AppAssets.icClear,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({
    required this.errorText,
    Key? key,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                errorText,
                style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.red),
              ))
        ],
      );
}
