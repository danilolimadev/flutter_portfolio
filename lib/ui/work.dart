import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widget/custom_text.dart';
import 'package:flutter_portfolio/widget/workbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  WorkState createState() => WorkState();
}

class WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: "02.",
                textsize: 20.0,
                color: Color(0xff61F9D5),
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                width: 12.0,
              ),
              const CustomText(
                text: "Where I've Worked",
                textsize: 26.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                width: size.width / 4,
                height: 1.10,
                color: const Color(0xff303C55),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                    height: size.height * 1.2,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        const Center(
                          child: VerticalDivider(
                            color: Color(0xff64FFDA),
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: FaIcon(FontAwesomeIcons.houseLaptop,
                                  color: Colors.white),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              child: FaIcon(FontAwesomeIcons.freeCodeCamp,
                                  color: Colors.white),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.brown,
                              child: FaIcon(FontAwesomeIcons.laptopCode,
                                  color: Colors.white),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: FaIcon(FontAwesomeIcons.mugSaucer,
                                  color: Colors.white),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: FaIcon(FontAwesomeIcons.dev,
                                  color: Colors.white),
                            ),
                          ],
                        ))
                      ],
                    )),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: size.height * 1.2,
                  child: const WorkBox(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
