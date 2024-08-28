import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/candidatemodel.dart';
import 'package:jobmingle/domin/models/user_model.dart';

class CandidateStatus{
Future<List<Map<String, dynamic>>> getAllCandidatesWithStatus() async {
  final List<Map<String, dynamic>> allCandidatesWithStatus = [];
  User? company = FirebaseAuth.instance.currentUser;
  final data = await FirebaseFirestore.instance
      .collection('applyjob')
      .where('companyuid', isEqualTo: company!.uid)
      .get();

  final shortlistedDocs = await FirebaseFirestore.instance
      .collection('shortlist')
      .where('companyuid', isEqualTo: company.uid)
      .get();
  final rejectedDocs = await FirebaseFirestore.instance
      .collection('rejected')
      .where('companyuid', isEqualTo: company.uid)
      .get();

  final shortlistedIds = shortlistedDocs.docs.map((doc) => doc.data()['userid'] as String).toSet();
  final rejectedIds = rejectedDocs.docs.map((doc) => doc.data()['userid'] as String).toSet();

  for (var doc in data.docs) {
    final candidateData = doc.data();
    final candidateId = candidateData['userid'] as String;

    String status;
    if (shortlistedIds.contains(candidateId)) {
      status = 'Shortlisted';
    } else if (rejectedIds.contains(candidateId)) {
      status = 'Rejected';
    } else {
      status = 'Applied';
    }

    allCandidatesWithStatus.add({
      'candidate': CandidateModel.fromJson(candidateData),
      'status': status,
    });
  }

  return allCandidatesWithStatus;
}
}