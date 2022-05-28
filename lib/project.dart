import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

const projectIdIdx = 0;
const projectNameIdx = 1;
const notesIdx = 2;
const stageIdx = 3;
const accountIdIdx = 4;
const accountNameIdx = 5;
const startDateIdx = 6;
const endDateIdx = 7;
const leaderIdIdx = 8;

@JsonSerializable()
class Project {
  final String projectid;
  final String projectname;
  final String notes;
  final String stage;
  final String accountid;
  final DateTime startdate;
  final DateTime enddate;
  final String leaderid;

  Project(
    this.projectid,
    this.projectname,
    this.notes,
    this.stage,
    this.accountid,
    this.startdate,
    this.enddate,
    this.leaderid,
  );

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  factory Project.fromJsonDataCells(List<dynamic> dataCells) {
    const label = "label";
    const value = "value";

    final String projectid = dataCells[projectIdIdx][label];
    final String projectname = dataCells[projectNameIdx][label];
    final String notes = dataCells[notesIdx][label];
    final String stage = dataCells[stageIdx][label];
    final String accountid = dataCells[accountIdIdx][label];
    final String leaderid = dataCells[leaderIdIdx][value];
    final DateTime startdate = DateTime.parse(dataCells[startDateIdx][value]);
    final DateTime enddate = DateTime.parse(dataCells[endDateIdx][value]);

    return Project(
      projectid,
      projectname,
      notes,
      stage,
      accountid,
      startdate,
      enddate,
      leaderid,
    );
  }
}
