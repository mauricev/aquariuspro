import 'package:aquariuspro/backend/database.dart';
import 'package:aquariuspro/backend/local_storage.dart';
import 'package:aquariuspro/consts.dart';
import 'package:aquariuspro/utility.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'dart:convert';

class AuthenticationRecord {
  final String token;
  final RecordModel recordModel;
  AuthenticationRecord({required this.token, required this.recordModel});
  String get returnToken => token;
  RecordModel get returnModel => recordModel;
}

class Authenticator extends ChangeNotifier {
  final Database cDatabase;
  final LocalStorage cLocalStorage;
  AuthenticationRecord? _savedAuthenticationInfo;
  bool _hasToken = false;
  bool _isLoading = true;
  bool _isPasswordBad = false;

  /*
  three screens
  loading == screens not ready yet
  hasToken == home screen else login screen
  we want it to come the login screen, hasToken = false

   */

  Authenticator({required this.cDatabase, required this.cLocalStorage}) {
    myDebugPrint("in Authenticator constructor");
    retrieveToken();
  }

  bool get hasToken => _hasToken;
  bool get isLoading => _isLoading;
  bool get isPassWordBad => _isPasswordBad;

  Future<void> retrieveToken() async {
    _hasToken = false;
    _isLoading = false;

    bool tokenRetrieved = await retrieveSavedToken();
    if (tokenRetrieved) {
      _hasToken = await validateSavedToken();
    }
    myDebugPrint("about to call notify, _hasToken $_hasToken");
    notifyListeners();
  }

  Future<bool> retrieveSavedToken() async {
    // remember if this is a new authentication, this will be null
    return false;
    String? authenticationRecordAsJson = await cLocalStorage.retrieveFromSecureStorage(kAuthenticationInfo);
    if (authenticationRecordAsJson != null) {
      try {
        final authenticationRecordAsJsonDecoded = jsonDecode(authenticationRecordAsJson);
        if (authenticationRecordAsJsonDecoded == null) return false;

        final String token = authenticationRecordAsJsonDecoded['token'];
        final RecordModel modelRecord = RecordModel.fromJson(authenticationRecordAsJsonDecoded['record']);

        _savedAuthenticationInfo = AuthenticationRecord(token: token, recordModel: modelRecord);

        return true;
      } catch (error) {
        myDebugPrint('Error in retrieveSavedToken: $error');
        return false;
      }
    }
    return false;
  }

  Future<bool> validateSavedToken() async {
    return false;
    if (_savedAuthenticationInfo == null) return false;
    //cDatabase.saveAuthenticationTokenToPocketBase(_savedAuthenticationInfo!);
    try {
      //await cDatabase.confirmSavedAuthenticationToken();
      return true;
    } catch (error) {
      myDebugPrint('Error in validateSavedToken: $error');
      //cDatabase.clearSavedAuthentication();
    }
    return false;
  }

  String? convertRecordAuthToJsonString(RecordAuth recordAuth) {
    if (recordAuth.record == null ) return null;
    final Map<String,dynamic> recordAuthMap = {
      'token': recordAuth.token,
      'record': recordAuth.record!.toJson(),
    };
    return jsonEncode(recordAuthMap);
  }

  Future<void> loginWithUserName(String userName, String password) async {
    _isPasswordBad = false;
    _isLoading = false;
    _hasToken = true; // we are mow logged in!
/*    try {
      RecordAuth recordAuth = await cDatabase.loginWithUserNamePassword(userName,password);
      // if recordAuth doesn't come back cleanly, we will probably get an exception
      String? pocketBaseRecordJsonString = convertRecordAuthToJsonString(recordAuth);
      if (pocketBaseRecordJsonString != null) {
        cLocalStorage.setToSecureStorage(kAuthenticationInfo,pocketBaseRecordJsonString);
        _isLoading = false;
        _hasToken = true; // we are logged in!
        myDebugPrint("about to call notify 2");
        notifyListeners();
      }
    } catch (e) {
      myDebugPrint('loginWithUserName 4 of 4, failed: $e');
      _isPasswordBad = true;
      notifyListeners();
      rethrow; // we need this to avoid the then clause from running
    }*/
  }

  // called on logout
  void resetAuthentication() {
    // we clear the saved token and reset the screen to the login page
    myDebugPrint("resetAuthentication before, $_hasToken");
    //cLocalStorage.deleteSecureStorage(kAuthenticationInfo);
    _isPasswordBad = false;
    _isLoading = false; // we are NOT loading; we are headed to the authenticator screen
    _hasToken = false;
    myDebugPrint("resetAuthentication after, $_hasToken");
    notifyListeners();
  }
}

