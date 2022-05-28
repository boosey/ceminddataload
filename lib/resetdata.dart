import 'package:dart_appwrite/models.dart';
import 'package:uuid/uuid.dart';

import 'util/client.dart';
import 'util/constants.dart';

final uuid = Uuid();

Future<void> deleteAll() async {
  await deleteCollection(projectsCollectionId);
  await deleteCollection(accountsCollectionId);
}

Future<void> deleteCollection(String collectionId) async {
  DocumentList docs = await Appwrite.database.listDocuments(
    collectionId: collectionId,
    limit: 100,
  );

  do {
    for (var doc in docs.documents) {
      await Appwrite.database.deleteDocument(
        collectionId: collectionId,
        documentId: doc.$id,
      );
    }

    docs = await Appwrite.database.listDocuments(
      collectionId: collectionId,
      limit: 100,
    );
  } while (docs.documents.isNotEmpty);
}
