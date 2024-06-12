import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentGraduateJobsController extends GetxController {
  RxList<Job> jobs = <Job>[].obs;
  var isLoading = true.obs;

  List<DropdownMenuItem<int>> dropdownMenuItems = [
    DropdownMenuItem(
      value: 1,
      child: const Text('Date', style: TextStyle(color: Colors.black)),
      onTap: () {
        //todo: Apply the Date search function
      },
    ),
    DropdownMenuItem(
      value: 2,
      child: const Text('Internship', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the Internship search
      },
    ),
    DropdownMenuItem(
      value: 3,
      child: const Text('full-time job', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the full-time job search
      },
    ),
    DropdownMenuItem(
      value: 4,
      child: const Text('part-time job', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the part-time job search
      },
    ),
    DropdownMenuItem(
      value: 5,
      child: const Text('Recommend', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the Ai Recommend search
      },
    ),
  ];

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    // TODO: implement onInit
    super.onInit();
    jobs.addAll([
      Job(
        inFuture: true,
        didAppliedForJob: true,
        jobTitle: 'Software Engineer',
        companyName: 'Tech Innovators Inc.',
        jobType: 'Full-time',
        jobRequirement:
            'Bachelor\'s degree in Computer Science or related field',
        endIn: '15/06/2024',
        endInHour: '3:00 PM',
        jobDescription: 'Develop and maintain software applications',
      ),
      Job(
        inFuture: true,
        didAppliedForJob: false,
        jobTitle: 'Data Analyst',
        companyName: 'HealthCare Solutions',
        jobType: 'Part-time',
        jobRequirement: 'Experience with data analysis tools',
        endIn: '10/07/2024',
        endInHour: '5:00 PM',
        jobDescription: 'Analyze data to provide insights',
      ),
      Job(
        inFuture: true,
        didAppliedForJob: true,
        jobTitle: 'Marketing Manager',
        companyName: 'Finance World',
        jobType: 'Full-time',
        jobRequirement: 'Marketing experience preferred',
        endIn: '20/07/2024',
        endInHour: '12:00 PM',
        jobDescription: 'Plan and execute marketing campaigns',
      ),
      Job(
        inFuture: false,
        didAppliedForJob: false,
        jobTitle: 'Graphic Designer',
        companyName: 'Eco Green',
        jobType: 'Contract',
        jobRequirement: 'Proficiency in Adobe Creative Suite',
        endIn: '25/04/2024',
        endInHour: '2:00 PM',
        jobDescription: 'Design graphics for various projects',
      ),
      Job(
        inFuture: true,
        didAppliedForJob: true,
        jobTitle: 'Project Manager',
        companyName: 'Innovatech',
        jobType: 'Full-time',
        jobRequirement: 'Project management certification',
        endIn: '30/08/2024',
        endInHour: '4:00 PM',
        jobDescription: 'Lead project teams to successful completion',
      ),
    ]);
    isLoading.value = false;
  }
}

class Job {
  bool inFuture;
  bool didAppliedForJob;
  String jobTitle;
  String companyName;
  String jobType;
  String jobRequirement;
  String endIn;
  String endInHour;
  String jobDescription;
  Job({
    required this.inFuture,
    required this.didAppliedForJob,
    required this.jobTitle,
    required this.companyName,
    required this.jobType,
    required this.jobRequirement,
    required this.endIn,
    required this.endInHour,
    required this.jobDescription,
  });
}
