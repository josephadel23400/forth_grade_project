import 'package:get/get.dart';

class RegisteredMembersController extends GetxController {
  //todo : arrange them when you create user model
  var acceptedMembers = <Member>[].obs;
  var refusedMembers = <Member>[].obs;
  var requests = <Member>[].obs;

  @override
  void onInit() {
    super.onInit();
    acceptedMembers.addAll([
      Member(name: 'Mohammed AbdElftah'),
      Member(name: 'Soha Jamal'),
      Member(name: 'Mhmoud Al Aswany'),
    ]);

    refusedMembers.addAll([
      Member(name: 'noora Al Aswany'),
    ]);

    requests.addAll([
      Member(name: 'Joseph Adel Adip', grade: '4th grade'),
      Member(name: 'Reem Ashraf', grade: 'graduate'),
      Member(name: 'george Adel Adip', grade: '4th grade'),
    ]);
  }

  void moveToAccepted(Member member) {
    requests.remove(member);
    acceptedMembers.add(member);
  }

  void moveToRefused(Member member) {
    requests.remove(member);
    refusedMembers.add(member);
  }

  void moveToRequests(Member member, bool wasAccepted) {
    if (wasAccepted) {
      acceptedMembers.remove(member);
    } else {
      refusedMembers.remove(member);
    }
    requests.add(member);
  }
}
class Member {
  final String name;
  final String? grade;

  Member({required this.name, this.grade});
}