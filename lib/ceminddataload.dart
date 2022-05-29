import 'dart:convert';

import 'package:ceminddataload/models/account.dart' as cea;
import 'package:ceminddataload/models/opportunity.dart';
import 'package:ceminddataload/models/talent.dart';
import 'package:ceminddataload/models/project.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:uuid/uuid.dart';

import 'util/client.dart';
import 'util/constants.dart';

final uuid = Uuid();

Future<void> process({
  required String bucketId,
  String projectFilePath = "",
  String assignmentFilePath = "",
}) async {
  print('Running Upload File');

  if (projectFilePath.isNotEmpty) {
    var fileId = await uploadFile(path: projectFilePath, bucket: bucketId);

    await processProjectsFileForProjects(
      fileId: fileId,
      bucket: bucketId,
    );

    await processProjectsFileForAccounts(
      fileId: fileId,
      bucket: bucketId,
    );

    await processProjectsFileForTalent(
      fileId: fileId,
      bucket: bucketId,
    );

    await processProjectsFileForOpportunities(
      fileId: fileId,
      bucket: bucketId,
    );
  }

  if (assignmentFilePath.isNotEmpty) {
    var fileId = await uploadFile(path: assignmentFilePath, bucket: bucketId);
    await processAssignmentsFile(
      fileId: fileId,
      bucket: bucketId,
    );
  }
}

// Future<void> processProjectsFileFor(
//   String entityName, {
//   required String fileId,
//   required String bucket,
//   required String collectionId,
//   required Map<String, dynamic> Function(Map<String, dynamic>) createEntityJson,
//   required String idKey,
// }) async {
//   final fileContents =
//       await Appwrite.storage.getFileView(bucketId: bucket, fileId: fileId);
//   final jsonString = String.fromCharCodes(fileContents);
//   final json = jsonDecode(jsonString);
//   final List<dynamic> rows = json["rows"];

//   for (Map<String, dynamic> p in rows) {
//     var entityJson = createEntityJson(p["dataCells"]);

//     try {
//       await Appwrite.database.createDocument(
//         collectionId: collectionId,
//         documentId: entityId(idKey, entityJson),
//         data: entityJson,
//       );
//     } on AppwriteException catch (e) {
//       if (e.code == 409) {
//         print("duplicate $entityName");
//       } else {
//         rethrow;
//       }
//     } on Exception {
//       rethrow;
//     }
//   }
// }

String entityId(idKey, Map<String, dynamic> json) {
  return json[idKey];
}

// Future<void> processProjectsFileForProjects2({
//   required String fileId,
//   required String bucket,
// }) async {
//   processProjectsFileFor(
//     "Projects",
//     fileId: fileId,
//     bucket: bucket,
//     collectionId: projectsCollectionId,
//     createEntityJson: (p) => Project.fromJsonDataCells(p).toJson(),
//     idKey: projectIdKey,
//   );
// }

Future<void> processProjectsFileForOpportunities({
  required String fileId,
  required String bucket,
}) async {
  final fileContents =
      await Appwrite.storage.getFileView(bucketId: bucket, fileId: fileId);
  final jsonString = String.fromCharCodes(fileContents);
  final json = jsonDecode(jsonString);
  final List<dynamic> rows = json["rows"];

  for (Map<String, dynamic> p in rows) {
    Opportunity opportunity = Opportunity.fromJsonDataCells(p["dataCells"]);

    try {
      var o = opportunity.toJson();

      await Appwrite.database.createDocument(
        collectionId: opportunityCollectionId,
        documentId: opportunity.opportunityid,
        data: o,
      );
    } on AppwriteException catch (e) {
      if (e.code == 409) {
        print("duplicate opportunity");
      } else {
        rethrow;
      }
    } on Exception {
      rethrow;
    }
  }
}

Future<void> processProjectsFileForTalent({
  required String fileId,
  required String bucket,
}) async {
  final fileContents =
      await Appwrite.storage.getFileView(bucketId: bucket, fileId: fileId);
  final jsonString = String.fromCharCodes(fileContents);
  final json = jsonDecode(jsonString);
  final List<dynamic> rows = json["rows"];

  for (Map<String, dynamic> p in rows) {
    Talent talent = Talent.fromJsonDataCells(p["dataCells"]);

    try {
      var t = talent.toJson();

      await Appwrite.database.createDocument(
        collectionId: talentCollectionId,
        documentId: talent.talentid,
        data: t,
      );
    } on AppwriteException catch (e) {
      if (e.code == 409) {
        print("duplicate talent");
      } else {
        rethrow;
      }
    } on Exception {
      rethrow;
    }
  }
}

Future<void> processProjectsFileForProjects({
  required String fileId,
  required String bucket,
}) async {
  final fileContents =
      await Appwrite.storage.getFileView(bucketId: bucket, fileId: fileId);
  final jsonString = String.fromCharCodes(fileContents);
  final json = jsonDecode(jsonString);
  final List<dynamic> rows = json["rows"];

  for (Map<String, dynamic> p in rows) {
    Project project = Project.fromJsonDataCells(p["dataCells"]);

    print("key: ${entityId("projectid", project.toJson())}");

    try {
      await Appwrite.database.createDocument(
        collectionId: projectsCollectionId,
        documentId: project.projectid,
        data: project.toJson(),
      );
    } on AppwriteException catch (e) {
      if (e.code == 409) {
        print("duplicate project");
      } else {
        rethrow;
      }
    } on Exception {
      rethrow;
    }
  }
}

Future<void> processProjectsFileForAccounts({
  required String fileId,
  required String bucket,
}) async {
  final fileContents =
      await Appwrite.storage.getFileView(bucketId: bucket, fileId: fileId);
  final jsonString = String.fromCharCodes(fileContents);
  final json = jsonDecode(jsonString);
  final List<dynamic> rows = json["rows"];

  for (Map<String, dynamic> p in rows) {
    cea.Account account = cea.Account.fromJsonDataCells(p["dataCells"]);

    try {
      var a = account.toJson();

      await Appwrite.database.createDocument(
        collectionId: accountsCollectionId,
        documentId: account.accountid,
        data: a,
      );
    } on AppwriteException catch (e) {
      if (e.code == 409) {
        print("duplicate account");
      } else {
        rethrow;
      }
    } on Exception {
      rethrow;
    }
  }
}

Future<void> processAssignmentsFile({
  required String fileId,
  required String bucket,
}) async {}

Future<String> uploadFile({
  required String bucket,
  required String path,
}) async {
  final projectFile =
      InputFile(path: path, filename: 'project-${uuid.v1()}.json');

  try {
    final response = await Appwrite.storage.createFile(
      bucketId: bucket,
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
