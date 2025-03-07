import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/user.dart';
import '../model/user_modal.dart';

abstract class UserDataSource{
  Future<UserModal>signup(UserEntity users);
  Future<UserModal>login(String email,String password);
  Future<void>logout();
  Future<bool>isUserLoggedIn();
  Future<void>forgotPassword(String email);
}
class UserDataSourceImplement extends UserDataSource{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final SharedPreferences sharedPreferences;
  UserDataSourceImplement({required this.sharedPreferences,required this.firestore,required this.auth});
  @override
  Future<UserModal> login(String email, String password) async{
    final credentail = await auth.signInWithEmailAndPassword(email: email, password: password);
    final userdata = await firestore.collection("Users").doc(credentail.user!.uid).get();
    await sharedPreferences.setString("uid", credentail.user!.uid);
    return UserModal.fromMap(userdata.data()!, credentail.user!.uid);
  }

  @override
  Future<void> logout()async{
    await auth.signOut();
    await sharedPreferences.remove("uid");
  }

  @override
  Future<UserModal> signup(UserEntity users)async{
    final credentail = await auth.createUserWithEmailAndPassword(email:users.email, password: users.password);
    UserModal userModal = UserModal(
        id: credentail.user!.uid,
        name: users.name,
        email: users.email,
        password: users.password,
    );
    await firestore.collection("Users").doc(userModal.id).set(userModal.tomap());
    await sharedPreferences.setString("uid",userModal.id);
    return userModal;
  }

  @override
  Future<bool> isUserLoggedIn()async{
    return sharedPreferences.containsKey('uid');
  }

  @override
  Future<void>forgotPassword(String email)async{
    await auth.sendPasswordResetEmail(email: email);
  }

}