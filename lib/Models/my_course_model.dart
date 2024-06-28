// To parse this JSON data, do
//
//     final mycourse = mycourseFromMap(jsonString);

import 'dart:convert';

Mycourse mycourseFromMap(String str) => Mycourse.fromMap(json.decode(str));

String mycourseToMap(Mycourse data) => json.encode(data.toMap());

class Mycourse {
  final int status;
  final String message;
  final Data data;

  Mycourse({
    required this.status,
    required this.message,
    required this.data,
  });

  Mycourse copyWith({
    int? status,
    String? message,
    Data? data,
  }) =>
      Mycourse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory Mycourse.fromMap(Map<String, dynamic> json) => Mycourse(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final Userdata userdata;
  final List<Subject> subjects;
  final List<dynamic> pyqExams;
  final List<dynamic> upcomingExams;
  final String syllabus;
  final String practiceLink;

  Data({
    required this.userdata,
    required this.subjects,
    required this.pyqExams,
    required this.upcomingExams,
    required this.syllabus,
    required this.practiceLink,
  });

  Data copyWith({
    Userdata? userdata,
    List<Subject>? subjects,
    List<dynamic>? pyqExams,
    List<dynamic>? upcomingExams,
    String? syllabus,
    String? practiceLink,
  }) =>
      Data(
        userdata: userdata ?? this.userdata,
        subjects: subjects ?? this.subjects,
        pyqExams: pyqExams ?? this.pyqExams,
        upcomingExams: upcomingExams ?? this.upcomingExams,
        syllabus: syllabus ?? this.syllabus,
        practiceLink: practiceLink ?? this.practiceLink,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userdata: Userdata.fromMap(json["userdata"]),
        subjects:
            List<Subject>.from(json["subjects"].map((x) => Subject.fromMap(x))),
        pyqExams: List<dynamic>.from(json["pyq_exams"].map((x) => x)),
        upcomingExams: List<dynamic>.from(json["upcoming_exams"].map((x) => x)),
        syllabus: json["syllabus"],
        practiceLink: json["practice_link"],
      );

  Map<String, dynamic> toMap() => {
        "userdata": userdata.toMap(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
        "pyq_exams": List<dynamic>.from(pyqExams.map((x) => x)),
        "upcoming_exams": List<dynamic>.from(upcomingExams.map((x) => x)),
        "syllabus": syllabus,
        "practice_link": practiceLink,
      };
}

class Subject {
  final String id;
  final String title;
  final String courseId;
  final String levelId;
  final String order;
  final String thumbnail;
  final String background;
  final String icon;
  final String free;
  final dynamic instructorId;

  Subject({
    required this.id,
    required this.title,
    required this.courseId,
    required this.levelId,
    required this.order,
    required this.thumbnail,
    required this.background,
    required this.icon,
    required this.free,
    required this.instructorId,
  });

  Subject copyWith({
    String? id,
    String? title,
    String? courseId,
    String? levelId,
    String? order,
    String? thumbnail,
    String? background,
    String? icon,
    String? free,
    dynamic instructorId,
  }) =>
      Subject(
        id: id ?? this.id,
        title: title ?? this.title,
        courseId: courseId ?? this.courseId,
        levelId: levelId ?? this.levelId,
        order: order ?? this.order,
        thumbnail: thumbnail ?? this.thumbnail,
        background: background ?? this.background,
        icon: icon ?? this.icon,
        free: free ?? this.free,
        instructorId: instructorId ?? this.instructorId,
      );

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        courseId: json["course_id"],
        levelId: json["level_id"],
        order: json["order"],
        thumbnail: json["thumbnail"],
        background: json["background"],
        icon: json["icon"],
        free: json["free"],
        instructorId: json["instructor_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "course_id": courseId,
        "level_id": levelId,
        "order": order,
        "thumbnail": thumbnail,
        "background": background,
        "icon": icon,
        "free": free,
        "instructor_id": instructorId,
      };
}

class Userdata {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String countryCode;
  final dynamic phoneSecondary;
  final String userEmail;
  final String email;
  final String gender;
  final String place;
  final String roleId;
  final String roleLabel;
  final String deviceId;
  final String status;
  final String courseId;
  final String courseName;
  final String courseType;
  final String image;
  final dynamic androidVersion;
  final String deviceIdMessage;
  final String noCourseText;
  final String noCourseImage;
  final String contactEmail;
  final String contactPhone;
  final String contactWhatsapp;
  final String contactAddress;
  final String contactAbout;
  final String zoomId;
  final String zoomPassword;
  final String zoomApiKey;
  final String zoomSecretKey;
  final String zoomWebDomain;
  final String token;
  final String privacyPolicy;
  final String privacyPolicyText;
  final int coins;

  Userdata({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.countryCode,
    required this.phoneSecondary,
    required this.userEmail,
    required this.email,
    required this.gender,
    required this.place,
    required this.roleId,
    required this.roleLabel,
    required this.deviceId,
    required this.status,
    required this.courseId,
    required this.courseName,
    required this.courseType,
    required this.image,
    required this.androidVersion,
    required this.deviceIdMessage,
    required this.noCourseText,
    required this.noCourseImage,
    required this.contactEmail,
    required this.contactPhone,
    required this.contactWhatsapp,
    required this.contactAddress,
    required this.contactAbout,
    required this.zoomId,
    required this.zoomPassword,
    required this.zoomApiKey,
    required this.zoomSecretKey,
    required this.zoomWebDomain,
    required this.token,
    required this.privacyPolicy,
    required this.privacyPolicyText,
    required this.coins,
  });

  Userdata copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? countryCode,
    dynamic phoneSecondary,
    String? userEmail,
    String? email,
    String? gender,
    String? place,
    String? roleId,
    String? roleLabel,
    String? deviceId,
    String? status,
    String? courseId,
    String? courseName,
    String? courseType,
    String? image,
    dynamic androidVersion,
    String? deviceIdMessage,
    String? noCourseText,
    String? noCourseImage,
    String? contactEmail,
    String? contactPhone,
    String? contactWhatsapp,
    String? contactAddress,
    String? contactAbout,
    String? zoomId,
    String? zoomPassword,
    String? zoomApiKey,
    String? zoomSecretKey,
    String? zoomWebDomain,
    String? token,
    String? privacyPolicy,
    String? privacyPolicyText,
    int? coins,
  }) =>
      Userdata(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        phoneSecondary: phoneSecondary ?? this.phoneSecondary,
        userEmail: userEmail ?? this.userEmail,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        place: place ?? this.place,
        roleId: roleId ?? this.roleId,
        roleLabel: roleLabel ?? this.roleLabel,
        deviceId: deviceId ?? this.deviceId,
        status: status ?? this.status,
        courseId: courseId ?? this.courseId,
        courseName: courseName ?? this.courseName,
        courseType: courseType ?? this.courseType,
        image: image ?? this.image,
        androidVersion: androidVersion ?? this.androidVersion,
        deviceIdMessage: deviceIdMessage ?? this.deviceIdMessage,
        noCourseText: noCourseText ?? this.noCourseText,
        noCourseImage: noCourseImage ?? this.noCourseImage,
        contactEmail: contactEmail ?? this.contactEmail,
        contactPhone: contactPhone ?? this.contactPhone,
        contactWhatsapp: contactWhatsapp ?? this.contactWhatsapp,
        contactAddress: contactAddress ?? this.contactAddress,
        contactAbout: contactAbout ?? this.contactAbout,
        zoomId: zoomId ?? this.zoomId,
        zoomPassword: zoomPassword ?? this.zoomPassword,
        zoomApiKey: zoomApiKey ?? this.zoomApiKey,
        zoomSecretKey: zoomSecretKey ?? this.zoomSecretKey,
        zoomWebDomain: zoomWebDomain ?? this.zoomWebDomain,
        token: token ?? this.token,
        privacyPolicy: privacyPolicy ?? this.privacyPolicy,
        privacyPolicyText: privacyPolicyText ?? this.privacyPolicyText,
        coins: coins ?? this.coins,
      );

  factory Userdata.fromMap(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        phoneSecondary: json["phone_secondary"],
        userEmail: json["user_email"],
        email: json["email"],
        gender: json["gender"],
        place: json["place"],
        roleId: json["role_id"],
        roleLabel: json["role_label"],
        deviceId: json["device_id"],
        status: json["status"],
        courseId: json["course_id"],
        courseName: json["course_name"],
        courseType: json["course_type"],
        image: json["image"],
        androidVersion: json["android_version"],
        deviceIdMessage: json["device_id_message"],
        noCourseText: json["no_course_text"],
        noCourseImage: json["no_course_image"],
        contactEmail: json["contact_email"],
        contactPhone: json["contact_phone"],
        contactWhatsapp: json["contact_whatsapp"],
        contactAddress: json["contact_address"],
        contactAbout: json["contact_about"],
        zoomId: json["zoom_id"],
        zoomPassword: json["zoom_password"],
        zoomApiKey: json["zoom_api_key"],
        zoomSecretKey: json["zoom_secret_key"],
        zoomWebDomain: json["zoom_web_domain"],
        token: json["token"],
        privacyPolicy: json["privacy_policy"],
        privacyPolicyText: json["privacy_policy_text"],
        coins: json["coins"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "country_code": countryCode,
        "phone_secondary": phoneSecondary,
        "user_email": userEmail,
        "email": email,
        "gender": gender,
        "place": place,
        "role_id": roleId,
        "role_label": roleLabel,
        "device_id": deviceId,
        "status": status,
        "course_id": courseId,
        "course_name": courseName,
        "course_type": courseType,
        "image": image,
        "android_version": androidVersion,
        "device_id_message": deviceIdMessage,
        "no_course_text": noCourseText,
        "no_course_image": noCourseImage,
        "contact_email": contactEmail,
        "contact_phone": contactPhone,
        "contact_whatsapp": contactWhatsapp,
        "contact_address": contactAddress,
        "contact_about": contactAbout,
        "zoom_id": zoomId,
        "zoom_password": zoomPassword,
        "zoom_api_key": zoomApiKey,
        "zoom_secret_key": zoomSecretKey,
        "zoom_web_domain": zoomWebDomain,
        "token": token,
        "privacy_policy": privacyPolicy,
        "privacy_policy_text": privacyPolicyText,
        "coins": coins,
      };
}
