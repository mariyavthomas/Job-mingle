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
  Future<List<JobModel>>filterjobtitle(String jobtitle)async{
    List<JobModel> filterjob=[];
    try{
        final data = await FirebaseFirestore.instance.collection('jobss').where("jobtitle",isEqualTo:  jobtitle).get();
        data.docs.forEach((element) {
          // ignore: unnecessary_cast
          var data= element.data() as Map<String,dynamic>;
          if(data['jobtitle'].toString().toLowerCase().contains(jobtitle.toLowerCase())){
            filterjob.add(JobModel.fromJson(data));
          }
        });
        return filterjob;
    }catch(e){
           return filterjob;
    }
      }

     Future<List<JobModel>> searchJobs(String searchtxt) async {
  List<JobModel> jobList = [];
  try {
    final datas = await FirebaseFirestore.instance
        .collection('jobss')
        .get();

    // Filter the results locally to support case-insensitive search
    datas.docs.forEach((element) {
      // ignore: unnecessary_cast
      var data = element.data() as Map<String, dynamic>;
      if (data['jobtitle'].toString().toLowerCase().contains(searchtxt.toLowerCase())) {
        jobList.add(JobModel.fromJson(data));
      }
    });

    return jobList;
  } catch (e) {
    print('Error: ${e.toString()}');
    return jobList;
  }
}
}