import 'package:food_application/feture/domain/entity/user.dart';

class UserModal extends UserEntity {
  UserModal({
    required String id,
    required String password,
    required String email,
    required String name,
  }) : super(email: email, id: id, name: name, password: password);
  // toMap function to send data firestore
  Map<String, dynamic> tomap() {
    return {"Id": id, "Name": name, "Email": email, "Password": password};
  }

  // receive data in cloud firestore
  factory UserModal.fromMap(Map<String, dynamic> tomap, String id) {
    return UserModal(
      id: id,
      password: tomap["Password"] ?? "",
      email: tomap["Email"] ?? "",
      name: tomap["Name"] ?? "",
    );
  }
}
