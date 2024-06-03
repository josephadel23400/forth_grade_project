class DoctorsModel {
  dynamic name;
  dynamic specialty;
  dynamic endIn;
  dynamic startIn;
  dynamic photo;
  dynamic age;
  dynamic docId;
  dynamic gender;
  dynamic certificate;
  dynamic hospitalId;
  dynamic userId;
  dynamic nationalId;
  dynamic phone;
  DoctorsModel({
    this.gender,
    this.phone,
    this.docId,
    this.nationalId,
    this.photo,
    this.name,
    this.certificate,
    this.userId,
    this.age,
    this.hospitalId,
    this.specialty,
    this.startIn,
    this.endIn,
  });
  DoctorsModel.fromJson(this.docId,Map<String, dynamic>? json) {
    gender = json?['gender'];
    photo = json?['photo'];
    name = json?['name'];
    specialty = json?['specialty'];
    startIn = json?['startIn'];
    endIn = json?['endIn'];
    phone = json?['phone'];
    nationalId = json?['nationalId'];
    certificate = json?['certificate'];
    userId = json?['userId'];
    age = json?['age'];
    hospitalId = json?['hospitalId'];
  }
}
