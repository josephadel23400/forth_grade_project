import 'dart:io';

import 'package:clinic_project/model/hospital_model.dart';
import 'package:clinic_project/services/settingService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HospitalProfileController extends GetxController {
  SettingServices share = Get.find();
  final ImagePicker picker = ImagePicker();
  File? image;
  RxList<HospitalModel> hospitalData = <HospitalModel>[].obs;
  RxString? imageUrl = RxString(''); // Initialize imageUrl with an empty string

  Future<File?> pickPhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return File(photo!.path);
  }

  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return File(image!.path);
  }

  final storageRef = FirebaseStorage.instance.ref();

  void uploadImageToFirebaseStorage() async {
    if (image != null) {
      String fileName = '${share.share.getString('id')!}.jpg';
      TaskSnapshot snapshot = await storageRef.child(fileName).putFile(image!);
      String url = await snapshot.ref.getDownloadURL();
      imageUrl!.value = url;
      await FirebaseFirestore.instance
          .collection('hospitals')
          .doc(share.share.getString('docId'))
          .update({
        'photo': url,
      });
    }
  }

  void updateName() async {
    String name = share.share.getString('val')!;
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'name': name,
    });
  }

  void updateLocation() async {
    String location = share.share.getString('val')!;
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'location': location,
    });
  }

  void updatePhone() async {
    int phone = int.parse(share.share.getString('val')!);

    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'phone': phone,
    });
  }

  void updateMName() async {
    String managerName = share.share.getString('val')!;

    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'managerName': managerName,
    });
  }

  void updateEmergencyNumber() async {
    int emergencyNumber = int.parse(share.share.getString('val')!);

    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'emergencyNumber': emergencyNumber,
    });
  }

  void updateZep() async {
    int ZEPCode = int.parse(share.share.getString('val')!);

    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'ZEPCode': ZEPCode,
    });
  }

  void updateAddress() async {
    String address = share.share.getString('val')!;
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'address': address,
    });
  }

  void updateType() async {
    String type = share.share.getString('val')!;
    await FirebaseFirestore.instance
        .collection('hospitals')
        .doc(share.share.getString('docId'))
        .update({
      'type': type,
    });
  }

  void getImage() async {
    if (hospitalData.isNotEmpty && hospitalData[0].photo != null) {
      imageUrl!.value = await storageRef
          .child(
              'gs://hospital-b5914.appspot.com/doctors/profile_pic_moddb.jpg')
          .getDownloadURL();
    } else {
      imageUrl!.value =
          'https://media.istockphoto.com/id/1905332403/vector/vector-flat-illustration-avatar-user-profile-person-icon-profile-picture-suitable-for-social.jpg?s=1024x1024&w=is&k=20&c=adVHFF1micjj1EhwVdQQVdKRlxM1cwaUuQMe5Ir82_w=';
    }
  }

  void fetchProfile() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('hospitals')
          .where('hospitalId', isEqualTo: share.share.getString('id'))
          .get();
      hospitalData.value = snapshot.docs.map((doc) {
        return HospitalModel.fromJson(doc.id, doc.data());
      }).toList();
      share.share.setString('docId', snapshot.docs.first.id);
      print(share.share.getString('docId'));
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    fetchProfile();
    getImage();
    super.onInit();
  }
}

// Widget code remains the same
