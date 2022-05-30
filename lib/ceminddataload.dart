import 'dart:convert';

import 'package:ceminddataload/models/account.dart' as cea;
import 'package:ceminddataload/models/assignment.dart';
import 'package:ceminddataload/models/opportunity.dart';
import 'package:ceminddataload/models/talent.dart';
import 'package:ceminddataload/models/project.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:uuid/uuid.dart';

import 'util/client.dart';
import 'util/constants.dart';

final uuid = Uuid();

Future<void> process({
  String projectFilePath = "",
  String assignmentFilePath = "",
}) async {
  print('Running Upload File');

  if (projectFilePath.isNotEmpty) {
    var fileId = await uploadFile(
      path: projectFilePath,
    );

    await processProjectsFile(
      fileId: fileId,
    );
  }

  if (assignmentFilePath.isNotEmpty) {
    var fileId = await uploadFile(
      path: assignmentFilePath,
    );

    await processAssignmentsFile(
      fileId: fileId,
    );
  }
}

Future<void> processProjectsFile({
  required String fileId,
}) async {
  final fileContents =
      await Appwrite.storage.getFileView(bucketId: bucketId, fileId: fileId);
  final jsonString = String.fromCharCodes(fileContents);
  final json = jsonDecode(jsonString);
  final List<dynamic> rows = json["rows"];

  for (Map<String, dynamic> r in rows) {
    Project p = Project.fromJsonDataCells(r["dataCells"]);
    await processEntity(p.projectid, p.toJson(), projectsCollectionId);

    Opportunity o = Opportunity.fromJsonDataCells(r["dataCells"]);
    await processEntity(o.opportunityid, o.toJson(), opportunityCollectionId);

    Talent t = Talent.fromJsonDataCells(r["dataCells"]);
    await processEntity(t.talentid, t.toJson(), talentCollectionId);

    cea.Account a = cea.Account.fromJsonDataCells(r["dataCells"]);
    await processEntity(a.accountid, a.toJson(), accountsCollectionId);
  }
}

Future<void> processAssignmentsFile({
  required String fileId,
}) async {
  final fileContents =
      await Appwrite.storage.getFileView(bucketId: bucketId, fileId: fileId);
  final jsonString = String.fromCharCodes(fileContents);
  final json = jsonDecode(jsonString);
  final List<dynamic> rows = json["rows"];

  for (Map<String, dynamic> r in rows) {
    Assignment a = Assignment.fromJsonDataCells(r["dataCells"]);
    await processEntity(a.assignmentid, a.toJson(), assignmentsCollectionId);
  }
}

Future<void> processEntity(
  String entityId,
  Map<String, dynamic> entity,
  String collectionId,
) async {
  try {
    await Appwrite.database.createDocument(
      collectionId: collectionId,
      documentId: entityId,
      data: entity,
    );
  } on AppwriteException catch (e) {
    if (e.code == 409) {
      print("duplicate $collectionId");
    } else {
      rethrow;
    }
  } on Exception {
    rethrow;
  }
}

Future<String> uploadFile({
  required String path,
}) async {
  final projectFile =
      InputFile(path: path, filename: 'project-${uuid.v1()}.json');

  try {
    final response = await Appwrite.storage.createFile(
      bucketId: bucketId,
      fileId: 'unique()',
      file: projectFile,
      read: ['role:all'],
      write: ['role:all'],
    );
    // ignore: unused_local_variable
    var fileId = response.$id;
    print("File uploaded: ${response.toMap()}");
    return fileId;
  } on AppwriteException catch (e) {
    print(e.message);
    rethrow;
  }
}
