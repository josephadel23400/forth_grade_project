import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  final user = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');
  String? email;
  String? password;
  int? age;
  bool gender = true;
  int? nationalId;
  int? phone;
  String? name;
  bool isSecure = false;
  bool isMale = true;
  // Constructor to receive screen size
  Future<void> createNewUser() async {
    await user.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    print(user.currentUser!.email);
    print('\n\n\n\n');
  }

  void addUserData() async {
    await fireStore.add({
      'name': name,
      'gender': gender,
      'age': age,
      'nationalId': nationalId,
      'phone': phone,
      'userId': user.currentUser!.uid,
    });
  }

  void showPassword() {
    isSecure = !isSecure;
    update();
  }

  void showGender() {
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
