import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:we_rate_dogs/condo/profile.dart';

import 'about_us.dart';
import 'booking_history.dart';
import 'contact_us.dart';
import 'event.dart';
import 'facility.dart';
import 'gallery.dart';
import 'home.dart';
import 'notification.dart';

typedef MenuActionBuilder = Widget Function(
    GlobalKey key, ValueChanged<int> valueChanged);

final Color condoBackgroundColor = Color(0xfff9f7ea);
final Color condorTextColor = Color(0xff9D661b);
final Color condoActionbarColor = Color(0xffFBB040);
final bool remote = true;

final String condoBaseUrl = "https://www.micasa.com.sg";

class CondoMenuItem {
  final IconData iconData;
  final String title;
  final MenuActionBuilder builder;

  CondoMenuItem({this.iconData, this.title, this.builder});
}

final List<String> Facilities = [
  "Lounge Area",
  "Karaoke Room",
  "Gymnasium",
  "Steam Room",
  "Entrance Water Feature",
  "Garden Plaza",
  "Leisure Pool",
  "Children Fun Pool with Water Slides",
  "Jacuzzi",
  "50m Freeform Lap Pool",
  "Tennis Courts",
  "Outdoor Fitness Area",
  "Spa/Dining Pavilion with Jacuzzi in \"Resort Island\" style",
  "Private Villa with Indoor Dining Pavilion, Dip Pool & Lounge Deck",
];

CondoBotton(String text, {GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Ink(
      height: 50,
      decoration: BoxDecoration(
          color: Color(0XFFeb8d37),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: Offset(0, 3),
              blurRadius: 1,
              spreadRadius: -2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    ),
  );
}

void loadingDismiss(BuildContext context) {
  Navigator.pop(context);
}

void showLoading(BuildContext context) {
  var hud = new ProgressHUD(
    backgroundColor: Colors.transparent,
    color: condorTextColor,
    containerColor: condoBackgroundColor.withOpacity(0.9),
    borderRadius: 20.0,
    text: 'Loading...',
  );

  showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Material(
          shadowColor: Colors.transparent,
          color: Colors.black,
          elevation: 0,
          type: MaterialType.transparency,
          child: Center(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 100,
            width: 100,
            child: hud,
          )));
    },
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ),
        child: child,
      );
    },
  );
}

final List<CondoMenuItem> CondoMenus = [
  CondoMenuItem(
      iconData: Icons.home,
      title: "HOME",
      builder: (key, value) {
        return CondoHome(
          key: key,
          valueChanged: value,
        );
      }),
  CondoMenuItem(
      iconData: Icons.info,
      title: "ABOUT US",
      builder: (key, value) {
        return AboutUsPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.timer,
      title: "FACILITY & BOOKINGS",
      builder: (key, value) {
        return FacilityPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.timer,
      title: "BOOKING HISTORY",
      builder: (key, value) {
        return BookingHistoryPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.filter,
      title: "GALLERY",
      builder: (key, value) {
        return GalleryPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.event,
      title: "EVENTS",
      builder: (key, value) {
        return EventPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.notifications,
      title: "NOTIFICATIONS",
      builder: (key, value) {
        return NotificationPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.person,
      title: "PROFILE",
      builder: (key, value) {
        return ProfilePage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.phone_in_talk,
      title: "CONTACT US",
      builder: (key, value) {
        return CondoContactUsPage(key: key);
      }),
  CondoMenuItem(
      iconData: Icons.exit_to_app,
      title: "LOGOUT",
      builder: (key, value) {
        return ProfilePage(key: key);
      })
];
