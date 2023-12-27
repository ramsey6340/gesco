import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:gesco/widgets/text_navigator.dart';
import 'package:provider/provider.dart';

import '../../../../constantes.dart';
import '../../../../providers/log_up_current_page_provider.dart';
import '../../../../widgets/text_link.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  final _formKey = GlobalKey<FormState>();
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  String otpProposedCode = '';

  @override
  Widget build(BuildContext context) {
    final logUpCurrentPageProvider =
        Provider.of<LogUpCurrentPageProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Le code expirera dans ...",
                  ),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 30.0, end: 0.0),
                    duration: const Duration(seconds: 30),
                    builder: (context, value, child) => Text(
                      "00:${value.toInt()}",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                    onEnd: () {},
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPaddingLogUpPage,
              ),
              otpInput(),
              SizedBox(
                height: kDefaultPadding,
              ),
              // ========================Gestion du bouton asynchrone====================
              TextButton(
                  style: kStyleNextBtn,
                  onPressed: () {
                    logUpCurrentPageProvider.nextLogUpPage();
                  },
                  child: Text('Continuer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
              // ========================Fin de la gestion du bouton asynchrone====================
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLink(
                    text: "Renvoyer un nouveau code",
                    onTap: () {
                    },
                  ),
                ],
              ),

              // Retour à la page précedente
              const SizedBox(
                height: 20,
              ),
              TextNavigator(
                onTap: () {
                  logUpCurrentPageProvider.previousLogUpPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Les 5 cellule de code OTP
  Widget otpInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // La cellule 1 parmit les 4 cellules
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultOTPPadding),
          width: kDefaultOTPFieldWidth,
          height: kDefaultOTPFieldWidth,
          child: TextFormField(
            controller: textEditingController1,
            cursorColor: kTextColor,
            autofocus: true,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpFieldDecoration, // la decoration du cellule
            onChanged: (value) {
              nextField(value: value, focusNode: pin2FocusNode);
            },
          ),
        ),
        // La cellule 2 parmit les 4 cellules
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultOTPPadding),
          width: kDefaultOTPFieldWidth,
          height: kDefaultOTPFieldWidth,
          child: TextFormField(
            controller: textEditingController2,
            cursorColor: kTextColor,
            focusNode: pin2FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpFieldDecoration, // la decoration du cellule
            onChanged: (value) {
              nextField(value: value, focusNode: pin3FocusNode);
            },
          ),
        ),
        // La cellule 3 parmit les 4 cellules
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultOTPPadding),
          width: kDefaultOTPFieldWidth,
          height: kDefaultOTPFieldWidth,
          child: TextFormField(
            controller: textEditingController3,
            cursorColor: kTextColor,
            focusNode: pin3FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpFieldDecoration, // la decoration du cellule
            onChanged: (value) {
              nextField(value: value, focusNode: pin4FocusNode);
            },
          ),
        ),
        // La cellule 4 parmit les 4 cellules
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultOTPPadding),
          width: kDefaultOTPFieldWidth,
          height: kDefaultOTPFieldWidth,
          child: TextFormField(
            controller: textEditingController4,
            cursorColor: kTextColor,
            focusNode: pin4FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpFieldDecoration, // la decoration du cellule
            onChanged: (value) {
              nextField(value: value, focusNode: pin5FocusNode);
            },
          ),
        ),
        // La cellule 5 parmit les 5 cellules
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultOTPPadding),
          width: kDefaultOTPFieldWidth,
          height: kDefaultOTPFieldWidth,
          child: TextFormField(
            controller: textEditingController5,
            cursorColor: kTextColor,
            focusNode: pin5FocusNode,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            decoration: otpFieldDecoration, // la decoration du cellule
            onChanged: (value) {
              pin5FocusNode.unfocus();
            },
          ),
        ),
      ],
    );
  }
}
