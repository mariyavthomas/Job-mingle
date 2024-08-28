import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/alljobs/widgets/title.dart';
import 'package:jobmingle/presentaion/screen/user/favorite/screen/fav_screen.dart';
import 'package:jobmingle/utils/customcolor.dart';

// ignore: must_be_immutable
class Cutomappbar extends StatefulWidget {
  Cutomappbar({
    super.key,
    required this.height,
    required this.favCount,
  });

  final double height;
  int favCount;
// final int favCount = 0;
  @override
  State<Cutomappbar> createState() => _CutomappbarState();
}

class _CutomappbarState extends State<Cutomappbar> {
  @override
  void initState() {
    super.initState();
    _getFavCount();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.bluecolor(),
      title: TitleColum(height: widget.height * 0.03),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FavScreen(onFavCountChanged: (newCount) {
                              setState(() {
                                widget.favCount = newCount;
                              });
                            })));
              },
              icon: Icon(Icons.favorite_border),
            ),
            if (widget.favCount > 0)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    widget.favCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _getFavCount() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("fav")
        .where('useruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      widget.favCount = querySnapshot.docs.length;
    });
  }
}
