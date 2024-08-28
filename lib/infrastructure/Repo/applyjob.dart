import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';

class ApplyJobRepo {
  Stream<List<AppliedJobModel>> getallAppliedJobStream() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Return an empty stream if no user is logged in
      return Stream.value([]);
    }

    return FirebaseFirestore.instance
        .collection('applyjob')
        .where('userid', isEqualTo: user.uid)
        .snapshots()
        .map((querySnapshot) {
          return querySnapshot.docs
              .map((doc) => AppliedJobModel.fromJson(doc.data()))
              .toList();
        });
  }
}
