import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constantes.dart';
import '../../../../providers/log_up_current_page_provider.dart';
import '../../../../widgets/text_navigator.dart';
import 'package:country_picker_plus/country_picker_plus.dart';

class AddressInfo extends StatefulWidget {
  const AddressInfo({super.key});

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  final _formKey = GlobalKey<FormState>();
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    final logUpCurrentPageProvider = Provider.of<LogUpCurrentPageProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryPickerPlus(
                dialogBackgroundColor: Colors.white,
                isRequired: true,
                hideFields: true,
                countrySearchHintText: "Rechercher un pays",
                stateSearchHintText: "Rechercher un etat",
                citySearchHintText: "Rechercher une ville",
                countryLabel: "Pays",
                stateLabel: "État",
                cityLabel: "Ville ",
                countryHintText: "Appuyez pour sélectionner le pays",
                stateHintText: "Appuyez pour sélectionner l'etat",
                cityHintText: "Appuyez pour sélectionner la ville",
                bottomSheetDecoration: bottomSheetDecoration,
                decoration: fieldDecoration,
                searchDecoration: searchDecoration,
                onCountrySaved: (value) {},
                onCountrySelected: (value) {},
                onStateSelected: (value) {},
                onCitySelected: (value) {},
              ),
              kDefaultPaddingHeightDouble,
              // ========================Gestion du bouton asynchrone====================
              TextButton(
                  style: kStyleNextBtn,
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      logUpCurrentPageProvider.nextLogUpPage();
                      try {
                      } catch (e) {
                        throw Exception(e);
                      }
                    }
                  },
                  child: Text('Continuer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))
              ),
              // ========================Fin de la gestion du bouton asynchrone====================
              // Retour à la page précedente
              kDefaultPaddingHeight,
              TextNavigator(onTap: (){
                logUpCurrentPageProvider.previousLogUpPage();
              }, ),
            ],
          ),
        ),
      ),
    );
  }
}
