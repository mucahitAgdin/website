import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'itemler.dart';

import 'package:responsive_builder/responsive_builder.dart';

class Dondurucu extends StatefulWidget {
  const Dondurucu({Key? key}) : super(key: key);

  @override
  _DondurucuState createState() => _DondurucuState();
}

int _currentIndex = 0;
List cardListmobile = [
  Itemler().item('assets/images/anasayfa_slider/1.jpg', 288),
  Itemler().item('assets/images/anasayfa_slider/2.jpg', 288),
  Itemler().item('assets/images/anasayfa_slider/3.jpg', 288),
  Itemler().item('assets/images/anasayfa_slider/4.jpg', 288)
];
List<T> mapmobile<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

List cardListdesktop = [
  Itemler().item('assets/images/anasayfa_slider/1.jpg', 488),
  Itemler().item('assets/images/anasayfa_slider/2.jpg', 488),
  Itemler().item('assets/images/anasayfa_slider/3.jpg', 488),
  Itemler().item('assets/images/anasayfa_slider/4.jpg', 488)
];
List<T> mapdesktop<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class _DondurucuState extends State<Dondurucu> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return info.deviceScreenType == DeviceScreenType.desktop
          ? desktop()
          : mobile();
    });
  }

  Widget mobile() {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardListmobile.map((card) {
              return Builder(builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.transparent,
                    child: card,
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: mapmobile<Widget>(cardListmobile, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.purple.shade200
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget desktop() {
    return SizedBox(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardListdesktop.map((card) {
              return Builder(builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.transparent,
                    child: card,
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: mapdesktop<Widget>(cardListdesktop, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.purple.shade200
                      : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
