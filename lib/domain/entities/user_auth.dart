import 'package:dexef_task/data/models/user_auth_model.dart';
import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final String? ip, database, userName, lang, password;

  const UserAuth(
      {this.ip, this.database, this.userName, this.lang='ar', this.password});

  @override
  List<Object?> get props => [
        ip,
        database,
        userName,
        lang,
        password,
      ];

  /// Convert UserAuth Entity to UserAuth Model
  UserAuthModel toModel()=> UserAuthModel(userAuth: this);
}
