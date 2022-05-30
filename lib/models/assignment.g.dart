// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assignment _$AssignmentFromJson(Map<String, dynamic> json) => Assignment(
      json['assignmentid'] as String,
      json['projectid'] as String,
      json['talentid'] as String,
      json['rolename'] as String,
      DateTime.parse(json['startdate'] as String),
      DateTime.parse(json['enddate'] as String),
    );

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'assignmentid': instance.assignmentid,
      'projectid': instance.projectid,
      'talentid': instance.talentid,
      'rolename': instance.rolename,
      'startdate': instance.startdate.toIso8601String(),
      'enddate': instance.enddate.toIso8601String(),
    };
