import 'package:flutter/material.dart';

import 'package:ic_camasir_site/mainscreen.dart';

class Entry {
  final String title;
  final List<Entry> children;
  final String? route;
  Entry(this.title, {this.children = const <Entry>[], this.route});
}

final List<Entry> data = <Entry>[
  Entry('ANASAYFA', route: 'anasayfa'),
  Entry(
    'KADIN',
    children: <Entry>[
      Entry('SÜTYEN', route: 'sütyen'),
      Entry('ATLET', route: 'atlettakim'),
      Entry('JARTİYER', route: 'jartiyer'),
    ],
  ),
  Entry(
    'ERKEK',
    children: <Entry>[
      Entry('BOXER', route: 'boxer'),
      Entry('ATLET', route: 'atlet'),
    ],
  ),
  Entry('İLETİŞİM', route: 'iletisim'),
];

class EntryItem extends StatefulWidget {
  const EntryItem(this.entry, {Key? key}) : super(key: key);
  final Entry entry;

  @override
  State<EntryItem> createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
        onTap: () {
          MainScreen.globalKey.currentState!.setState(
            () {
              MainScreen.selected = root.route.toString();
              MainScreen.scaffoldKey.currentState!.openEndDrawer();
            },
          );
        },
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.entry);
  }
}
