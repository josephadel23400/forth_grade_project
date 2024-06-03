class SpecialtyModel {
  dynamic specialty;
  dynamic hospitalId;
  dynamic docId;
  SpecialtyModel({
    required this.specialty,
    required this.hospitalId,
    required this.docId,
  });
   SpecialtyModel.fromJson(this.docId,Map<String, dynamic>? json) {
     specialty = json?['specialty'];
     hospitalId = json?['hospitalId'];
  }
}
