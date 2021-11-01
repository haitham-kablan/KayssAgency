

import 'package:app/Design/Widgets/errorMsg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

void launchURL(String _url,context) async =>
    await canLaunch(_url) ?
    await launch(_url) :
    throw errorMsg(context, "אי איפשר להציג את הקישור כעת");


String whatsurl() {
    if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/+972522741815"; // new line
    } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=+972522741815"; // new line
    }
}


void instaLuncher(context)async => launchURL("https://www.instagram.com/kayss_agency/", context);
void faceLuncher(context)async => launchURL("https://www.facebook.com/hk.down", context);
void whatsLuncher(context)async => launchURL(whatsurl(), context);