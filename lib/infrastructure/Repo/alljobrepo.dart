import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';

class AllJobRepo{
  Future<List<JobModel>> getalljobs()async{
    List<JobModel>joblist=[];
    final data=await FirebaseFirestore.instance.collection('jobss').get();
    data.docs.forEach((element) { 
      joblist.add(JobModel.fromJson(element.data()));

    });
    print(joblist);
    return joblist;
  }
}