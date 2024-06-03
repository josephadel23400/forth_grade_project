class HospitalModel {
  dynamic ZEPCode;
  dynamic docId;
  dynamic address;
  dynamic emergencyNumber;
  dynamic hospitalId;
  dynamic location;
  dynamic managerName;
  dynamic name;
  dynamic phone;
  dynamic subAdmin;
  dynamic photo;
  dynamic type;
  HospitalModel({
    this.ZEPCode,
    this.phone,
    this.docId,
    this.address,
    this.name,
    this.photo,
    this.location,
    this.managerName,
    this.hospitalId,
    this.subAdmin,
    this.type,
    this.emergencyNumber,
  });
  HospitalModel.fromJson(this.docId, Map<String, dynamic>? json) {
    ZEPCode = json?['ZEPCode'];
    hospitalId = json?['hospitalId'];
    phone = json?['phone'];
    location = json?['location'];
    address = json?['address'];
    name = json?['name'];
    photo = json?['photo'];
    managerName = json?['managerName'];
    subAdmin = json?['subAdmin'];
    type = json?['type'];
    emergencyNumber = json?['emergencyNumber'];
  }
}
