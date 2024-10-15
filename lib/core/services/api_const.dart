class ApiConst {
  ApiConst();
  // base url
  static const String baseURL = "https://sms-api.memnagargurukul.in/";
  // static const String baseURL = "http://127.0.0.1:8000/";
  // static const String baseURL = "http://192.168.240.85:8000/";

  // api endpoints
  static const String loginEp = "user/login";
  static const String refreshTokenEp = "user/refreshToken";
  static const String checkVersionEp = "app/version";
  static const String searchUserEp = "user/search";
  static const String resetPassEp = "user/resetPassword";
  static const String loginHistoryEp = "user/loginHistory";

  static const String smartboardLinksEp = "raspberry/links";
  static const String deleteImageEp = "raspberry/image/delete";
  static const String deleteVideoEp = "raspberry/video/delete";
  static const String noticeListEp = "raspberry/notice/list";
  static const String deleteNoticeEp = "raspberry/notice/remove";
  static const String uploadImageEp = "raspberry/upload/image";
  static const String uploadVideoEp = "raspberry/upload/video";
  static const String addNoticeEp = "raspberry/notice/add";
  static const String refreshEp = "raspberry/refresh";

  static const String getStudentsListEp = "student/list";
  static const String addStudentsDataEp = "student/create";
  static const String updateStudentDataEp = "student";
  static const String getStudentDataEp = "student/get";
  static const String uploadBulkPhotoEp = "student/upload/bulk/photo";
  static const String updateRoomEp = "student/room";
  static const String updateSchoolEp = "student/school";
  static const String leftStudentEp = "student/leftStudent";

  static const String getStandardListEp = "student/standards";
  static const String addStandardDataEp = "student/standard/create";

  static const String getRoomListEp = "student/roomList";
  static const String addRoomDataEp = "student/room/create";

  static const String getCupboardListEp = "allCupboards";
  static const String getVacantCupboardListEp = "cupboards";
  static const String addCupboardDataEp = "cupboard/create";

  static const String getBatchListEp = "batch";
  static const String addBatchDataEp = "batch";
  static const String setCurrentBatch = "batch/set_current";

  // users
  static const String getUserListEp = "user/listUser";
  static const String addUserDataEp = "user/createUser";
  static const String updateUserDataEp = "user/updateUser";
  static const String activateUserEp = "user/activeUser";
  static const String deactivateUserEp = "user/deactiveUser";
  static const String changePassEp = "user/changePassword";

  // attendance
  static const String getAttendOptionEp = "attendance";
  static const String getSchoolStdAttendEp = "attendance/school/stdWise";
  static const String getStdAttendEp = "attendance/stdWise";
  static const String getRoomAttendEp = "attendance/roomWise";
  static const String getFloorAttendEp = "attendance/floorWise";
  static const String takeAttendaceEp = "attendance/takeAttendance";
  static const String getAttendListDataEp = "attendance/getAttendance";
  static const String getStuDetailsEp = "attendance/getAttendanceDetail";
  static const String getAbsentStuDataEp = "attendance/getAbcent";
  static const String updateAttendDataEp = "attendance/updateAttendance";

  // users
  static const String getFeesDashEp = "fees/dashboard/details";
  static const String getFeesListEp = "fees";
  static const String addFeesDataEp = "fees";
  static const String updateFeesDataEp = "fees";
  static const String toggleFeesEp = "fees/toggleActive";
  static const String getFeesDataEp = "fees";
  static const String deleteFeesDataEp = "fees/deleteFee";
  static const String getStuFeesDataEp = "fees/get/feesForStudent";
  static const String getStdReportDataEp = "fees/report/std";
  static const String feesExceptionEp = "fees/exception";
  static const String payHistDataEp = "fees/payment_history";
}
