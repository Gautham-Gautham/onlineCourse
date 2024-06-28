import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinecourse/Features/MainCouurse/Screens/main_course.dart';
import 'package:onlinecourse/Models/my_course_model.dart';

import '../../../main.dart';

class CourseScreen extends ConsumerStatefulWidget {
  final Subject course;
  const CourseScreen({super.key, required this.course});

  @override
  ConsumerState createState() => _CourseScreenState();
}

class _CourseScreenState extends ConsumerState<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.course.toMap());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            // controller: scrollController,
            child: Stack(
          children: [
            Container(
              height: h + h * 0.2,
              width: w,
              child: Column(
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
                    height: h * 0.25,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                            )),
                        Text(
                          widget.course.title,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.05,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: w * 0.15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: h * 0.18,
              child: Container(
                // color: Colors.black,
                width: w,
                height: h * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: h * 0.05,
                        width: w * 0.15,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white, width: w * 0.01),
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(w * 0.1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Day",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.035,
                                  color: Colors.deepPurple),
                            ),
                            Text(
                              "${index + 1}",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.035,
                                  color: Colors.deepPurple),
                            ),
                            Text(
                              "01/04",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.035,
                                  color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
                top: h * 0.35,
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: w,
                  height: h * 0.15,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/lock.png")),
                      color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(w * 0.05)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.5,
                        child: Text(
                          "Upgrade and unlock the full course",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: w * 0.04,
                              color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(w * 0.02)))),
                          child: Text(
                            "Upgrade",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ],
                  ),
                )),
            Positioned(
                top: h * 0.55,
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: w,
                  height: h * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(w * 0.05)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " WhatsApp ലെ സഹായത്തിനായി",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: w * 0.04,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w * 0.5,
                            child: Text(
                              "8606017527",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(w * 0.2)))),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: w * 0.03,
                                    child: Icon(
                                      Icons.phone,
                                      size: w * 0.04,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "WhatsApp",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: w * 0.035,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: h * 0.75,
                child: Container(
                  width: w,
                  height: h * 0.45,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainCourse(),
                              ));
                        },
                        child: Card(
                          surfaceTintColor: Colors.white,
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: h * 0.15,
                            width: w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/Rectangle592.png"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Day 3 - Lesson 1",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: w * 0.035,
                                          color: Colors.deepPurple),
                                    ),
                                    Text(
                                      "All About DID",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: w * 0.05,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: w * 0.09,
                                  backgroundColor: Colors.deepPurple,
                                  child: CircleAvatar(
                                    radius: w * 0.075,
                                    child: Text(
                                      "10.3 min",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: w * 0.03,
                                          color: Colors.grey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
