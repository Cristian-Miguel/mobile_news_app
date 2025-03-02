class ResponseModel<T> {
  final bool success;
  final String message;
  final T? data;
  final List<T>? dataList;

  ResponseModel(
      {required this.success, required this.message, this.data, this.dataList});

  factory ResponseModel.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    if (json['data'] is List) {
      return ResponseModel<T>(
        success: json['success'],
        message: json['message'],
        dataList:
            (json['data'] as List).map((item) => fromJsonT(item)).toList(),
      );
    } else {
      return ResponseModel<T>(
        success: json['success'],
        message: json['message'],
        data: json['data'] != null ? fromJsonT(json['data']) : null,
      );
    }
  }
}
