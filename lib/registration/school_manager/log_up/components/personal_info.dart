import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:gesco/size_config.dart';
import 'package:gesco/widgets/profile_img.dart';
import 'package:gesco/widgets/text_form_field_custom.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';
import '../../../../constantes.dart';
import '../../../../providers/log_up_current_page_provider.dart';
import '../../../../widgets/phone_form_field_custom.dart';
import '../../../../widgets/text_navigator.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();
  TextEditingController _birthDateController = TextEditingController();
  String? _birthDateErrorMessage;


  bool _isValidDate(String date) {
    try {
      List<String> parts = date.split('/');
      if (parts.length != 3) return false;

      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      if (day < 1 || day > 31 || month < 1 || month > 12) return false;

      DateTime currentDate = DateTime.now();
      int currentYear = currentDate.year;

      if (currentYear - year < 0 || currentYear - year > 100) return false;

      return true;
    } catch (e) {
      return false;
    }
  }

  final _pickedImages = <Image>[];

  Future<void> _pickImage() async {
    final fromPicker = await ImagePickerWeb.getImageAsWidget();
    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final logUpCurrentPageProvider =
        Provider.of<LogUpCurrentPageProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(mediaQueryData, 50)),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImg(
                image: (_pickedImages.isNotEmpty)? _pickedImages[0] : null,
                  profileImg: 'assets/images/avatar.jpg',
                showIconAction: true,
                pressShowImg: () {
                  _pickImage();
                },
              ),
              kDefaultPaddingHeightDouble, // espacement vertical
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: PhoneFormFieldCustom()),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormFieldCustom(
                          controller: _birthDateController,
                          label: Text(
                            "Date de Naissance (MM/DD/YYYY)",
                            style: kTextFieldLabelStyle,
                          ),
                          hintText: 'Ex: 10/10/2000',
                          maxLength: 10,
                          onChanged: (text) {
                            if (text.length == 2 || text.length == 5) {
                              _birthDateController.text = "$text/";
                              _birthDateController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: _birthDateController.text.length),
                              );
                            }
                            if (text.length == 10) {
                              print("Taille: ${text.length}");
                              if (!_isValidDate(text)) {
                                setState(() {
                                  _birthDateErrorMessage =
                                      'Date de naissance invalide';
                                });
                              }
                            } else {
                              setState(() {
                                _birthDateErrorMessage = null;
                              });
                            }
                          },
                        ),
                        Visibility(
                            visible: _birthDateErrorMessage != null,
                            child: Text(
                              "$_birthDateErrorMessage",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                  ),
                ],
              ),

              kDefaultPaddingHeightDouble, // espacement vertical
              // ========================Gestion du bouton asynchrone====================
              TextButton(
                style: kStyleNextBtn,
                  onPressed: (){
                    logUpCurrentPageProvider.nextLogUpPage();
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
