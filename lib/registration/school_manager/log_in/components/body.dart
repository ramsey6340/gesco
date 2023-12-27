import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:gesco/widgets/text_form_field_custom.dart';
import 'package:gesco/widgets/text_link.dart';

import '../../../../constantes.dart';
import '../../log_up/log_up_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldCustom(
                label: Text(
                  "Email",
                  style: kTextFieldLabelStyle,
                ),
                hintText: 'Ex: example@gmail.com',
              ),
              TextFormFieldCustom(
                isPassword: true,
                label: Text(
                  "Mot de passe",
                  style: kTextFieldLabelStyle,
                ),
                hintText: 'Ex: ***********',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TextLink(
                    text: "Mot de passe oublie?",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // ========================Gestion du bouton asynchrone====================
              AsyncTextBtn(
                style: kStyleNextBtn,
                asyncBtnStatesController: btnStateController,
                onPressed: () async {
                  btnStateController.update(AsyncBtnState.loading);
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    try {} catch (e) {
                      btnStateController.update(AsyncBtnState.idle);
                      throw Exception(e);
                    }
                  }
                },
                loadingStyle: AsyncBtnStateStyle(
                  style: kStyleNextBtn,
                  widget: const SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
                successStyle: AsyncBtnStateStyle(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                  ),
                  widget: const Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text('Success!',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))
                    ],
                  ),
                ),
                failureStyle: AsyncBtnStateStyle(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  widget: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text('Erreur !',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ),
                child: const Text('Continuer',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              // ========================Fin de la gestion du bouton asynchrone====================

              const SizedBox(
                height: 20,
              ),

              TextLink(
                  text: "Vous n'avez pas de compte ? S'inscrire",
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, LogUpScreen.routeName, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
