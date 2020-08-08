import 'package:url_launcher/url_launcher.dart';

class LauncherWorker {
  launchURL() async {
    const url = 'https://www.facebook.com/OpenMyanmarInitiative';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchPhone() async {
    const url = 'tel:+95949605657';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchMail() async {
    const url = 'mailto:office@omimyanmar.org?subject=Contact&body=Hello%20OMI';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchLocation() async {
    const url = 'https://g.page/OMI-Myanmar?share';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchWeb() async {
    const url = 'https://omi.org.mm';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
