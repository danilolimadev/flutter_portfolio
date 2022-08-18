import 'package:url_launcher/url_launcher.dart';

class Method {

  launchURL(String link) async {
  var url = link;
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

 /*launchCaller() async {
    const url = "tel:9595242507";   
    if (await canLaunchUrl(Uri.parse(url))) {
       await launchURL(url);
    } else {
      throw 'Could not launch $url';
    }   
}*/

launchEmail() async {
      if (await canLaunchUrl(Uri.parse("mailto:danilolimadev@gmail.com"))) {
        await launchUrl(Uri.parse("mailto:danilolimadev@gmail.com"));
      } else {
        throw 'Could not launch';
      }
    }

}