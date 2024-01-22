class UserModel{
  final Map<String,dynamic> map; 
  const UserModel ({this.map = const {}});
  int? get  id => map["id"]; 
  String get  email => map["email"] as String? ?? ""; 
  String get  firstName => map["first_name"] as String? ?? ""; 
  String get  lastName => map["last_name"] as String? ?? ""; 
  String get  avatar => map["avatar"] as String? ?? ""; 
}

/*

            "id": 7,
            "email": "michael.lawson@reqres.in",
            "first_name": "Michael",
            "last_name": "Lawson",
            "avatar": "https://reqres.in/img/faces/7-image.jpg"
       
 */