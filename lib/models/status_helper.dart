class StatusHelper {
  static const defaultErrCode = 99;

  static const statusList = [
    200,
    201,
    206,
  ];

  static bool hasError(int status) {
    return statusList.contains(status);
  }
}
