import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/fav_model.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';

class FavoriteRepo {
  Future<void> addFavList(
      {required JobModel job, required bool isFavorited}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var useruid = _auth.currentUser!.uid;
    final db = FirebaseFirestore.instance;
    bool exists = await isInFav(job.jobuid);
    if (exists) {
      throw Exception("Package already exists in the wishlist");
    }
    final favuid = db.collection('fav').doc().id;
    FavModel favModel = FavModel(
      companyname: job.companyname,
      contactpersonprofile: job.contactpersonprofile,
      isFavorited: isFavorited,
      companyuid: job.companyuid!,
      contactpersonname: job.contactpersonname,
      contactpersonnumber: job.contactpersonnumber,
      country: job.country,
      dateofposting: job.dateofposting,
      experience: job.experience,
      interviewtime: job.interviewtime,
      jobaddress: job.jobaddress,
      jobdecripation: job.jobdecripation,
      jobtime: job.jobtime,
      jobtitle: job.jobtitle,
      numberofopening: job.numberofopening,
      qualification: job.qualification,
      skill: job.skill,
      state: job.state,
      timeofjobentering: job.timeofjobentering,
      salary: job.salary,
      city: job.city,
      compantemail: job.companyemail,
      jobuid: job.jobuid,
      useruid: useruid,
      favuid: favuid,
    );
    await db.collection('fav').doc(favuid).set(favModel.toJson());
  }

  Future<bool> isInFav(String jobuid) async {
    final datas = await FirebaseFirestore.instance
        .collection("fav")
        .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('jobuid', isEqualTo: jobuid)
        .get();
    return datas.docs.isNotEmpty;
  }

  Future<List<FavModel>> getFavList() async {
    List<FavModel> listFav = [];
    try {
      final datas = await FirebaseFirestore.instance
          .collection('fav')
          .where("useruid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      datas.docs.forEach((element) {
        listFav.add(FavModel.fromJson(element.data()));
      });
      return listFav;
    } catch (e) {
      print(e.toString());
      return listFav;
    }
  }

  Future<void> removeFav(String favuid) async {
    await FirebaseFirestore.instance.collection('fav').doc().delete();
  }

  Future<List<FavModel>> searchFav(String searchtxt) async {
    List<FavModel> favlist = [];
    try {
      final datas = await FirebaseFirestore.instance
          .collection('fav')
          .where('useruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      // Filter the results locally to support case-insensitive search
      datas.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        if (data['jobtitle']
            .toString()
            .toLowerCase()
            .contains(searchtxt.toLowerCase())) {
          favlist.add(FavModel.fromJson(data));
        }
      });

      return favlist;
    } catch (e) {
      print('Error: ${e.toString()}');
      return favlist;
    }
  }
}
