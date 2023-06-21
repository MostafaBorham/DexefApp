import 'package:equatable/equatable.dart';

class UserVerification extends Equatable {
  final String? serialNumber, userType, permission, password;
  final int? privilegeID, branchID;
  final bool? showMyReportOnly;

  const UserVerification(
      {this.serialNumber,
      this.userType,
      this.permission,
      this.password,
      this.privilegeID,
      this.branchID,
      this.showMyReportOnly});

  @override
  List<Object?> get props => [
        serialNumber,
        userType,
        permission,
        password,
        privilegeID,
        branchID,
        showMyReportOnly,
      ];

}
