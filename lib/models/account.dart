import 'package:ceminddataload/util/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

const accountIdxProject = 2;

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
    final String accountid = dataCells[accountIdxProject][value];
    final String accountname = dataCells[accountIdxProject][label];

    return Account(
      accountid,
      accountname,
      "",
      "",
    );
  }
}
