import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'size.dart';

class CustomTextField extends StatelessWidget {
  late final double? _width;
  late final double? _height;
  late final double? _prefixIconHeight;
  late final double? _prefixIconWidth;

  late final int _maxLines;
  late final int? _minLines;
  late final int? _maxLength;

  late final TextEditingController? _controller;

  late final BorderRadius? _border;

  late final String _hintKey;
  late final String? _prefixIconName;
  late final String? _headerKey;
  late final bool _expands;
  late final bool _obscureText;

  late final Widget? _suffixIcon;

  late final TextStyle? _hintStyle;

  late final void Function(String)? _onChange;

  late final TextInputType _keyboardType;

  CustomTextField({
    Key? key,
    double? width,
    double? height,
    double? prefixIconHeight,
    double? prefixIconWidth,
    int maxLines = 1,
    int? minLines,
    int? maxLength,
    bool expands = false,
    bool obscureText = false,
    TextEditingController? controller,
    BorderRadius? border,
    required String hintKey,
    String? prefixIconName,
    String? headerKey,
    Widget? suffixIcon,
    TextStyle? hintStyle,
    void Function(String)? onChange,
    TextInputType keyboardType = TextInputType.text,
  }) : super(key: key) {
    _border = border;
    _controller = controller;
    _expands = expands;
    _hintKey = hintKey;
    _headerKey = headerKey;
    _hintStyle = hintStyle;
    _height = height;
    _maxLength = maxLength;
    _maxLines = maxLines;
    _minLines = minLines;
    _obscureText = obscureText;
    _prefixIconHeight = prefixIconHeight;
    _prefixIconName = prefixIconName;
    _prefixIconWidth = prefixIconWidth;
    _suffixIcon = suffixIcon;
    _width = width;
    _onChange = onChange;
    _keyboardType = keyboardType;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_headerKey != null)
          Text(
            _headerKey!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        if (_headerKey != null) SizedBox(height: _size.height(17)),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Container(
            width: _width,
            height: _height ?? 72,
            decoration: BoxDecoration(
              borderRadius: _border ?? BorderRadius.circular(_size.width(14)),
              color: const Color.fromRGBO(236, 238, 244, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: TextField(
                      maxLength: _maxLength,
                      expands: _expands,
                      maxLines: _expands ? null : _maxLines,
                      minLines: _expands ? null : _minLines,
                      controller: _controller,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: _hintKey,
                        hintStyle: _hintStyle ??
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: const Color.fromRGBO(196, 198, 204, 1)),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: _size.width(15),
                        ),
                      ),
                      obscureText: _obscureText,
                      onChanged: _onChange,
                      keyboardType: _keyboardType,
                    ),
                  ),
                ),
                _suffixIcon ?? Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
