class UserModel {

String email;
String password;

UserModel({
      this.email,
      this.password,
  });

Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
