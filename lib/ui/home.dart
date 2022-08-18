import 'package:flutter/widgets.dart';
import 'package:flutter_portfolio/ui/home_page.dart';
import 'package:flutter_portfolio/ui/mobile_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return const HomePage();
        } else {
          return const MobileHome();
        }
      },
    );
  }
}
