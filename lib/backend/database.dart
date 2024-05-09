import 'package:pocketbase/pocketbase.dart';
import 'package:aquariuspro/consts.dart';
import 'authenticator.dart';

class Database {
  /*final _pocketBaseObject = PocketBase(kServerAddress);

  void saveAuthenticationTokenToPocketBase(AuthenticationRecord authenticationParam){
    _pocketBaseObject.authStore.save(authenticationParam.token, authenticationParam.recordModel);
  }

  Future<RecordModel> confirmSavedAuthenticationToken() async {
    return _pocketBaseObject.collection('users').getOne(_pocketBaseObject.authStore.model.id);
  }

  Future<RecordAuth> loginWithUserNamePassword(String userName, String password) async {
    return _pocketBaseObject.collection('users').authWithPassword(userName, password);
  }

  void clearSavedAuthentication() {
    _pocketBaseObject.authStore.clear();
  }

  Future<void> createRecord() {
    return Future.delayed(const Duration(milliseconds: 500), () => "Dummy result");
  }

  Future<void> updateRecord() {
    return Future.delayed(const Duration(milliseconds: 500), () => "Dummy result");
  }

  Future<void> queryRecord() {
    return Future.delayed(const Duration(milliseconds: 500), () => "Dummy result");
  }

  void deleteRecord() {

  }*/
}