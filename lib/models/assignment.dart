import 'package:ceminddataload/util/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assignment.g.dart';

const assignmentIdIdx = 0;
const projectIdIdx = 1;
const talentIdIdx = 2;
const roleNameIdx = 3;
const startDateIdx = 4;
const endtDateIdx = 5;

@JsonSerializable()
class Assignment {
  final String assignmentid;
  final String projectid;
  final String talentid;
  final String rolename;
  final DateTime startdate;
  final DateTime enddate;

  Assignment(
    this.assignmentid,
    this.projectid,
    this.talentid,
    this.rolename,
    this.startdate,
    this.enddate,
  );

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  factory Assignment.fromJsonDataCells(List<dynamic> dataCells) {
    final String assignmentid = dataCells[assignmentIdIdx][value];
    final String projectid = dataCells[projectIdIdx][value];
    final String talentid = dataCells[talentIdIdx][value];
    final String rolename = dataCells[roleNameIdx][value] ??= "";
    final DateTime startdate = DateTime.parse(dataCells[startDateIdx][value]);
    final DateTime enddate = DateTime.parse(dataCells[endtDateIdx][value]);

    return Assignment(
      assignmentid,
      projectid,
      talentid,
      rolename,
      startdate,
      enddate,
    );
  }
}
