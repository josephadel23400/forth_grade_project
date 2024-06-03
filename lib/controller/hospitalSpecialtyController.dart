class Specialty {
  late final int doctorNumber;
  final String name;
  Specialty({required this.doctorNumber, required this.name});
  void addNewDoctor() {
    doctorNumber++;
  }
}
