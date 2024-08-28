import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobmingle/application/favorite/favorite_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/detjobs/screen/detailed_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Salary extends StatefulWidget {
  const Salary({
    super.key,
    required this.widget,
    required this.height,
    this.isFavorited,
  });

  final DetailsJob widget;
  final double height;
  final bool? isFavorited;

  @override
  State<Salary> createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  bool _isFavorited = false;
 
  @override
  void initState() {
    super.initState();
    _isFavorited = widget.isFavorited ?? false; 
    context.read<FavoriteBloc>().add(IsFavoriteEvent(jobuid: widget.widget.job.jobuid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is IsFavoriteState) {
          setState(() {
            _isFavorited = state.isFav; // Update the favorite status based on the state
          });
        }
      },
      child: ListTile(
        leading: Text(
          '₹ ${widget.widget.job.salary}',
          style: TextStyle(
            color: CustomColor.bluecolor(),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          height: widget.height * 0.025,
          child: Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Text(
              '${widget.widget.job.numberofopening} openings',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: _toggleFavorite,
          icon: Icon(
            _isFavorited ? Icons.bookmark : Icons.bookmark_border,
            color: _isFavorited ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }

  void _toggleFavorite() {
    // ignore: unused_local_variable
    final jobUid = widget.widget.job.jobuid;
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    if (userUid != null) {
      if (_isFavorited) {
        
      } else {
        // Add to favorites
        context.read<FavoriteBloc>().add(AddfavEvent(
          isFavorited: true,
          job: widget.widget.job,
          useruid: userUid,
        ));
        Fluttertoast.showToast(
          msg: "Job added to favorites",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    }

    setState(() {
      _isFavorited = !_isFavorited;
    });
  }
}
