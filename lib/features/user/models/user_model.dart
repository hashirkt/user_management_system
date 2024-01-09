class UserModel{
  final String? id;
  final String? name;
  final String? email;
  final DateTime? createdAt;
  final int? status;

  UserModel({this.name, this.id,this.email, this.createdAt,this.status});

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(name: json['name'], id: json['id'], email: json['email'], createdAt: json['createdAt'], status: json['status']);
  }

  toMap(UserModel user){
    return {
      'id':user.id,
      'name':user.name,
      'email':user.email,
      'createdAt':user.createdAt,
      'status':user.status,
    };
  }
}