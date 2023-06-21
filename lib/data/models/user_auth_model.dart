import 'package:dexef_task/domain/entities/user_auth.dart';

class UserAuthModel extends UserAuth {
  UserAuthModel({UserAuth? userAuth}) : super(
    ip: userAuth?.ip,
    database: userAuth?.database,
    userName: userAuth?.userName,
    lang: userAuth?.lang,
    password: userAuth?.password,
  );



  Map<String,dynamic> toJson()=>{
   "ip" : super.ip??'',
   "database" : super.database??'',
   "user_name" : super.userName??'',
   "lang" : 'ar',
   "passward" : super.password??'',
  };
}
