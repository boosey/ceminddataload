import 'package:dart_appwrite/dart_appwrite.dart';

import 'util/client.dart';
import 'util/constants.dart';

class BucketsAndCollections {
  static Future<void> bucketsAndCollections() async {
    await storageBucket();
    await accountsCollection();
    await projectCollection();
    await assignmentsCollection();
    await talentCollection();
    await opportunityCollection();
  }

  static String idx(String key) {
    return "${key}Idx";
  }

  static Future<void> assignmentsCollection() async {
    try {
      await Appwrite.database
          .getCollection(collectionId: assignmentsCollectionId);
    } on AppwriteException catch (e) {
      print(e.toString());
      await Appwrite.database.createCollection(
        collectionId: assignmentsCollectionId,
        name: assignmentsCollectionId,
        permission: 'collection',
        read: ['role:all'],
        write: ['role:all'],
      );
    } on Exception {
      rethrow;
    }
  }

  static Future<void> projectCollection() async {
    try {
      await Appwrite.database.getCollection(collectionId: projectsCollectionId);
    } on AppwriteException catch (e) {
      print(e.toString());
      await Appwrite.database.createCollection(
        collectionId: projectsCollectionId,
        name: projectsCollectionId,
        permission: 'collection',
        read: ['role:all'],
        write: ['role:all'],
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectIdKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectNameKey,
        size: 1024,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectNotesKey,
        size: 5000,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectStageKey,
        size: 64,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: accountIdKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: opportunityIdKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectStartDateKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectEndDateKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: projectsCollectionId,
        key: projectLeaderKey,
        size: 254,
        xrequired: true,
      );
    } on Exception {
      rethrow;
    }
  }

  static Future<void> accountsCollection() async {
    try {
      await Appwrite.database.getCollection(collectionId: accountsCollectionId);
    } on AppwriteException catch (e) {
      print(e.toString());
      await Appwrite.database.createCollection(
        collectionId: accountsCollectionId,
        name: accountsCollectionId,
        permission: 'collection',
        read: ['role:all'],
        write: ['role:all'],
      );

      await Appwrite.database.createStringAttribute(
        collectionId: accountsCollectionId,
        key: accountIdKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: accountsCollectionId,
        key: accountNameKey,
        size: 1024,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: accountsCollectionId,
        key: accountTSLKey,
        size: 254,
        xrequired: false,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: accountsCollectionId,
        key: accountATLKey,
        size: 254,
        xrequired: false,
      );

      await Future.delayed(Duration(seconds: 1));

      // await Appwrite.database.createIndex(
      //   collectionId: accountsCollectionId,
      //   key: idx(accountIdKey),
      //   type: keyIndexType,
      //   attributes: [accountIdKey],
      //   orders: [asc],
      // );

      // await Appwrite.database.createIndex(
      //   collectionId: accountsCollectionId,
      //   key: idx(accountNameKey),
      //   type: uniqueIndexType,
      //   attributes: [accountNameKey],
      //   orders: [asc],
      // );

      // await Appwrite.database.createIndex(
      //   collectionId: accountsCollectionId,
      //   key: idx(accountTSLKey),
      //   type: uniqueIndexType,
      //   attributes: [accountTSLKey],
      //   orders: [asc],
      // );

      // await Appwrite.database.createIndex(
      //   collectionId: accountsCollectionId,
      //   key: idx(accountATLKey),
      //   type: uniqueIndexType,
      //   attributes: [accountATLKey],
      //   orders: [asc],
      // );
    }
  }

  static Future<void> talentCollection() async {
    try {
      await Appwrite.database.getCollection(collectionId: talentCollectionId);
    } on AppwriteException catch (e) {
      print(e.toString());
      await Appwrite.database.createCollection(
        collectionId: talentCollectionId,
        name: talentCollectionId,
        permission: 'collection',
        read: ['role:all'],
        write: ['role:all'],
      );

      await Appwrite.database.createStringAttribute(
        collectionId: talentCollectionId,
        key: talentIdKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: talentCollectionId,
        key: talentNameKey,
        size: 1024,
        xrequired: true,
      );
    }
  }

  static Future<void> opportunityCollection() async {
    try {
      await Appwrite.database
          .getCollection(collectionId: opportunityCollectionId);
    } on AppwriteException catch (e) {
      print(e.toString());
      await Appwrite.database.createCollection(
        collectionId: opportunityCollectionId,
        name: opportunityCollectionId,
        permission: 'collection',
        read: ['role:all'],
        write: ['role:all'],
      );

      await Appwrite.database.createStringAttribute(
        collectionId: opportunityCollectionId,
        key: opportunityIdKey,
        size: 254,
        xrequired: true,
      );

      await Appwrite.database.createStringAttribute(
        collectionId: opportunityCollectionId,
        key: opportunityNameKey,
        size: 1024,
        xrequired: true,
      );
    }
  }

  static Future<void> storageBucket() async {
    try {
      await Appwrite.storage.getBucket(bucketId: bucketId);
    } on AppwriteException catch (e) {
      print(e.toString());
      await Appwrite.storage.createBucket(
        bucketId: bucketId,
        name: bucketId,
        permission: "bucket",
      );
    } on Exception {
      rethrow;
    }
  }
}
