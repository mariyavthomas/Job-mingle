import 'package:flutter/material.dart';

import 'package:jobmingle/domin/models/user_model.dart';

import 'package:jobmingle/presentaion/screen/user/profile/screen/profession.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/peronaldetals/cutomcolum/profession_colum.dart';
import 'package:jobmingle/utils/customcolor.dart';

// ignore: must_be_immutable
class Professionaldetails extends StatefulWidget {
  Professionaldetails({super.key, required this.user});
  Usermodel user;
  @override
  State<Professionaldetails> createState() => _ProfessionaldetailsState();
}

class _ProfessionaldetailsState extends State<Professionaldetails> {
  @override
  void initState() {
   
    super.initState();
    // context.read<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProssionDetails(
              workstatus: widget.user.workstatus!,
              currentcity: widget.user.currentcity,
              currentcategory: widget.user.currentcategory,
              currentdeparment: widget.user.currentdeparment,
              currentindustry: widget.user.currentindustry,
            ),
          ),
        );
      },
      child: Card(
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.cast_for_education,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Professional details",
                      style: TextStyle(
                        fontSize: 19,
                        color: CustomColor.blckcolor(),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProssionDetails(
                                workstatus: widget.user.workstatus!,
                                currentcity: widget.user.currentcity,
                                currentcategory: widget.user.currentcategory,
                                currentdeparment: widget.user.currentdeparment,
                                currentindustry: widget.user.currentindustry,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit_square,
                          color: CustomColor.bluelight(),
                        )),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                widget.user.currentindustry != null
                    ? CutomColum(
                        text: "Current Industry",
                        text2: widget.user.currentindustry!,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 5,
                ),
                widget.user.currentdeparment != null
                    ? CutomColum(
                        text: "Current Department",
                        text2: widget.user.currentdeparment!,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 5,
                ),
                widget.user.currentcategory != null
                    ? CutomColum(
                        text: "Current roll Category",
                        text2: widget.user.currentcategory!,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 5,
                ),
                widget.user.workstatus != null
                    ? CutomColum(
                        text: "Current Experience",
                        text2: widget.user.workstatus!,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 5,
                ),
                widget.user.currentcity != null
                    ? CutomColum(
                        text: "Current Location",
                        text2: widget.user.currentcity!,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
