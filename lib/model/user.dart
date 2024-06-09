class User {
  int? id;
  String? username;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  int? role;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.name,
      this.email,
      this.phoneNumber,
      this.address,
      this.role,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    role = json['role'];
    imageUrl = json['image_url'];
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
    data['address'] = this.address;
    data['role'] = this.role;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
