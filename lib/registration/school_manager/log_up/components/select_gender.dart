import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:gesco/size_config.dart';
import 'package:provider/provider.dart';
import '../../../../constantes.dart';
import '../../../../providers/log_up_current_page_provider.dart';
import '../../../../widgets/radio_gender.dart';
import '../../../../widgets/text_navigator.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final logUpCurrentPageProvider =
        Provider.of<LogUpCurrentPageProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(mediaQueryData, 50)),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioGender(
                    radioValue: GenderType.man,
                    radioGroupValue: _selectedGender,
                    onChanged: (value){
                      setState(() {
                        _selectedGender = value;
                      });
                    },

                    width: getProportionateScreenWidth(mediaQueryData, 150),
                    height: getProportionateScreenWidth(mediaQueryData, 150),
                    backgroundColor: Colors.blue.withOpacity(0.5),
                    title: 'Homme',
                    imagePath: 'images/man.png',
                  ),
                  kDefaultPaddingWidth,
                  RadioGender(
                    radioValue: GenderType.women,
                    radioGroupValue: _selectedGender,
                    onChanged: (value){
                      setState(() {
                        _selectedGender = value;
                      });
                    },

                    width: getProportionateScreenWidth(mediaQueryData, 150),
                    height: getProportionateScreenWidth(mediaQueryData, 150),
                    backgroundColor: Colors.purple.withOpacity(0.5),
                    title: 'Femme',
                    imagePath: 'images/women.png',
                    fillColor: Colors.purple,
                  ),
                ],
              ),
              kDefaultPaddingHeightDouble,
              // ========================Gestion du bouton asynchrone====================
              AsyncTextBtn(
                style: kStyleNextBtn,
                asyncBtnStatesController: btnStateController,
                onPressed: () async {
                  btnStateController.update(AsyncBtnState.loading);

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //logUpCurrentPageProvider.nextLogUpPage();
                    try {
                      /*==============================Fin du test==================*/
                    } catch (e) {
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
              // Retour à la page précedente
              kDefaultPaddingHeight,
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
}
