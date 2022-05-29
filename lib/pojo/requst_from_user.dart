class RequstWinsh {
  String location;
  String name;
  String phone;
  String uuid;
  String status;
  String userid;
  String time;

  RequstWinsh({
    required this.location,
    required this.name,
    required this.phone,
    required this.uuid,
    required this.status,
    required this.userid,
    required this.time,
  });

static RequstWinsh fromJson(Map<String, dynamic> json) => RequstWinsh(
    location: json['location'],
    name: json['name'],
    phone: json['phone'],
    uuid: json['uuid'],
    status: json['status'],
    userid: json['userid'],
    time: json['time'],
  );

  Map<String, dynamic> toJson() => {
    'location': location,
    'name': name,
    'phone': phone,
    'uuid': uuid,
    'status': status,
    'userid': userid,
    'time': time,
  };
}