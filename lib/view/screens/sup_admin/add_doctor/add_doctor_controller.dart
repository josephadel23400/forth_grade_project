import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../model/specialty_model.dart';

class AddNewDoctorController extends GetxController {
  SettingServices share = Get.find();
  RxList<SpecialtyModel>? specialtyData1 = <SpecialtyModel>[].obs;
  bool done = false;
  bool gender = true;
  bool isMale = true;
  String? id;
  String? specialty;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  int? endIn;
  int? startIn;
  int? age;
  int? nationalId;
  int? phone;
  String? certificate;
  Future<void> createDoctorAccount() async {
    try {
      if (specialty != null &&
          name != null &&
          email != null &&
          age != null &&
          password != null &&
          confirmPassword != null &&
          endIn != null &&
          startIn != null &&
          nationalId != null &&
          phone != null &&
          certificate != null &&
          password == confirmPassword) {
        try {
          final auth = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email!, password: password!);
          id = auth.user!.uid;
          print('\n account created successfully \n');
        } catch (e) {
          print('\n e \n');
        }
        if (id != null) {
          final newDoctor = FirebaseFirestore.instance.collection('doctors');
          await newDoctor.add({
            'userId': id,
            'specialty': specialty,
            'name': name,
            'email': email,
            'password': password,
            'gender': gender,
            'age': age,
            'nationalId': nationalId,
            'phone': phone,
            'certificate': certificate,
            'endIn': endIn,
            'hospitalId': share.share.getString('id'),
            'startIn': startIn,
          });
          print('\n doctor added successfully \n');
          final newDoctorRole = FirebaseFirestore.instance.collection('role');
          await newDoctorRole.add({
            'id': id,
            'role': 'doctor',
          });
          print('\n doctor role added successfully \n');

          final newDoctorSpecialty = await FirebaseFirestore.instance
              .collection('specialty')
              .where('hospitalId', isEqualTo: share.share.getString('id'))
              .get();

// Check if any documents were found
          if (newDoctorSpecialty.docs.isNotEmpty) {
            // Get the first document (assuming there's only one)
            final doc = newDoctorSpecialty.docs.first;

            // Get the document reference
            DocumentReference specialtyRef =
                FirebaseFirestore.instance.collection('specialty').doc(doc.id);

            // Get the data as a map
            Map<String, dynamic> data = doc.data();

            // Get the specialty data from the map
            dynamic specialtyData = data['specialty'];

            // If specialty data is null or not a Map<String, List<String>>, create a new empty map
            specialtyData ??= {};

            // Get the current array of doctor IDs for the specified specialty

              // Get the current array of doctor IDs for the specified specialty
              dynamic doctors = specialtyData[specialty];

              // If doctors array is null, create a new empty list
              doctors ??= [];

              // Add the new doctor ID to the array
              doctors.add(id!);

              // Update the specialty map with the new array of doctor IDs
              specialtyData[specialty!] = doctors;

              // Update the specialty document in Firestore
              await specialtyRef.update({'specialty': specialtyData});
              done= true;
              print('Doctor added to specialty successfully');

            print('Doctor added to specialty successfully');
///////////////////////////
          }
        }
      } else {
        print('\n id = null \n');
      }
    } catch (e) {
      print('Error adding doctor to specialty: $e');
    }
  }
}
