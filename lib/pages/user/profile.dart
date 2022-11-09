import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(),
    );
  }
}

class MyApp extends StatefulWidget {
  ///
  const MyApp({Key? key}) : super(key: key);

  ///
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///
  Color getRandomColor() {
    var r = Random();
    return Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard online demo',
      onGenerateInitialRoutes: (r) {
        return r == "/dashboard"
            ? [
                MaterialPageRoute(builder: (c) {
                  return const DashboardWidget();
                })
              ]
            : [
                MaterialPageRoute(builder: (c) {
                  return const MainPage();
                })
              ];
      },
      initialRoute: "/",
      routes: {
        "/": (c) => const MainPage(),
        "/dashboard": (c) => const DashboardWidget()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("style_dart framework documentation coming soon...",
              textAlign: TextAlign.center),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/dashboard");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text("Try dashboard demo"),
                )),
          )
        ],
      ),
    );
  }
}

class DashboardWidget extends StatefulWidget {
  ///
  const DashboardWidget({Key? key}) : super(key: key);

  ///
  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  ///
  final ScrollController scrollController = ScrollController();

  ///

  bool refreshing = false;

  int? slot;

  setSlot() {
    var w = MediaQuery.of(context).size.width;
    setState(() {
      slot = w > 600
          ? w > 900
              ? 8
              : 6
          : 4;
    });
  }

  List<String> d = [];

  ///
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    slot = w > 600
        ? w > 900
            ? 8
            : 6
        : 4;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4285F4),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () async {}, icon: const Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                add(context);
              },
              icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: SafeArea(child: Container()),
    );
  }

  Future<void> add(BuildContext context) async {}
}
