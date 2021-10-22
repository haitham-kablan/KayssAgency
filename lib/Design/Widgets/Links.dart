

import 'package:url_launcher/url_launcher.dart';


const String whatsLink = "https://wa.me/+972522741815";
const String facebookLink = "https://wa.me/+972522741815";
const String instaLink = "https://wa.me/+972522741815";
const String mailLink = "https://wa.me/+972522741815";


Future<void> launchUniversalLinkIos(String url) async {
  if (await canLaunch(url)) {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(url, forceSafariVC: true);
    }
  }
}