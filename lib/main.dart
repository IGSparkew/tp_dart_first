import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Où partons nous ?",
      debugShowCheckedModeBanner: false,
      home: AppBarApp(),
    );
  }
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 5;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Où partons nous ?'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_box),
              color: Colors.red,
              onPressed: () {},
            )
          ],
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.house_siding),
                text: "Campagne",
              ),
              Tab(
                icon: Icon(Icons.houseboat_outlined),
                text: "Sur l\'eau",
              ),
              Tab(
                icon: Icon(Icons.panorama),
                text: "Avec vue",
              ),
              Tab(
                icon: Icon(Icons.scuba_diving),
                text: "Bord de mer",
              ),
              Tab(
                icon: Icon(Icons.downhill_skiing),
                text: "Ski",
              ),
            ],
          ),
        ),
        body: BodyTabApp(),
      ),
    );
  }
}

class BodyTabApp extends StatelessWidget {
  const BodyTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/campagne_pics.jpg'),
            Column(
                children: <Widget>[
              Row(
                children: [
                  Text('campagne'),
                ],
              )
            ]),
          ],
        ),
        Container(child: Text("sur l'eau")),
        Container(child: Text("avec vue")),
        Container(child: Text("bord de mer")),
        Container(child: Text("ski")),
      ],
    );
  }
}
