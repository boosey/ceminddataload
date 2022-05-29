import 'package:ceminddataload/util/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'talent.g.dart';

const leaderIdxProject = 7;

@JsonSerializable()
class Talent {
  final String talentid;
  final String talentname;

  Talent(this.talentid, this.talentname);

  Map<String, dynamic> toJson() => _$TalentToJson(this);

  factory Talent.fromJson(Map<String, dynamic> json) => _$TalentFromJson(json);

  factory Talent.fromJsonDataCells(List<dynamic> dataCells) {
    final String talentid = dataCells[leaderIdxProject][value];
    final String talentname = dataCells[leaderIdxProject][label];

    return Talent(
      talentid,
      talentname,
    );
  }
}
