import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/infrastructure/Repo/uploadimgerepo.dart';
import 'package:jobmingle/presentaion/screen/user/profile/widgets/profile_widgets/listview.dart';
import 'package:jobmingle/utils/customcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loading_animations/loading_animations.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImageRepo imagefire = ImageRepo();
  String? pickedImage;
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserEvent());
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
         if(state is UserProfileLoadingState){
          return Center(child:LoadingAnimationWidget.stretchedDots(color:CustomColor.bluelight(), size: 90));
         }
          else  if (state is UserProfileLoaedState) {
              // ignore: unused_local_variable
              String useruid = state.user.uid!;
             
              return Profile_Listview(useruid: state.user.uid!,user: state.user,);
            }
            return Center();
          },
        ),
      ),
    );
  }
}

