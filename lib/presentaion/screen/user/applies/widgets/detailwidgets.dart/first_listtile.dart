import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/details_job.dart';
import 'package:jobmingle/utils/customcolor.dart';

class Firstlisttile extends StatelessWidget {
  const Firstlisttile({
    super.key,
    required this.widget,
  });

  final ScreenApplyDetailsjob widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.location_on,
        color: CustomColor.bluecolor(),
      ),
      title: Text(
        "${widget.job.country}, ${widget.job.state}, ${widget.job.city}",
      ),
    );
  }
}
