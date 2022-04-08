import 'package:flutter/material.dart';
import 'package:ic_camasir_site/Decoration/decoration.dart';
import 'package:ic_camasir_site/Decoration/sayfa_basi.dart';
import 'package:ic_camasir_site/Footer/footer.dart';
import 'package:ic_camasir_site/mainscreen.dart';
import 'package:ic_camasir_site/service/UserService/user_service.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static GlobalKey<State> globalKey = GlobalKey();

  static bool girisYapildi = false;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController2 = TextEditingController();

  //final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return info.deviceScreenType == DeviceScreenType.desktop
            ? Scaffold(body: desktop())
            : Scaffold(
                body: mobile(),
              );
      },
    );
  }

  Widget mailAlani() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: boxesdecorations(Colors.white),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 15.0),
          icon: FaIcon(
            FontAwesomeIcons.at,
            color: Colors.grey.shade400,
            size: 20,
          ),
          hintText: 'birisi@example.com',
        ),
      ),
    );
  }

  Widget mailAlani2() {
    return Container(
      width: 500,
      height: 50,
      decoration: boxesdecorations(Colors.white),
      child: TextField(
        controller: _emailController2,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 15.0),
          icon: FaIcon(
            FontAwesomeIcons.at,
            color: Colors.grey.shade400,
            size: 20,
          ),
          hintText: 'birisi@example.com',
        ),
      ),
    );
  }

  Widget sifreAlani() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: boxesdecorations(Colors.white),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 15.0),
          icon: FaIcon(FontAwesomeIcons.lock, color: Colors.grey.shade400),
          hintText: 'Şifrenizi Giriniz',
        ),
      ),
    );
  }

  Widget mobile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: boxesdecorations(Colors.grey.shade200),
              child: Center(
                child: Column(
                  children: mobileContent(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Footer(),
        ],
      ),
    );
  }

  Widget desktop() {
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration:
                                  boxesdecorations(Colors.grey.shade600),
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  const Text(
                                      'Hala müşterimiz değil misiniz? Hemen kaydolun!'),
                                  const SizedBox(height: 15),
                                  kayitOl(),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: desktopContent(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
            const SizedBox(height: 20),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget kayitOl() {
    return Container(
      height: 45,
      width: 100,
      decoration: boxesdecorations(Colors.black),
      child: InkWell(
        onTap: () {
          MainScreen.selected = 'signup';
          MainScreen.globalKey.currentState!.setState(() {});
        },
        child: const Center(
          child: Text(
            'Kayıt Ol',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget girisYap() {
    return Container(
      height: 45,
      width: 100,
      decoration: boxesdecorations(Colors.black),
      child: InkWell(
        onTap: () async {
          var number = await UserService.signIn(
              context, _emailController.text, _passwordController.text);

          if (number == 1) {
            MainScreen.selected = 'anasayfa';
            MainScreen.globalKey.currentState!.setState(() {});
            SignIn.girisYapildi = true;
          }
        },
        child: const Center(
          child: Text(
            'Giriş Yap',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget sifremiUnuttum() {
    return InkWell(
      child: const Text('Şifrenizi mi unuttunuz?'),
      onTap: () {
        showJoinAlert(context);
      },
    );
  }

  List<Widget> desktopContent() {
    return [
      const SayfaBasi(),
      const SizedBox(height: 160),
      basliklar('E-mail'),
      const SizedBox(height: 5),
      mailAlani(),
      const SizedBox(height: 15),
      basliklar('Şifre'),
      const SizedBox(height: 5),
      sifreAlani(),
      const SizedBox(height: 15),
      girisYap(),
      const SizedBox(height: 20),
      sifremiUnuttum(),
      const SizedBox(height: 200),
    ];
  }

  Widget basliklar(String baslik) {
    return Row(
      children: [Text(baslik), const Expanded(child: SizedBox())],
    );
  }

  List<Widget> mobileContent() {
    return [
      const SizedBox(height: 100),
      basliklar('E-posta'),
      const SizedBox(height: 5),
      mailAlani(),
      const SizedBox(height: 15),
      basliklar('Şifre'),
      const SizedBox(height: 5),
      sifreAlani(),
      const SizedBox(height: 15),
      girisYap(),
      const SizedBox(height: 20),
      sifremiUnuttum(),
      const SizedBox(height: 100),
      const Text('Hala müşterimiz değil misiniz? Hemen kaydolun!'),
      const SizedBox(height: 15),
      kayitOl(),
      const SizedBox(height: 200),
    ];
  }

  void showJoinAlert(BuildContext context) async {
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
            decoration: boxesdecorations(Colors.grey.shade500),
            height: 70,
            width: 635,
            child: Center(
              child: Row(
                children: [
                  mailAlani2(),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      UserService.forgotPassword(
                          context, _emailController2.text);
                    },
                    child: Container(
                      decoration: boxesdecorations(Colors.black),
                      width: 100,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'GÖNDER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
