import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class CommanRepo {
  //----------Normalcall------------ //
  void makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    // ignore: deprecated_member_use
    if (await canLaunch(phoneUri.toString())) {
      // ignore: deprecated_member_use
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

//-------------whatsappSharing with msg any user contact person------------//
  void whatsapp({required String message}) async {
    var contact = "";
    final String encodedmessage = Uri.encodeComponent(message);
    var androidUrl = "whatsapp://send?phone=$contact&text=$encodedmessage";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      //  EasyLoading.showError('WhatsApp is not installed.');
    }
  }
//--------------contact giving number withwhatsapp------//

  void shareNumberOnWhatsApp(String phoneNumber, String message) async {
    final String encodedmessage = Uri.encodeComponent(message);
    var androidUrl = 'whatsapp://send?phone=$phoneNumber&text=$encodedmessage';
    var iosUrl =
        "https://wa.me/$phoneNumber?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
    } catch (e) {}
  }

//----------daydifferentce jobposted day to current day ------------//
  int calculateDaysSincePosted(DateTime postedDate) {
    // Get the current date
    DateTime now = DateTime.now();

    // Calculate the difference
    Duration difference = now.difference(postedDate);

    // Convert the difference to days
    int daysDifference = difference.inDays;

    return daysDifference;
  }
}
