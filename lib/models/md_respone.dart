class MdRespone {
  String status;
  String message;
  dynamic data;

  MdRespone({required this.status, required this.message, this.data});

  // สร้างจาก JSON
  factory MdRespone.fromJson(Map<String, dynamic> json) {
    return MdRespone(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'],
    );
  }

  // แปลงเป็น JSON
  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data};
  }
}
