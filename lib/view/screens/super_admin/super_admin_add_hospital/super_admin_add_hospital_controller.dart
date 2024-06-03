import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SuperAdminAddHospitalController extends GetxController {
  bool done = false;
  int? ZEPCode;
  int? emergencyNumber;
  int? phone;
  String? id;
  String? address;
  String? location;
  String? managerName;
  String? name;
  String? password;
  String? confirmPassword;
  String? subAdmin;
  String? type;
  Future<void> createHospitalAccount() async {
    try {
      if (ZEPCode != null &&
          name != null &&
          subAdmin != null &&
          managerName != null &&
          password != null &&
          confirmPassword != null &&
          emergencyNumber != null &&
          address != null &&
          location != null &&
          phone != null &&
          type != null &&
          password == confirmPassword) {
        try {
          final auth = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: subAdmin!, password: password!);
          id = auth.user!.uid;
          print('\n account created successfully \n');
          if (id != null) {
            await FirebaseFirestore.instance.collection('hospitals').add({
              'hospitalId': id,
              'ZEPCode': ZEPCode,
              'name': name,
              'subAdmin': subAdmin,
              'emergencyNumber': emergencyNumber,
              'phone': phone,
              'address': address,
              'location': location,
              'managerName': managerName,
              'type': type,
            });
            await FirebaseFirestore.instance.collection('role').add({
              'id': id,
              'role': 'hospital',
            });
            await FirebaseFirestore.instance.collection('specialty').add({
              'hospitalId': id,
            });
            done = true;
          } else {
            print('id is not found');
          }
        } catch (e) {
          print('\n e \n');
        }
      }
    } catch (e) {
      print('Error adding doctor to specialty: $e');
    }
  }
}
