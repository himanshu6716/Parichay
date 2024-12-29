class userModel {
  String? message;
  User? user;

  userModel({this.message, this.user});

  userModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  String? password;
  String? phoneNumber;
  String? title;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? profession;
  String? education;
  String? caste;
  int? age;
  String? height;
  String? income;
  String? photographs;
  String? connections;
  String? pendingRequests;
  String? receivedRequests;
  bool? isDeleted;
  String? type;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.email,
        this.password,
        this.phoneNumber,
        this.title,
        this.fullName,
        this.gender,
        this.dateOfBirth,
        this.address,
        this.profession,
        this.education,
        this.caste,
        this.age,
        this.height,
        this.income,
        this.photographs,
        this.connections,
        this.pendingRequests,
        this.receivedRequests,
        this.isDeleted,
        this.type,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    title = json['title'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    profession = json['profession'];
    education = json['education'];
    caste = json['caste'];
    age = json['age'];
    height = json['height'];
    income = json['income'];
    photographs = json['photographs'];
    connections = json['connections'];
    pendingRequests = json['pendingRequests'];
    receivedRequests = json['receivedRequests'];
    isDeleted = json['isDeleted'];
    type = json['type'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['title'] = this.title;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['profession'] = this.profession;
    data['education'] = this.education;
    data['caste'] = this.caste;
    data['age'] = this.age;
    data['height'] = this.height;
    data['income'] = this.income;
    data['photographs'] = this.photographs;
    data['connections'] = this.connections;
    data['pendingRequests'] = this.pendingRequests;
    data['receivedRequests'] = this.receivedRequests;
    data['isDeleted'] = this.isDeleted;
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
