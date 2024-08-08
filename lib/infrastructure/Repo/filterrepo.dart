import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';

class FilterRepo {
  Future<List<JobModel>> filterjobtitle() async {
    List<JobModel> filterjob = [];
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        
        if (userDoc.exists) {
          String jobtitleuser = userDoc['jobtitle'].toString().trim().toLowerCase();
          print("User job title: $jobtitleuser"); // Log the user's job title
          
          // Retrieve all job documents
          final data = await FirebaseFirestore.instance.collection('jobss').get();
          
          data.docs.forEach((element) {
            var data = element.data() as Map<String, dynamic>;
            String jobTitle = data['jobtitle'].toString().trim().toLowerCase();
            print("Comparing with job title: $jobTitle"); // Log each job title
            
            if (jobTitle.contains(jobtitleuser)) {
              filterjob.add(JobModel.fromJson(data));
            }
          });
          
          if (filterjob.isEmpty) {
            print("No jobs found matching the job title."); // Log if no jobs are found
          } else {
            print("Found ${filterjob.length} jobs."); // Log the number of jobs found
          }
          
          // Return the filtered list of JobModel
          return filterjob;
        } else {
          print("User document does not exist."); // Log if the user document doesn't exist
        }
      } else {
        print("User is not logged in."); // Log if the user is not logged in
      }
    } catch (e) {
      print("An error occurred: $e"); // Log any errors
    }
    return filterjob;
  }
}
