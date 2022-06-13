class DrivModel {
  late String email;
  late String password;
  late String name;
  late String nationalID;
  late String phone;
  late String plates;
  late String status;
  late String uId;
  late String comuID;

  DrivModel({
    required this.email,
    required this.status,
    required this.password,
    required this.name,
    required this.nationalID,
    required this.phone,
    required this.plates,
    required this.uId,
    required this.comuID,
  });

  DrivModel.fromJason(Map<String, dynamic> json)
  {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    nationalID = json['nationalID'];
    phone = json['phone'];
    plates = json['plates'];
    status = json['status'];
    uId = json['uId'];
    comuID = json['comuID'];
  }
  Map<String, dynamic> toMap()
  {
    return{
      'email':email,
      'password':password,
      'name':name,
      'status':status,
      'nationalID':nationalID,
      'phone':phone,
      'plates':plates,
      'uId':uId,
      'comuID':comuID,
    };
  }
}
