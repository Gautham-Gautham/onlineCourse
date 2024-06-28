import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class MainCourse extends ConsumerStatefulWidget {
  const MainCourse({super.key});

  @override
  ConsumerState createState() => _MainCourseState();
}

class _MainCourseState extends ConsumerState<MainCourse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
              height: h * 0.25,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/Classvideo.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subject Name",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.05,
                        color: Colors.black),
                  ),
                  Text(
                    "Part - 01 | 1hr 37m",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: w * 0.05,
                        color: Colors.grey),
                  ),
                  Text(
                    "Topics Covered",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: w * 0.05,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Container(
                        // width: w * 0.3,
                        height: h * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(w * 0.5)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.book_circle_fill,
                              color: Colors.greenAccent,
                            ),
                            Text("White Critically"),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        // width: w * 0.3,
                        height: h * 0.05,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(w * 0.5)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.book_circle_fill,
                              color: Colors.pinkAccent,
                            ),
                            Text("Recognize & Reinforce"),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 0,
                    // width: w,
                    // height: h * 0.7,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/Rectangle592.png"),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
