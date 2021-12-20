
class UserModel{
  late String username;
  late String password;
  late int type;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    password = json['pasword'];
    type = json['type'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['username'] = this.username;
    data['pasword'] = this.password;
    data['type'] = this.type;
    return data;
  }
}