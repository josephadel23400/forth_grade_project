class PatientData {
  dynamic name;
  dynamic age;
  dynamic gender;
  dynamic medicalNote;
  dynamic phone;
  dynamic userId;
  dynamic nationalId;
  dynamic email;
  dynamic photo;
  PatientData({
    this.age,
    this.name,
    this.gender,
    this.userId,
    this.nationalId,
    this.medicalNote,
    this.phone,
    this.email,
    this.photo,
  });
  PatientData.fromJson(Map<String, dynamic>? json) {
    age = json?['age'];
    name = json?['name'];
    userId = json?['userId'];
    gender = json?['gender'];
    nationalId = json?['nationalId'];
    medicalNote = json?['medicalNote'];
    phone = json?['phone'];
    email = json?['email'];
    photo = json?['photo'];
  }
}
