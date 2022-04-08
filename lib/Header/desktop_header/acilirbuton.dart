import 'package:flutter/material.dart';
import 'package:ic_camasir_site/Decoration/decoration.dart';
//import 'package:ic_camasir_site/Header/header.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ic_camasir_site/Header/desktop_header/desktopheader.dart';
import 'package:ic_camasir_site/mainscreen.dart';

class AcilirButon extends StatefulWidget {
  static final GlobalKey<State> globalKey = GlobalKey();
  static String what = 'kadin';
  //bu değer hangi başlığın açılacağına karar verir.
  AcilirButon() : super(key: globalKey);
  @override
  _AcilirbutonState createState() => _AcilirbutonState();
}

class _AcilirbutonState extends State<AcilirButon> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: DesktopHeader.isVisible,
      child: SizedBox(
        width: double.infinity,
        child: hangiBaslik(),
      ),
    );
  }

  Widget hangiBaslik() {
    switch (AcilirButon.what) {
      case 'kadin':
        return kadin();

      case 'erkek':
        return erkek();

      case 'anasayfa':
        return anasayfa();

      case 'iletisim':
        return iletisim();
      default:
        return Container(
          color: Colors.black,
        );
    }
  }

  Widget kadin() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.transparent,
          ),
        ),
        Expanded(
          flex: 3,
          child: MouseRegion(
            onEnter: (info) {
              setState(() => DesktopHeader.isVisible = true);
            },
            onExit: (info) {
              setState(() => DesktopHeader.isVisible = false);
            },
            child: Container(
              width: double.infinity,
              decoration: boxesdecorations(Colors.grey.shade800),
              height: 200,
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                    child: Center(
                        child: Row(children: [
                      const Expanded(child: SizedBox()),
                      buton('atlettakim', '> ATLET TAKIMLARI'),
                      const Expanded(child: SizedBox()),
                      buton('sütyen', '> SÜDYEN TAKIMLARI'),
                      const Expanded(child: SizedBox()),
                      buton('jartiyer', '> JARTİYERLER'),
                      const Expanded(child: SizedBox()),
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget erkek() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.transparent,
          ),
        ),
        Expanded(
          flex: 3,
          child: MouseRegion(
            onEnter: (info) {
              setState(() => DesktopHeader.isVisible = true);
            },
            onExit: (info) {
              setState(() => DesktopHeader.isVisible = false);
            },
            child: Container(
              width: double.infinity,
              decoration: boxesdecorations(Colors.grey.shade800),
              height: 200,
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                    child: Center(
                        child: Row(children: [
                      const Expanded(child: SizedBox()),
                      buton('atlet', '> ATLETLER'),
                      const Expanded(child: SizedBox()),
                      buton('boxer', '> BOXERLER'),
                      const Expanded(child: SizedBox()),
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget anasayfa() {
    return const SizedBox(
      width: 0.5,
      height: 0.5,
    );
  }

  Widget iletisim() {
    return const SizedBox(
      width: 0.5,
      height: 0.5,
    );
  }

  Widget buton(String link, String baslik) {
    return InkWell(
      onTap: () {
        MainScreen.selected = link;
        MainScreen.globalKey.currentState!.setState(() {});
      },
      child: Text(
        baslik,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
