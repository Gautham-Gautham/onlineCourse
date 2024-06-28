import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinecourse/Core/API%20Services/api_services.dart';
import 'package:onlinecourse/Features/Course/Screens/course_screen.dart';
import 'package:onlinecourse/Models/my_course_model.dart';

import '../../../main.dart';

class MainNavBAr extends ConsumerStatefulWidget {
  const MainNavBAr({super.key});

  @override
  ConsumerState createState() => _MainNavBArState();
}

class _MainNavBArState extends ConsumerState<MainNavBAr> {
  ScrollController scrollController = ScrollController();
  final showBottomNavBar = StateProvider<bool>((ref) => true);
  List<Map<String, dynamic>> item = [
    {
      "name": "Exam",
      "image": "assets/images/exam.png",
      "color": Colors.pinkAccent
    },
    {
      "name": "Practice",
      "image": "assets/images/practice.png",
      "color": Colors.orangeAccent
    },
    {
      "name": "Materials",
      "image": "assets/images/book 1.png",
      "color": Colors.lightBlueAccent
    },
  ];
  List<Map<String, dynamic>> item1 = [
    {
      "name": "KTET",
      "image": "assets/images/teacher.png",
      "color": Colors.lightBlueAccent
    },
    {
      "name": "LP/UP/HST",
      "image": "assets/images/lp.png",
      "color": Colors.orangeAccent
    },
    {
      "name": "SET",
      "image": "assets/images/teacher2.png",
      "color": Colors.brown
    },
    {
      "name": "NET",
      "image": "assets/images/teacher3.png",
      "color": Colors.pinkAccent.shade400
    },
    {
      "name": "Montessori",
      "image": "assets/images/teacher4.png",
      "color": Colors.purpleAccent
    },
    {
      "name": "Crash",
      "image": "assets/images/crash.png",
      "color": Colors.pinkAccent
    },
  ];
  final mycourseP = StateProvider<Mycourse?>(
    (ref) => null,
  );
  getCourse() {
    ref.read(apiProvider).getMyCourse().then((value) {
      print("object");
      print(value.data.toMap());
      ref.read(mycourseP.notifier).update((state) => value);
    }).onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    });
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(showBottomNavBar.notifier).update((state) => false);
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(showBottomNavBar.notifier).update((state) => true);
        });
      }
    });
    getCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(mycourseP);
    return SafeArea(
      child: Scaffold(
        body: result == null
            ? Center(
                child: Text("No Data"),
              )
            : SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
                      height: h * 0.25,
                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(w * 0.05),
                              bottomRight: Radius.circular(w * 0.05))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi Good Morning !",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                  Text(
                                    result.data.userdata.firstName,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.025,
                                    width: w * 0.15,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(w * 0.025)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "10",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w800,
                                              color: Colors.orangeAccent),
                                        ),
                                        Icon(
                                          CupertinoIcons
                                              .money_dollar_circle_fill,
                                          color: Colors.orangeAccent,
                                          size: w * 0.05,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.05,
                                  ),
                                  CircleAvatar(
                                    radius: w * 0.05,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        result.data.userdata.image),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: w * 0.05, right: w * 0.05),
                            height: h * 0.08,
                            width: w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * 0.025)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Selected Course",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      "Montessori",
                                      style: GoogleFonts.inter(
                                        fontSize: w * 0.05,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(w * 0.02)))),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Change",
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: w * 0.04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          CupertinoIcons.arrow_right_arrow_left,
                                          color: Colors.white,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(result.data.subjects.length, (index) {
                          final res = result.data.subjects[index];
                          print(res.title);
                          return Container(
                            width: w * 0.25,
                            height: w * 0.25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(item[index]["image"]!)),
                                color: item[index]["color"],
                                borderRadius: BorderRadius.circular(w * 0.03)),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              // padding:
                              //     EdgeInsets.only(left: w * 0.05, right: w * 0.05),
                              height: h * 0.03,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(w * 0.03),
                                      bottomRight: Radius.circular(w * 0.03))),
                              child: Center(
                                child: Text(
                                  item[index]["name"] ?? "",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Courses",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: w * 0.05,
                                color: Colors.black),
                          ),
                          Text(
                            "See All",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: w * 0.05,
                                color: Colors.deepPurple),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      // flex: 0,
                      height: h * 0.14,
                      width: w,
                      child: GridView.builder(
                        // shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          // mainAxisSpacing: 50, // Spacing between rows
                          // crossAxisSpacing: 15, // Spacing between columns
                          // childAspectRatio: 1.5, // Aspect ratio of each item
                        ),
                        itemCount: result.data.subjects.length,
                        itemBuilder: (context, index) {
                          final data = result.data.subjects[index];
                          print("----------------------------");
                          print(data.toMap());
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseScreen(
                                      course: data,
                                    ),
                                  ));
                            },
                            child: Column(
                              children: [
                                DashedCircleAvatar(
                                  imageUrl: item1[index]["image"],
                                  size: w * 0.2,
                                  borderColor: item1[index]["color"],
                                  dashWidth: 18.0,
                                  dashGap: 5.0,
                                ),
                                Text(
                                  item1[index]["name"],
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: w * 0.04,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Latest Test Series",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: w * 0.05,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Exam 102 - Biology",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: w * 0.04,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "10 Questions  120 mins",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: w * 0.035,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    height: h * 0.05,
                                    width: w * 0.4,
                                    child: Center(
                                      child: Text(
                                        "Attempt Now",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: w * 0.035,
                                            color: Colors.deepPurple),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(w * 0.025)),
                                  )
                                ],
                              ),
                              width: w * 0.5,
                              height: h * 0.08,
                              decoration: BoxDecoration(
                                  color: item[index]['color'],
                                  borderRadius:
                                      BorderRadius.circular(w * 0.05)),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          child: Icon(Icons.widgets),
        ),
        bottomNavigationBar: Consumer(
          builder: (context, ref1, child) => AnimatedContainer(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            duration: const Duration(milliseconds: 800),
            height: 70,
            curve: Curves.easeInOutSine,
            child: BottomAppBar(
              notchMargin: 8.0,
              shape: const CircularNotchedRectangle(),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.book)),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.account_box)),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashedCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Color borderColor;
  final double dashWidth;
  final double dashGap;

  DashedCircleAvatar({
    required this.imageUrl,
    required this.size,
    required this.borderColor,
    required this.dashWidth,
    required this.dashGap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: borderColor, borderRadius: BorderRadius.circular(50)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 30,
            // height: 30,
            fit: BoxFit.cover,
          ),
          CustomPaint(
            size: Size(size + 1, size + 1),
            painter: DashedBorderPainter(
              color: borderColor,
              dashWidth: dashWidth,
              dashGap: dashGap,
            ),
          ),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashGap;

  DashedBorderPainter({
    required this.color,
    required this.dashWidth,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    final Path dashedPath = _createDashedPath(path, dashWidth, dashGap);

    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path path, double dashWidth, double dashGap) {
    final Path dashedPath = Path();
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashGap;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
