import 'package:flutter/material.dart';
import 'package:ic_camasir_site/Header/desktop_header/desktopheader.dart';
import 'package:ic_camasir_site/Header/mobile_header/drawerarac.dart';
import 'package:ic_camasir_site/Header/mobile_header/mobileheader.dart';
import 'package:ic_camasir_site/Pages/anasayfa/anasayfa.dart';
import 'package:ic_camasir_site/Pages/iletisim.dart';
import 'package:ic_camasir_site/Pages/kategori/kategori.dart';
import 'package:ic_camasir_site/Pages/kvkk.dart';
import 'package:ic_camasir_site/Pages/profil.dart';
import 'package:ic_camasir_site/Pages/sepet/devam_et.dart';
import 'package:ic_camasir_site/Pages/sepet/sepet.dart';
import 'package:ic_camasir_site/Pages/signin.dart';
import 'package:ic_camasir_site/Pages/signup.dart';
import 'package:ic_camasir_site/Pages/sepet/uye_olmadan_devam_et.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainScreen extends StatefulWidget {
  static String selected = "anasayfa";
  static GlobalKey<State> globalKey = GlobalKey();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  MainScreen() : super(key: globalKey);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return info.deviceScreenType == DeviceScreenType.desktop
          ? Scaffold(
              body: Stack(
                children: [
                  body(),
                  DesktopHeader(key: DesktopHeader.desktopHeaderKey),
                ],
              ),
            )
          : Scaffold(
              key: MainScreen.scaffoldKey,
              body: Column(
                children: [
                  const MobileHeader(),
                  Expanded(child: body()),
                ],
              ),
              drawer: const DrawerArac(),
            );
    });
  }

  Widget body() {
    switch (MainScreen.selected) {
      case 'anasayfa':
        return const Anasayfa();

      case 'iletisim':
        return const Iletisim();

      case 'signup':
        return const SignUp();

      case 'signin':
        return const SignIn();

      case 'kadin':
        return Kategori(kategori: 'kadin');

      case 'sütyen':
        return Kategori(kategori: 'sütyen');

      case 'jartiyer':
        return Kategori(kategori: 'jartiyer');

      case 'atlettakim':
        return Kategori(kategori: 'atlettakim');

      case 'atlet':
        return Kategori(kategori: 'erkek atlet');

      case 'boxer':
        return Kategori(kategori: 'erkek boxer');

      case 'erkek':
        return Kategori(kategori: 'erkek');

      case 'profil':
        return const Profil();

      case 'sepet':
        return const Sepet();

      case 'uyeolmadandevamet':
        return const UyeOlmadanDevamEt();

      case 'devamet':
        return const DevamEt();

      case 'KVKK':
        return const Kvkk();
      default:
        return const Anasayfa();
    }
  }
}
