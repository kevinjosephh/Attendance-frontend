import 'dart:convert';

/* -------------------------------------------------------------------------- */
/*                   //! Basic authentication credentials :                   */
/* -------------------------------------------------------------------------- */
String basicAuth_username = 'rushi.creates';
String basicAuth_password = 'noq@123***';
String basicAuth = 'Basic ' +
    base64Encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

class ApiLinks {
/* -------------------------------------------------------------------------- */
/*                                 //! Domain                                 */
/* -------------------------------------------------------------------------- */
  static const String domainUrl =
      'https://attendance-qr-sys.herokuapp.com/users/api/v1/';

/* -------------------------------------------------------------------------- */
/*                                //! Endpoints                               */
/* -------------------------------------------------------------------------- */

  static const String user_login = domainUrl + 'login/';
  static const String user_register = domainUrl + 'student_register';
  static const String teacher_register = domainUrl + 'teacher_register';
  static const String user_profile = domainUrl + 'profile/';
  static const String class_register = domainUrl + 'add_class/';
  static const String students = domainUrl + 'student_profiles/';
  static const String teachers = domainUrl + 'teacher_profiles/';
  static const String student_Attendance = domainUrl + 'log';
  static const String courses = domainUrl + 'courses/';
}
