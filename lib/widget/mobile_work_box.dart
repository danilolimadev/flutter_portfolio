import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widget/work_custom_data.dart';

class MobileWork extends StatelessWidget {
  const MobileWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        WorkCustomData(
          title: "Nexcode Eletrônica",
          subTitle: "Software Developer Intern",
          duration: "Ago - 2016 - Jul - 2018",
        ),
        WorkCustomData(
          title: "Nexcode Eletrônica",
          subTitle: "Eletronics Technician",
          duration: "Ago - 2018 to Jul - 2020",
        ),
        WorkCustomData(
          title:
              "Nexcode Eletrônica",
          subTitle:
              "Junior Control and Automation Engineer",
          duration: "Jul - 2020 to Present",
        ),
        WorkCustomData(
          title:
              "Freelancer - Flutter | Dart Mobile App Developer | Web Developer",
          subTitle:
              "Mobile and Web developer. Experienced programmer with coding solutions. Skilled in Flutter/Dart, Full Stack\n development. I have been developing software for 6+ years and take pride in everything I do.",
          duration: "Ago - 2019 to Present",
        ),
      ],
    );
  }
}
