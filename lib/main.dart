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
        DestinationDetails(path: "assets/campagne_pics.jpg", place: 'Paris, France', date: '3-9 avril', price: '120€ nuit'),
        DestinationDetails(path: "assets/venise.jpg", place: 'Venise, Italie', date: '3-9 avril', price: '120€ nuit'),
        DestinationDetails(path: "assets/new_york.jpeg", place: 'New York, USA', date: '3-9 avril', price: '200€ nuit'),
        DestinationDetails(path: "assets/bali.jpg", place: 'Bali, Indonésie', date: '3-9 avril', price: '300€ nuit'),
        DestinationDetails(path:"assets/chamonix.jpg", place: 'Chamonix, France', date: '3-9 avril', price: '120€ nuit'),
      ],
    );
  }
}

class DestinationDetails extends StatelessWidget {
  final String path;
  final String place;
  final String date;
  final String price;
  const DestinationDetails({super.key, required this.path, required this.place, required this.date, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [DestinationPhoto(path: path), DestinationInfos(place: place,date: date, price: price,)],
    );
  }
}


class DestinationPhoto extends StatelessWidget {
  final String path;
  const DestinationPhoto({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 3.0,
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            errorBuilder: (context, _, __) =>
            const Icon(Icons.warning, color: Colors.red),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
        ),
        Positioned(left: 8, top: 8, child: MembersFavorite())
      ],
    );
  }
}

class MembersFavorite extends StatelessWidget {
  const MembersFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white70,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: Colors.pink),
          /*SizedBox(width: 12),*/
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Coup de coeur Voyageurs'),
          )
        ],
      ),
    );
  }
}


class DestinationInfos extends StatelessWidget {
  final String place;
  final String date;
  final String price;
  DestinationInfos({super.key, required this.place, required this.date, required this.price});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(place),
              Spacer(),
              Icon(Icons.star, color: Colors.orange),
              Text('4.78')
            ],
          ),
          Text(date),
          Text(price),
        ],
      ),
    );
  }
}
