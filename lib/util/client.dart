import 'package:dart_appwrite/dart_appwrite.dart';

const endpoint = "http://localhost/v1";
const projectId = "cemind";
const key =
    "824343ab79999b5b3a73ca351933ff6f3600d6619be5b07c3d0c5d91361c1070be0036196c76fff6081ddc8ef470ee13ca4ed8de8caf759ad168b9fa3bb85dbe574a39ec966bb2cf9fa9c7f2447686b16cc38264fe618296f07ac5c3467cd21efd2bd2d28c124ed781f137f942cc67dc55a39a61e363b6e10008546c970ba13e";

class Appwrite {
  static Client? _client;
  static Storage? _storage;
  static Database? _database;

  static get client {
    _client ??= Client();

    _client!
        .setEndpoint(endpoint) // Make sure your endpoint is accessible
        .setProject(projectId) // Your project ID
        .setKey(key) // Your appwrite key
        // .setJWT('jwt') // Enable this to authenticate with JWT created using client SDK
        .setSelfSigned(status: true);

    return _client;
  }

  static get storage {
    return _storage ??= Storage(client);
  }

  static get database {
    return _database ??= Database(client);
  }
}
