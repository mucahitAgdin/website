import 'package:flutter/material.dart';
import 'package:ic_camasir_site/Decoration/decoration.dart';
import 'package:ic_camasir_site/mainscreen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Kutucuk extends StatefulWidget {
  const Kutucuk({Key? key}) : super(key: key);

  @override
  _KutucukState createState() => _KutucukState();
}

class _KutucukState extends State<Kutucuk> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return info.deviceScreenType == DeviceScreenType.desktop
          ? desktop()
          : mobile();
    });
  }

  Widget desktop() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(flex: 4, child: kutucuk('KADIN', 'kadin', 300)),
            const SizedBox(width: 20),
            Expanded(flex: 4, child: kutucuk('ERKEK', 'erkek', 300)),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget mobile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Column(
          children: [
            kutucuk('KADIN', 'kadin', 200),
            const SizedBox(height: 20),
            kutucuk('ERKEK', 'erkek', 200),
          ],
        ),
      ),
    );
  }

  Widget kutucuk(String kategori, String yonlendirme, var boy) {
    return Container(
      height: boy,
      child: InkWell(
        onTap: () {
          MainScreen.selected = yonlendirme;
          MainScreen.globalKey.currentState!.setState(() {});
        },
        child: Center(
          child: Text(
            kategori,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
      decoration: boxesdecorations(Colors.black87),
    );
  }
}
