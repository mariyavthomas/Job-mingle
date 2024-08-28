import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/candidatemodel.dart';
import 'package:rxdart/rxdart.dart';

class CandidateStatus {
  Stream<List<Map<String, dynamic>>> getCandidatesWithStatusStream() async* {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      yield [];
      return;
    }

    final companyUid = user.uid;

    final applyJobStream = FirebaseFirestore.instance
        .collection('applyjob')
        .where('userid', isEqualTo: companyUid)
        .snapshots();

    final shortlistedStream = FirebaseFirestore.instance
        .collection('shortlist')
        .where('userid', isEqualTo: companyUid)
        .snapshots();

    final rejectedStream = FirebaseFirestore.instance
        .collection('rejected')
        .where('userid', isEqualTo: companyUid)
        .snapshots();

    yield* Rx.combineLatest3(
      applyJobStream,
      shortlistedStream,
      rejectedStream,
      (applyJobSnapshot, shortlistedSnapshot, rejectedSnapshot) {
        final shortlistedIds = shortlistedSnapshot.docs.map((doc) => doc.data()['userid'] as String).toSet();
        final rejectedIds = rejectedSnapshot.docs.map((doc) => doc.data()['userid'] as String).toSet();

        final allCandidatesWithStatus = <Map<String, dynamic>>[];
        for (var doc in applyJobSnapshot.docs) {
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
      },
    );
  }
}
