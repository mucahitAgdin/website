import 'package:flutter/material.dart';
import 'package:ic_camasir_site/Decoration/decoration.dart';
import 'package:ic_camasir_site/Decoration/sayfa_basi.dart';
import 'package:ic_camasir_site/Footer/footer.dart';
import 'package:ic_camasir_site/Pages/anasayfa/dondurucu.dart';
import 'package:ic_camasir_site/Pages/anasayfa/kutucuk.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return info.deviceScreenType == DeviceScreenType.desktop
          ? Scaffold(body: desktop())
          : Scaffold(body: mobile());
    });
  }

  Widget desktop() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SayfaBasi(),
          Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 5,
                  child: Container(
                      decoration: boxesdecorations(Colors.grey.shade200),
                      child: Column(children: desktopContent()))),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
          const SizedBox(height: 20),
          const Footer(),
        ],
      ),
    );
  }

  Widget mobile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
              decoration: boxesdecorations(Colors.grey.shade200),
              child: Column(children: mobileContent())),
          const SizedBox(height: 20),
          const Footer(),
        ],
      ),
    );
  }

  List<Widget> desktopContent() {
    return [
      const SizedBox(height: 10),
      const Dondurucu(),
      const SizedBox(height: 20),
      const Kutucuk(),
    ];
  }

  List<Widget> mobileContent() {
    return [
      const Dondurucu(),
      const SizedBox(height: 20),
      const Kutucuk(),
    ];
  }
}
