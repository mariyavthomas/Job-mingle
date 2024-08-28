import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/favorite/favorite_bloc.dart';
import 'package:jobmingle/domin/models/fav_model.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/presentaion/screen/user/favorite/widgets/favsearch.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:lottie/lottie.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key, this.onFavCountChanged});
 final Function(int)? onFavCountChanged;
  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  _FavScreenState();
 TextEditingController searchcontroller= TextEditingController();
//  List<DocumentSnapshot> _searchresult =[];
//  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(GetfavEvent());
    _getFavCount();
  }
 Future<void> _getFavCount() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("fav").where('useruid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    widget.onFavCountChanged!(querySnapshot.docs.length);
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            IconButton(
                onPressed: () {
                  context.read<FavoriteBloc>().add(GetfavEvent());
                   _getFavCount();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: CustomColor.graycolor(),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                "Saved jobs",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            SizedBox(
              height: height *0.02,
            ),
           FavSearch(searchcontroller: searchcontroller),
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FavoriteLoaded) {
                    final jobs = state.fav;
                    if (jobs.isEmpty) {
                      return Center(
                        child: ListView(
                          children: [
                            Lottie.asset("lib/assests/images/favemty.json"),
                            Center(
                              child: Text(
                                "No Saved jobs Founds",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Center(
                              child: Text(
                                "Tap on bookmark Icon against a job to save it",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: jobs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final FavModel fav = jobs[index]!;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsJob(
                                    isFavorited: fav.isFavorited,
                                    job: JobModel(
                                      companyname: fav.companyname ?? "",
                                      qualification: fav.qualification ?? "",
                                      jobtime: fav.jobtime ?? "",
                                      interviewtime: fav.interviewtime ?? "",
                                      contactpersonnumber:
                                          fav.contactpersonnumber ?? "",
                                      jobdecripation: fav.jobdecripation ?? "",
                                      contactpersonname:
                                          fav.contactpersonname ?? "",
                                      contactpersonprofile:
                                          fav.contactpersonprofile ?? "",
                                      dateofposting: fav.dateofposting ?? "",
                                      experience: fav.experience ?? "",
                                      jobaddress: fav.jobaddress ?? "",
                                      numberofopening:
                                          fav.numberofopening ?? "",
                                      skill: fav.skill ?? "",
                                      timeofjobentering:
                                          fav.timeofjobentering ?? "",
                                      jobuid: fav.favuid,
                                      jobtitle: fav.jobtitle ?? "",
                                      companyemail: fav.compantemail ?? "",
                                      salary: fav.salary ?? "",
                                      country: fav.country ?? "",
                                      state: fav.state ?? "",
                                      city: fav.city ?? "",
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 204, 203, 203)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: height * 0.09,
                                      width: height * 0.08,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 237, 231, 231),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        child: Image.asset(
                                            "lib/assests/images/icon.webp"),
                                      ),
                                    ),
                                    title: Text(
                                      fav.jobtitle!,
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Rs. ${fav.salary ?? ''}',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Confirm Delete"),
                                              content: Text(
                                                  "Are you sure you want to delete this item from your favorites?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection("fav")
                                                        .doc(fav.favuid)
                                                        .delete();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (timeStamp) {
                                                      context
                                                          .read<FavoriteBloc>()
                                                          .add(GetfavEvent());
                                                    });
                                                   _getFavCount();
                                                    Navigator.of(context).pop();
                                                    // Close the dialog
                                                  },
                                                  child: Text("Delete"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.bookmark,
                                          color: Colors.red),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.location_on_outlined,
                                      size: 26,
                                      color: Colors.red,
                                    ),
                                    title: Text(
                                      "${fav.country}, ${fav.state}, ${fav.city}",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: Container(child: Text('Emty')));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

