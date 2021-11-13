import 'package:flutter/material.dart';
import 'package:frontend/charts/di.dart';
import 'package:get_it/get_it.dart';

import 'navigation_bar.dart';
import 'account_view.dart';
import 'monitor_view.dart';

final GetIt di = GetIt.instance;

void main() {
  chartsFeatureDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  List<Widget> views = [
    MonitorController.withSampleData(),
    AccountViewController((item) {
      print("Clicou no " + item.toString());
    })
  ];

  @override
  Widget build(BuildContext context) {
    prepareViews();
    return Scaffold(
      body: TabBarView(controller: _tabController, children: views),
      bottomNavigationBar: NavigationBarController((position) {
        _tabController.animateTo(position);
      }),
    );
  }

  MonitorController prepareMonitorControllerView() {
    return MonitorController(animate: true);
  }

  prepareViews() {
    views = [
      prepareMonitorControllerView(),
      AccountViewController((item) {
        print("Clicou no " + item.toString());
      })
    ];
  }
}
