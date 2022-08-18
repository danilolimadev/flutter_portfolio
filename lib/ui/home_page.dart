import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/method.dart';
import 'package:flutter_portfolio/ui/about.dart';
import 'package:flutter_portfolio/ui/feature_project.dart';
import 'package:flutter_portfolio/ui/work.dart';
import 'package:flutter_portfolio/widget/appbar_title.dart';
import 'package:flutter_portfolio/widget/custom_text.dart';
import 'package:flutter_portfolio/widget/main_title.dart';
import 'package:flutter_portfolio/widget/os_images.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      //print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    //print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index!,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.change_history,
                            size: 32.0,
                            color: Color(0xff64FFDA),
                          ),
                          onPressed: () {}),
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: const [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Us',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: const Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return Colors.red;
                                  }
                                  if (states.contains(MaterialState.hovered)) {
                                    return const Color(0xFF3E0449);
                                  }
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.blue;
                                  }
                                  return null; // Defer to the widget's default.
                                }),
                              ),
                              onPressed: () {
                                method.launchURL(
                                    "https://drive.google.com/file/d/1yHLcrN5pCUGIeT8SrwC2L95Lv0MVbJpx/view?usp=sharing");
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: Color(0xff64FFDA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  SizedBox(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github),
                            color: const Color(0xffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://github.com/danilolimadev");
                            }),
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.twitter),
                            color: const Color(0xffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              //method.launchURL("https://twitter.com/champ_96k");
                            }),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          color: const Color(0xffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/danilo-lima-55b228126/");
                          },
                          iconSize: 16.0,
                        ),
                        /*IconButton(
                            icon: const Icon(Icons.call),
                            color: const Color(0xffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchCaller();
                            }),*/
                        IconButton(
                            icon: const Icon(Icons.mail),
                            color: const Color(0xffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * .06,
                                  ),
                                  const CustomText(
                                    text: "Hi, my name is",
                                    textsize: 16.0,
                                    color: Color(0xff41FBDA),
                                    letterSpacing: 3.0,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const CustomText(
                                    text: "Danilo Lima.",
                                    textsize: 68.0,
                                    color: Color(0xffCCD6F6),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  CustomText(
                                    text:
                                        "I build things for the Mobile and web.",
                                    textsize: 56.0,
                                    color: const Color(0xffCCD6F6)
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: size.height * .04,
                                  ),
                                  Wrap(
                                    children: const [
                                      Text(
                                        "I'm a freelancer based in Santa Rita do Sapucaí, BR specializing in \nbuilding websites, applications, and everything in between.",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          letterSpacing: 2.75,
                                          wordSpacing: 0.75,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * .12,
                                  ),

                                  //get in tuch text
                                  InkWell(
                                    onTap: () {
                                      method.launchEmail();
                                    },
                                    hoverColor: const Color(0xff64FFDA)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.09,
                                      width: size.width * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff64FFDA),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        "Get In Touch",
                                        style: TextStyle(
                                          color: Color(0xff64FFDA),
                                          letterSpacing: 2.75,
                                          wordSpacing: 1.0,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: size.height * 0.20,
                                  ),
                                ],
                              ),

                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: const About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: const Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                index: 2,
                                child: Column(
                                  children: [
                                    const MainTiitle(
                                      number: "0.3",
                                      text: "Some Things I've Built",
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    FeatureProject(
                                      imagePath: "images/pic9.jpg",
                                      ontab: () {
                                        method.launchURL(
                                            "https://github.com/danilolimadev/facebook_clone_flutter");
                                      },
                                      projectDesc:
                                          "A Mobile app for Android IOS and Web. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                      projectTitle: "Facebook Clone UI",
                                      tech1: "Flutter",
                                      tech2: "Dart",
                                      tech3: "Flutter UI",
                                    ),
                                    FeatureProject(
                                      imagePath: "images/pic9.jpg",
                                      ontab: () {
                                        method.launchURL(
                                            "https://github.com/danilolimadev/netflix_clone_flutter");
                                      },
                                      projectDesc:
                                          "A Mobile app for both Android, IOS and Web. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                      projectTitle: "Netflix Clone UI",
                                      tech1: "Flutter",
                                      tech2: "Dart",
                                      tech3: "Flutter UI",
                                    ),
                                    FeatureProject(
                                      imagePath: "images/pic9.jpg",
                                      ontab: () {
                                        method.launchURL(
                                            "https://github.com/danilolimadev/wordle_clone_flutter");
                                      },
                                      projectDesc:
                                          "A Mobile app for Android, IOS and Desktop. Play the famous game wordle.",
                                      projectTitle: "Wordle Clone",
                                      tech1: "Flutter",
                                      tech2: "Dart",
                                      tech3: "Game",
                                    ),

                                    const MainTiitle(
                                      number: "0.4",
                                      text: "Open Source Project",
                                    ),

                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),

                                    //other Projects
                                    SizedBox(
                                      height: size.height * 0.86,
                                      width: size.width - 100,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              OSImages(
                                                image: "images/pic101.png",
                                              ),
                                              OSImages(
                                                image: "images/pic103.png",
                                              ),
                                              OSImages(
                                                image: "images/pic111.gif",
                                              ),
                                              OSImages(
                                                image: "images/pic113.jfif",
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CustomText(
                                                text: "Payment Getway",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Chat App",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Spotify Clone",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "TODO App",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    //other Projects
                                    SizedBox(
                                      height: size.height * 0.86,
                                      width: size.width - 100,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              OSImages(
                                                image: "images/pic114.png",
                                              ),
                                              OSImages(
                                                image: "images/pic115.png",
                                              ),
                                              OSImages(
                                                image: "images/pic116.jfif",
                                              ),
                                              OSImages(
                                                image: "images/pic117.png",
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CustomText(
                                                text: "Spannish Audio",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Drumpad",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Currency Converter",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Calculator",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    //other Projects
                                    SizedBox(
                                      height: size.height * 0.86,
                                      width: size.width - 100,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              OSImages(
                                                image: "images/pic118.jpeg",
                                              ),
                                              OSImages(
                                                image: "images/pic119.jpeg",
                                              ),
                                              OSImages(
                                                image: "images/pic120.png",
                                              ),
                                              OSImages(
                                                image: "images/pic121.png",
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CustomText(
                                                text: "Prime Videos UI",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Tic Tac Toe Game",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Currency Converter UI",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                              CustomText(
                                                text: "Love Calculator",
                                                textsize: 16.0,
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.75,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 6.0,
                              ),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const CustomText(
                                            text: "0.4 What's Next?",
                                            textsize: 16.0,
                                            color: Color(0xff41FBDA),
                                            letterSpacing: 3.0,
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          const CustomText(
                                            text: "Get In Touch",
                                            textsize: 42.0,
                                            color: Colors.white,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "I am currently looking for opportunities, my inbox is always open.\n If you have a question or just want to say hi, I'll do my best to answer it for you!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  letterSpacing: 0.75,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 32.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              method.launchEmail();
                                            },
                                            child: Card(
                                              elevation: 4.0,
                                              color: const Color(0xff64FFDA),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(0.85),
                                                height: size.height * 0.09,
                                                width: size.width * 0.10,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff0A192F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                                  child: Text(
                                                    "Say Hi",
                                                    style: TextStyle(
                                                      color: Color(0xff64FFDA),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Footer
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      //color: Colors.white,
                                      child: Text(
                                        "Designed & Built by Danilo Lima 💙 Flutter",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          letterSpacing: 1.75,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "danilolimadev@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
