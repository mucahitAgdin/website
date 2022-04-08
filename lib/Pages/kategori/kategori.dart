import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ic_camasir_site/Decoration/decoration.dart';
import 'package:ic_camasir_site/Decoration/sayfa_basi.dart';
import 'package:ic_camasir_site/Footer/footer.dart';
import 'package:ic_camasir_site/Pages/kategori/cardd.dart';
import 'package:ic_camasir_site/service/UrunService/urunservice.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: must_be_immutable
class Kategori extends StatefulWidget {
  String kategori = 'kategorismi';
  Kategori({Key? key, required this.kategori}) : super(key: key);
  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return info.deviceScreenType == DeviceScreenType.desktop
            ? desktop(context)
            : mobile(context);
      },
    );
  }

  Widget desktop(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
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
                    child: Column(
                      children: [
                        contentWrap(context, true),
                      ],
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
            const SizedBox(height: 20),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: boxesdecorations(Colors.grey.shade100),
              child: contentWrap(context, false),
            ),
          ),
          const SizedBox(height: 20),
          const Footer(),
        ],
      ),
    );
  }

  Widget contentWrap(BuildContext context, bool isdesktop) {
    String secilen = widget.kategori;
    String kadin1 = 'sütyen';
    String kadin2 = 'jartiyer';
    String kadin3 = 'atlettakim';
    String erkek1 = 'erkek atlet';
    String erkek2 = 'erkek boxer';

    switch (secilen) {
      case 'kadin':
        return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ...UrunService.urunList.where((element) {
                return kadin1 == 'kategori'
                    ? element.kategori == element.kategori
                    : element.kategori == kadin1;
              }).map((e) => imagesBox(
                  isdesktop, context, e.urunAdi, e.urunFiyat, e.gorsel, e.id)),
              ...UrunService.urunList.where((element) {
                return kadin2 == 'kategori'
                    ? element.kategori == element.kategori
                    : element.kategori == kadin2;
              }).map((e) => imagesBox(
                  isdesktop, context, e.urunAdi, e.urunFiyat, e.gorsel, e.id)),
              ...UrunService.urunList.where((element) {
                return kadin3 == 'kategori'
                    ? element.kategori == element.kategori
                    : element.kategori == kadin3;
              }).map((e) => imagesBox(
                  isdesktop, context, e.urunAdi, e.urunFiyat, e.gorsel, e.id)),
            ]);

      case 'erkek':
        return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ...UrunService.urunList.where((element) {
                return erkek1 == 'kategori'
                    ? element.kategori == element.kategori
                    : element.kategori == erkek1;
              }).map((e) => imagesBox(
                  isdesktop, context, e.urunAdi, e.urunFiyat, e.gorsel, e.id)),
              ...UrunService.urunList.where((element) {
                return erkek2 == 'kategori'
                    ? element.kategori == element.kategori
                    : element.kategori == erkek2;
              }).map((e) => imagesBox(
                  isdesktop, context, e.urunAdi, e.urunFiyat, e.gorsel, e.id)),
            ]);

      default:
        return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ...UrunService.urunList.where((element) {
                return secilen == 'kategori'
                    ? element.kategori == element.kategori
                    : element.kategori == secilen;
              }).map((e) => imagesBox(
                  isdesktop, context, e.urunAdi, e.urunFiyat, e.gorsel, e.id)),
            ]);
    }
  }

  Widget imagesBox(bool isdesktop, BuildContext context, String isim,
      double fiyat, String resim, String id) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: boxesdecorations(Colors.grey.shade500),
        width: 300,
        height: isdesktop ? 625 : 610,
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Image.asset(
                resim,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: isdesktop ? 20 : 10),
            Text(
              isim,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(height: isdesktop ? 20 : 10),
            Text(
              '$fiyat TL',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      onTap: () {
        showJoinAlert(context, isim, fiyat, resim, id);
      },
    );
  }

  void showJoinAlert(BuildContext context, String baslik, double fiyat,
      String resim, String id) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            InkWell(
                onTap: () => Navigator.pop(context, false),
                child: const FaIcon(
                  FontAwesomeIcons.solidTimesCircle,
                  color: Colors.black,
                ))
          ],
          content: Container(
            padding: const EdgeInsets.all(10),
            height: 1000,
            width: 1200,
            child: Center(
              child: Cardd(
                isim: baslik,
                fiyat: fiyat,
                resim: resim,
                id: id,
              ),
            ),
          ),
        );
      },
    );
  }
}
