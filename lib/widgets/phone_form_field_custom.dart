import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constantes.dart';


class PhoneFormFieldCustom extends StatelessWidget {
  const PhoneFormFieldCustom({
    Key? key,
    this.controller,
    this.initialCountryCode='ML',
    this.initialValue,
    this.hintText,
    this.searchText='Rechercher un pays',
    this.invalidNumberMessage='',
    this.borderSideColor=Colors.black,
    this.focusBorderSideColor=kPrimaryColor,
    this.fillColor=Colors.white,
    this.hintTextColor=kTextColor,
    this.cursorColor=Colors.black,
    this.inputTextColor=Colors.black,
    this.onCountryChanged,
    this.onChanged,
    this.onSaved,
    this.errorBorderColor=Colors.black,
    this.focusErrorBorderColor=Colors.black,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? initialCountryCode;
  final String? initialValue;
  final String? hintText;
  final String searchText;
  final String? invalidNumberMessage;
  final Color borderSideColor;
  final Color errorBorderColor;
  final Color focusErrorBorderColor;
  final Color focusBorderSideColor;
  final Color fillColor;
  final Color hintTextColor;
  final Color cursorColor;
  final Color inputTextColor;
  final void Function(Country)? onCountryChanged;
  final void Function(PhoneNumber)? onChanged;
  final Function(PhoneNumber?)? onSaved;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Colors.white,
        width: MediaQuery.sizeOf(context).width*0.8,
        height: MediaQuery.sizeOf(context).height*0.8,
        searchFieldPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        searchFieldInputDecoration: InputDecoration(
          filled: true,
          hintText: "Rechercher un pays",
          hintStyle: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w400,
          ),
          prefixIconColor: kPrimaryColor,
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(kInputBorderRadius),
          ),
        )
      ),
      controller: controller,
      dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.black54,),
      disableLengthCheck: false,
      searchText: searchText,
      invalidNumberMessage: invalidNumberMessage,
      dropdownTextStyle: TextStyle(color: hintTextColor, fontWeight: FontWeight.bold),
      style: TextStyle(color: inputTextColor, fontSize: 12),
      cursorColor: cursorColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: hintTextColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: borderSideColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: focusBorderSideColor,)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: errorBorderColor,)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: focusErrorBorderColor)
        ),
      ),
      initialCountryCode: 'ML',
      initialValue: initialValue,
      onCountryChanged: onCountryChanged,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
    );
  }
}