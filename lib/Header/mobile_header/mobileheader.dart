import 'package:flutter/material.dart';
import 'package:ic_camasir_site/mainscreen.dart';

class MobileHeader extends StatefulWidget {
  const MobileHeader({Key? key}) : super(key: key);
  @override
  _MobileHeaderState createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Container(
            width: double.infinity,
            height: 75,
            color: Colors.grey.shade900,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    MainScreen.globalKey.currentState!.setState(() {
                      MainScreen.scaffoldKey.currentState!.openDrawer();
                    });
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const Text(
                          'AURORA',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: const [
                            Expanded(child: SizedBox()),
                            Text(
                              'İÇ GİYİM',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
