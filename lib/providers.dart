import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/Repository/authrepo.dart';

final authprovider = Provider((ref) {
  //provider for auth repository
  return AuthRepo();
});
final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, User?>(AuthNotifier.new);


class AuthNotifier extends AsyncNotifier<User?>{
 late final AuthRepo _auth;
  @override
  Future<User? >build()async{
 _auth=ref.read(authprovider);


  _auth.authStateChanges().listen((user){

    state=AsyncData(user);

  });

  return FirebaseAuth.instance.currentUser;
  }

  Future<void> signup(String email,String password) async {
    state= AsyncLoading();

    try{
      await _auth.signup(email, password);

    }catch(e){
      state=AsyncError(e,StackTrace.current);
    }
  }

  Future<void> login(String email,String password) async{

    state=AsyncLoading();

    try{

await _auth.login(email, password);
    }catch(e){
      state=AsyncError(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    state=AsyncLoading();

    try{
      await _auth.logout();
    }catch(e){
      state=AsyncError(e, StackTrace.current);
    }
 


  }
}

