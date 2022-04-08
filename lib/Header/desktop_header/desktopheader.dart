import 'package:flutter/material.dart';
import 'package:ic_camasir_site/Header/desktop_header/acilirbuton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ic_camasir_site/Pages/signin.dart';
import 'package:ic_camasir_site/mainscreen.dart';
import 'package:ic_camasir_site/service/UserService/user_service.dart';

class DesktopHeader extends StatefulWidget {
  static final GlobalKey<State> desktopHeaderKey = GlobalKey();
  static bool isVisible = false;
  const DesktopHeader({Key? key}) : super(key: key);
  @override
  _DesktopHeaderState createState() => _DesktopHeaderState();
}

class _DesktopHeaderState extends State<DesktopHeader> {
  @override
  Widget build(BuildContext context) {
    return butonBar();
  }

  Widget butonBar() {
    return Stack(
      children: [
        AcilirButon(),
        Container(
          width: double.infinity,
          height: 120,
          color: Colors.grey.shade900,
          child: Row(
            children: [
              Expanded(
                child: logo(),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Expanded(child: SizedBox(), flex: 1),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        SignIn.girisYapildi
                            ? iconButon('profil', FontAwesomeIcons.user)
                            : iconButon('signin', FontAwesomeIcons.user),
                        const SizedBox(width: 5),
                        iconButon('sepet', FontAwesomeIcons.shoppingCart),
                        SignIn.girisYapildi
                            ? Row(
                                children: [
                                  const SizedBox(width: 5),
                                  iconButon(
                                      'cikisyap', FontAwesomeIcons.signOutAlt),
                                  const SizedBox(width: 5),
                                ],
                              )
                            : const SizedBox(width: 5),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Row(
                        children: basliklar(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> basliklar() {
    return [
      const Expanded(flex: 2, child: SizedBox()),
      buton('anasayfa', 'anasayfa', 'ANASAYFA'),
      const Expanded(child: SizedBox()),
      buton('kadin', 'kadin', 'KADIN'),
      const Expanded(child: SizedBox()),
      buton('erkek', 'erkek', 'ERKEK'),
      const Expanded(child: SizedBox()),
      buton('iletisim', 'iletisim', 'İLETİŞİM'),
      const Expanded(child: SizedBox()),
    ];
  }

  Widget buton(String deger, String listedegeri, String baslik) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: MouseRegion(
          child: InkWell(
            onTap: () {
              MainScreen.selected = deger;
              MainScreen.globalKey.currentState!.setState(() {});
            },
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  baslik,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          onEnter: (info) {
            AcilirButon.what = listedegeri;
            /*değer stringini alarak header başlıklarının hangisinin 
            açılacağına karar vermiş oluruz,
            bu hangi listelemeyi yapacağımızı belirleyecek.*/
            setState(() {
              DesktopHeader.isVisible = true;
              AcilirButon.globalKey.currentState!.setState(() {});
            });
          },
          onExit: (info) {
            setState(() {
              DesktopHeader.isVisible = false;
              AcilirButon.globalKey.currentState!.setState(() {});
            });
          },
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: 98, //Logo eklendiğinde => height: 100,
      color: Colors.grey.shade900,
      child: InkWell(
          onTap: () {
            MainScreen.selected = 'anasayfa';
            MainScreen.globalKey.currentState!.setState(() {});
          },
          child: Row(
            children: [
              const SizedBox(width: 40),
              const Text(
                'AURORA',
                style: TextStyle(fontSize: 70, color: Colors.white),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Expanded(child: SizedBox()),
                  Text(
                    'iç giyim',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget iconButon(String deger, IconData iconName) {
    return InkWell(
      onTap: () {
        if (deger == 'cikisyap') {
          UserService.signOut(context);
          SignIn.girisYapildi = false;
          setState(() {});
          MainScreen.selected = 'anasayfa';
          MainScreen.globalKey.currentState!.setState(() {});
        } else {
          MainScreen.selected = deger;
          MainScreen.globalKey.currentState!.setState(() {});
        }
      },
      child: FaIcon(
        iconName,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
