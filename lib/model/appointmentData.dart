
class AppointmentData {
  dynamic date;
  dynamic doctorID;
  dynamic note;
  dynamic docId;
  dynamic patientId;
  AppointmentData({
    this.patientId,
    this.date,
    this.note,
    this.doctorID,
  });
  AppointmentData.formJson(this.docId,Map<String, dynamic>? json) {
    date = json?['date'];
    note = json?['note'];
    doctorID = json?['doctorId'];
    patientId = json?['patientId'];
  }
}
