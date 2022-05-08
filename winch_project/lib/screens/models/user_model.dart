
class ComModel {

      late String name;
      late String email;
      late String number;
      late String password;
      late String company_address;
      late String uId;

  ComModel({

    required this.name,
    required this.email,
    required this.number,
    required this.password,
    required this.company_address,
    required this.uId,
  });

      ComModel.fromJason(Map<String, dynamic> json)
      {

        name = json['name'];
        name = json['email'];
        number = json['number'];
        company_address = json['company_address'];
        password = json['password'];
        uId = json['uId'];
      }

      Map<String, dynamic> toMap()
      {
        return{
          'name':name,
          'name':email,
          'number':number,
          'company_address':company_address,
          'password':password,
          'uId':uId,
        };
      }
}