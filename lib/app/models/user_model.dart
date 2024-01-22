class ResponseUser {
  Meta? meta;
  UserModel? data;

  ResponseUser({this.meta, this.data});

  ResponseUser.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  bool? success;
  String? message;
  Null? info;

  Meta({this.success, this.message, this.info});

  Meta.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['info'] = info;
    return data;
  }
}

class UserModel {
  String? uuid;
  String? fullname;
  String? phone;
  String? email;
  String? address;
  String? profile;
  String? createdAt;
  String? updatedAt;
  String? roles;
  String? token;
  bool? admin;

  UserModel(
      {this.uuid,
      this.fullname,
      this.phone,
      this.email,
      this.address,
      this.profile,
      this.createdAt,
      this.updatedAt,
      this.roles,
      this.token,
      this.admin});

  UserModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    profile = json['profile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roles = json['roles'];
    token = json['token'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['profile'] = profile;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['roles'] = roles;
    data['token'] = token;
    data['admin'] = admin;
    return data;
  }
}
