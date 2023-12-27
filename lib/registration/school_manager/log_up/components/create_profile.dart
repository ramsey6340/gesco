import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:gesco/registration/school_manager/log_in/log_in_screen.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:gesco/widgets/text_form_field_custom.dart';
import 'package:gesco/widgets/text_link.dart';
import 'package:provider/provider.dart';

import '../../../../constantes.dart';
import '../../../../providers/log_up_current_page_provider.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordEditingController = TextEditingController();
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();

  String _password = '';
  double _passwordStrength = 0.0;

  @override
  Widget build(BuildContext context) {
    final logUpCurrentPageProvider =
        Provider.of<LogUpCurrentPageProvider>(context);

    final passNotifier = ValueNotifier<PasswordStrength?>(null);

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
                  "Nom complet",
                  style: kTextFieldLabelStyle,
                ),
                hintText: 'Ex: Drissa Sidiki Traore',
              ),
              TextFormFieldCustom(
                label: Text(
                  "Email",
                  style: kTextFieldLabelStyle,
                ),
                hintText: 'Ex: example@gmail.com',
              ),

              if (MediaQuery.of(context).size.width >= 1100)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:
                          4, // Utilisez une fraction (ici, 4/10) pour définir la largeur proportionnelle
                      child: Column(
                        children: [
                          TextFormFieldCustom(
                            //controller: _passwordEditingController,
                            isPassword: true,
                            label: Text(
                              "Mot de passe",
                              style: kTextFieldLabelStyle,
                            ),
                            hintText: 'Ex: ***********',
                            onChanged: (value) {
                              passNotifier.value = PasswordStrength.calculate(text: value);

                              if(passNotifier.value!.widthPerc>=0.4){
                                print("C'est cool");
                              }
                             // NB: Ne met pas de setState ici car cela apêche la bar de niveau du mot de passe
                             // de changer. Moi même je n'ai pas compris pourquoi
                            },
                          ),
                          PasswordStrengthChecker(
                            strength: passNotifier,
                            configuration: PasswordStrengthCheckerConfiguration(
                              showStatusWidget: false,
                              height: 10,
                              borderWidth: 1,
                              animationDuration: const Duration(milliseconds: 300),
                              inactiveBorderColor: Colors.grey,
                              externalBorderRadius: const BorderRadius.all(Radius.circular(kInputBorderRadius)),
                              internalBorderRadius: const BorderRadius.all(Radius.circular(kInputBorderRadius)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20), // Espace entre les champs
                    Expanded(
                      flex:
                          4, // Utilisez une fraction (ici, 4/10) pour définir la largeur proportionnelle
                      child: TextFormFieldCustom(
                        isPassword: true,
                        label: Text(
                          "Confirmation",
                          style: kTextFieldLabelStyle,
                        ),
                        hintText: 'Ex: ***********',
                      ),
                    ),
                  ],
                ),
              if (!(MediaQuery.of(context).size.width >= 1100))
                TextFormFieldCustom(
                  isPassword: true,
                  label: Text(
                    "Mot de passe",
                    style: kTextFieldLabelStyle,
                  ),
                  hintText: 'Ex: ***********',
                ),
              if (!(MediaQuery.of(context).size.width >= 1100))
                SizedBox(width: 20),
              if (!(MediaQuery.of(context).size.width >= 1100))
                TextFormFieldCustom(
                  isPassword: true,
                  label: Text(
                    "Confirmation",
                    style: kTextFieldLabelStyle,
                  ),
                  hintText: 'Ex: ***********',
                ),

              kDefaultPaddingHeightDouble,
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
              kDefaultPaddingHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLink(
                    text: "Vous avez déjà un compte ? Se connecter",
                    onTap: () {
                      logUpCurrentPageProvider.initCurrentPageIndex();
                      Navigator.pushNamedAndRemoveUntil(
                          context, LogInScreen.routeName, (route) => false);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
