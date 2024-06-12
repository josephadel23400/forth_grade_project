import 'package:get/get.dart';

class SessionAttendanceController extends GetxController {
  var attendeesMembers = <Member>[].obs;
  var absenteesMembers = <Member>[].obs;
  var registeredMembers = <Member>[].obs;
  @override
  void onInit() {
    super.onInit();
    attendeesMembers.addAll([
      Member(name: 'Mohammed AbdElftah'),
      Member(name: 'Soha Jamal'),
      Member(name: 'Mhmoud Al Aswany'),
    ]);

    absenteesMembers.addAll([
      Member(name: 'noora Al Aswany'),
    ]);

    registeredMembers.addAll([
      Member(name: 'Joseph Adel Adip', grade: '4th grade'),
      Member(name: 'Reem Ashraf', grade: 'graduate'),
      Member(name: 'george Adel Adip', grade: '4th grade'),
    ]);
  }

  void moveToAccepted(Member member) {
    registeredMembers.remove(member);
    attendeesMembers.add(member);
  }

  void moveToRefused(Member member) {
    registeredMembers.remove(member);
    absenteesMembers.add(member);
  }

  void moveToRequests(Member member, bool wasAccepted) {
    if (wasAccepted) {
      attendeesMembers.remove(member);
    } else {
      absenteesMembers.remove(member);
    }
    registeredMembers.add(member);
  }
}

class Member {
  final String name;
  final String? grade;

  Member({required this.name, this.grade});
}
