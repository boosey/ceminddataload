import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

const accountIdIdxProject = 4;
const accountNameIdxProject = 5;

@JsonSerializable()
class Account {
  final String accountid;
  final String accountname;
  final String tslid;
  final String atlid;

  Account(this.accountid, this.accountname, this.tslid, this.atlid);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  factory Account.fromJsonDataCells(List<dynamic> dataCells) {
    const label = "label";
    // ignore: unused_local_variable
    const value = "value";

    final String accountid = dataCells[accountIdIdxProject][label];
    final String accountname = dataCells[accountNameIdxProject][label];

    return Account(
      accountid,
      accountname,
      "",
      "",
    );
  }
}
