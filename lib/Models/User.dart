class User {
  String fullName;
  String email;
  String phoneNumber;
  String password;

  User({this.fullName, this.email,this.phoneNumber, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password']
    );
  } 
}