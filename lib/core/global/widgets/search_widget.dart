import 'package:flutter/material.dart';
import 'package:map/core/theme/app_pallet.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusScopeNode? focusScopeNode;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final VoidCallback? onCancelTap;
  final String Function(String?)? validate;
  final bool? isOutLined;
  final bool? isOnSearchPage;
  final bool? readOnly;
  final bool? autoFocus;
  final bool? loading;
  final bool? isShowCancel;

  const SearchWidget({
    super.key,
    required this.controller,
    this.focusScopeNode,
    this.onTap,
    this.onChange,
    this.onSubmitted,
    this.onTapOutside,
    this.onCancelTap,
    this.validate,
    this.isOutLined,
    this.isOnSearchPage,
    this.readOnly,
    this.autoFocus,
    this.loading,
    this.isShowCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 60),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(30),
          border:
              isOutLined == true
                  ? Border.all(width: 1, color: greyColor)
                  : Border.all(width: 1, color: Colors.transparent),
          boxShadow:
              isOutLined == true
                  ? []
                  : [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0),
                    ),
                  ],
        ),
        child: TextFormField(
          autocorrect: autoFocus ?? false,
          readOnly: readOnly ?? false,
          focusNode: focusScopeNode,
          controller: controller,
          onChanged: onChange,
          validator: validate,
          onTap: onTap,
          onTapOutside: onTapOutside,
          onFieldSubmitted: onSubmitted,
          cursorColor: primaryColorLight,
          keyboardAppearance: Brightness.dark,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: "Search here",
            hintStyle: TextStyle(color: greyColorLight),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            border: InputBorder.none,
            prefixIcon:
                isOnSearchPage == true
                    ? GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: Icon(Icons.arrow_back, size: 25),
                    )
                    : Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Wrap(
                        children: [
                          SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset(
                              "assets/images/app_logo.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
            suffixIcon: Padding(
              padding: EdgeInsets.zero,
              child:
                  isShowCancel == true
                      ? GestureDetector(
                        onTap: onCancelTap,
                        child: Icon(Icons.close, size: 30),
                      )
                      : Icon(Icons.keyboard_voice, size: 30),
            ),
          ),
        ),
      ),
    );
  }
}

