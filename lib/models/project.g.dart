// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      json['projectid'] as String,
      json['projectname'] as String,
      json['oppId'] as String,
      json['accountid'] as String,
      json['notes'] as String,
      json['stage'] as String,
      DateTime.parse(json['startdate'] as String),
      DateTime.parse(json['enddate'] as String),
      json['leaderid'] as String,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'projectid': instance.projectid,
      'projectname': instance.projectname,
      'notes': instance.notes,
      'stage': instance.stage,
      'accountid': instance.accountid,
      'oppId': instance.oppId,
      'startdate': instance.startdate.toIso8601String(),
      'enddate': instance.enddate.toIso8601String(),
      'leaderid': instance.leaderid,
    };
