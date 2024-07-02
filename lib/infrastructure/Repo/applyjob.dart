import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';

class ApplyJobRepo {
  Future<List<AppliedJobModel>> getallAppliedJob() async {
    List<AppliedJobModel> appliedjoblist = [];
    User? user = FirebaseAuth.instance.currentUser;

    final data = await FirebaseFirestore.instance
        .collection('applyjob')
        .where('userid', isEqualTo: user!.uid)
        .get();

    data.docs.forEach((element) {
      appliedjoblist.add(AppliedJobModel.fromJson(element.data()));
   print(element.data());
      });
    print(appliedjoblist);
  
    return appliedjoblist;
  }
}
