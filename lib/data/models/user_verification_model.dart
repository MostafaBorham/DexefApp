import 'package:dexef_task/domain/entities/user_verification.dart';

class UserVerificationModel extends UserVerification {
  const UserVerificationModel({
    super.serialNumber,
    super.userType,
    super.permission,
    super.password,
    super.privilegeID,
    super.branchID,
    super.showMyReportOnly,
  });

factory UserVerificationModel.fromJson(Map<String, dynamic> json) => UserVerificationModel(
  branchID: json['BranchID']?? -1,
  password: json['passward']?? '',
  permission: json['Permission']?? '',
  privilegeID: json['privilegeID']?? -1,
  serialNumber: json['serial_number']?? '',
  showMyReportOnly: json['ShowMyReportOnly']?? false,
  userType: json['usertype']?? '',
);
}
