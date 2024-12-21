import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class PayMeTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final Function(String)? validator;
  final Function(String)? onSaved;
  final void Function()? onClear;
  final FocusNode? focusNode;

  const PayMeTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon = const Icon(
      Iconsax.close_circle,
      color: PayMeColors.white,
    ),
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.validator,
    this.onSaved,
    this.onClear,
    this.focusNode,
  });

  @override
  State<PayMeTextField> createState() => _PayMeTextFieldState();
}

class _PayMeTextFieldState extends State<PayMeTextField> {
  @override
  Widget build(BuildContext context) {
    bool showClearIcon = widget.controller.text.isNotEmpty;
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: (value) {
        setState(() {
          showClearIcon = value.isNotEmpty;
        });

        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: showClearIcon
            ? IconButton(
                onPressed: () {
                  widget.controller.clear();
                  widget.onClear?.call();
                  setState(() {
                    showClearIcon = false;
                  });
                },
                icon: widget.suffixIcon,
              )
            : null,
        hintStyle: TextStyle(
          fontFamily: PayMeTexts.fontMontserrat,
          fontSize: 20,
          color: PayMeColors.text(context),
          fontWeight: FontWeight.normal,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: PayMeColors.text(context),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: PayMeColors.text(context),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: PayMeColors.text(context),
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: PayMeTexts.fontMontserrat,
        fontSize: PayMeSizes.figmaRatioWidth(context, 16),
        color: PayMeColors.text(context),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
