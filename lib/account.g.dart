// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['accountid'] as String,
      json['accountname'] as String,
      json['tslid'] as String,
      json['atlid'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountid': instance.accountid,
      'accountname': instance.accountname,
      'tslid': instance.tslid,
      'atlid': instance.atlid,
    };
