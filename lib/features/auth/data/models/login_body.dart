class LoginBody {
  bool? guest;
  String? username;
  String? password;
  bool? rememberMe;

  LoginBody({this.guest, this.username, this.password, this.rememberMe});

  LoginBody.fromJson(Map<String, dynamic> json) {
    guest = json['guest'];
    username = json['username'];
    password = json['password'];
    rememberMe = json['remember_me'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guest'] = guest;
    data['username'] = username;
    data['password'] = password;
    data['remember_me'] = rememberMe;
    return data;
  }
}