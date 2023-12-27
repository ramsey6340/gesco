import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/shool_manager.dart';


class SharedPreferencesService {
  final Future<SharedPreferences> _prefs  = SharedPreferences.getInstance();

  Future<void> setSchoolManager(SchoolManager? currentUser) async{
    // Cette methode permet d'enregistrer les données de l'utilisateur dans le cache,

    final SharedPreferences prefs = await _prefs;
    try{
      String currentUserJson = json.encode(currentUser);
      prefs.setString("currentSchoolManager", currentUserJson);
    }catch(e){
      throw Exception(e);
    }

  }

  Future<SchoolManager?> getSchoolManager() async {
    final SharedPreferences prefs = await _prefs;
    try{
      String? currentUserJson = prefs.getString('currentSchoolManager');
      if (currentUserJson != null) {
        SchoolManager schoolManager = SchoolManager.fromJson(json.decode(currentUserJson));
        return schoolManager;
      }
      return null;
    }catch(e) {
      throw Exception(e);
    }

  }

  Future<void> setFirstInteraction(bool value) async {
    // Cette methode modifie la valeur qui permet de savoir s'il s'agit de la prémière
    // interaction de l'utilisateur avec l'application

    final SharedPreferences prefs = await _prefs;
    try{
      prefs.setBool("firstInteraction", value);
    }catch(e){
      throw Exception(e);
    }
  }

  Future<bool?> isFirstInteraction() async {
    final SharedPreferences prefs = await _prefs;

    try{
      bool? firstInteraction = prefs.getBool('firstInteraction');
      if (firstInteraction != null) {
        return firstInteraction;
      }
      return null;

    }catch(e) {
      throw Exception(e);
    }
  }

}