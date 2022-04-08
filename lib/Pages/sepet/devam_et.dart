import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:ic_camasir_site/Decoration/decoration.dart';
import 'package:ic_camasir_site/Decoration/sayfa_basi.dart';
import 'package:ic_camasir_site/Footer/footer.dart';
import 'package:ic_camasir_site/Pages/sepet/sepet.dart';
import 'package:ic_camasir_site/mainscreen.dart';
import 'package:ic_camasir_site/service/UrunService/urunmodel.dart';
import 'package:ic_camasir_site/service/UserService/user_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class DevamEt extends StatefulWidget {
  const DevamEt({Key? key}) : super(key: key);

  @override
  _DevamEtState createState() => _DevamEtState();
}

class _DevamEtState extends State<DevamEt> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return info.deviceScreenType == DeviceScreenType.desktop
          ? desktop()
          : mobile();
    });
  }

  Widget desktop() {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(
                    flex: 5,
                    child: Container(
                      decoration: boxesdecorations(Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SayfaBasi(),
                            Column(
                              children: content(true),
                            ),
                          ],
                        ),
                      ),
                    )),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget mobile() {
    return SingleChildScrollView(
      child: Container(
        decoration: boxesdecorations(Colors.grey.shade200),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                children: content(false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> content(bool isDesktop) {
    return [
      const SizedBox(height: 20),
      isDesktop
          ? Column(children: [...Sepet.sepetList.map((e) => siparisDesktop(e))])
          : Column(children: [...Sepet.sepetList.map((e) => siparisMobile(e))]),
      const SizedBox(height: 20),
      // Container(
      //   width: double.infinity,
      //   height: 150,
      //   decoration: boxesdecorations(Colors.grey.shade400),
      //   child: sozlesme(),
      // ), BU KISMA MESAFELİ SATIŞ SÖZLEŞMESİ??
      const SizedBox(height: 20),
      toplamSatiri(),
      const SizedBox(height: 20),
      odemeYap(),
    ];
  }

  Widget siparisDesktop(UrunModel model) {
    double fiyat = model.urunFiyat;
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              model.gorsel,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 250,
              child: Text(
                model.urunAdi,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const Expanded(child: SizedBox()),
            bedenList(model.selectedRadio),
            const Expanded(child: SizedBox()),
            Text(
              '$fiyat TL',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget siparisMobile(UrunModel model) {
    double fiyat = model.urunFiyat;
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              model.gorsel,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    model.urunAdi,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 10),
                bedenList(model.selectedRadio),
                const SizedBox(height: 10),
                Text(
                  '$fiyat TL',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget bedenList(int selected) {
    switch (selected) {
      case 1:
        return const Text('S');

      case 2:
        return const Text('M');
      case 3:
        return const Text('L');
      case 4:
        return const Text('XL');

      case 5:
        return const Text('XXL');
      default:
        return const Text('Lütfen beden seçiniz!');
    }
  }

  Widget adresim() {
    if (UserModel.adres == null) {
      return Container(
        decoration: boxesdecorations(Colors.grey.shade400),
        child: Column(
          children: [
            const Text('Hiç kayıtlı adresiniz yok'),
            Container(
              decoration: boxesdecorations(Colors.black),
              child: InkWell(
                onTap: () {
                  MainScreen.selected = 'profil';
                  MainScreen.globalKey.currentState!.setState(() {});
                },
                child: const Text(
                  'ADRES EKLE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: boxesdecorations(Colors.grey.shade400),
        child: Text(UserModel.adres ?? 'Hiç kayıtlı adresiniz yok'),
      );
    }
  }

  Widget toplamSatiri() {
    double toplam = Sepet.top;

    return Container(
      height: 60,
      decoration: boxesdecorations(Colors.black),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TOPLAM',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
            Text(
              '$toplam TL',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget odemeYap() {
    return Container(
      width: 150,
      height: 45,
      decoration: boxesdecorations(Colors.black),
      child: InkWell(
        onTap: () async {
          if (UserModel.adres == null) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Kayıtlı adresiniz bulunmamaktadır!')));
          } else {
            String ip = await userIp();
            String birlestir =
                '$ip ${siparisNo()} ${UserModel.adres} ${Sepet.top.toString()} ${UserModel.email} ${UserModel.telNo}';
            // String birlestir = siparisAl();
            String url = 'https://aurora-clothes.com/odeme.php?$birlestir';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'could not launch $url';
            }
          }
        },
        child: const Center(
          child: Text(
            'ÖDEME YAP',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  userIp() async {
    var data = IpAddress(type: RequestType.text);
    String ip = await data.getIpAddress();
    return ip;
  }

  String siparisNo() {
    var rand = Random();
    int siparisNo = rand.nextInt(1000000000);
    return siparisNo.toString();
  }
}
