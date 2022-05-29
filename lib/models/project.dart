import 'package:ceminddataload/util/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

const projectIdx = 0;
const oppIdx = 1;
const accountIdx = 2;
const notesIdx = 3;
const stageIdx = 4;
const startDateIdx = 5;
const endDateIdx = 6;
const leaderIdIdx = 7;

@JsonSerializable()
class Project {
  final String projectid;
  final String projectname;
  final String notes;
  final String stage;
  final String accountid;
  final String opportunityid;
  final DateTime startdate;
  final DateTime enddate;
  final String leaderid;

  Project(
    this.projectid,
    this.projectname,
    this.opportunityid,
    this.accountid,
    this.notes,
    this.stage,
    this.startdate,
    this.enddate,
    this.leaderid,
  );

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  factory Project.fromJsonDataCells(List<dynamic> dataCells) {
    final String projectid = dataCells[projectIdx][value];
    final String projectname = dataCells[projectIdx][label];
    final String notes = dataCells[notesIdx][label];
    final String stage = dataCells[stageIdx][label];
    final String accountid = dataCells[accountIdx][value];
    final String opportunityid = dataCells[oppIdx][value];
    final String leaderid = dataCells[leaderIdIdx][value];
    final DateTime startdate = DateTime.parse(dataCells[startDateIdx][value]);
    final DateTime enddate = DateTime.parse(dataCells[endDateIdx][value]);

    return Project(
      projectid,
      projectname,
      opportunityid,
      accountid,
      notes,
      stage,
      startdate,
      enddate,
      leaderid,
    );
  }
}
