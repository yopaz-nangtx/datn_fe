class User {
  int? id;
  String? username;
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  String? phone;
  String? location;
  String? about;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.name,
      this.email,
      this.phoneNumber,
      this.role,
      this.phone,
      this.location,
      this.about,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    phone = json['phone'];
    location = json['location'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
