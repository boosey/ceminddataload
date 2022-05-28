import 'package:dart_appwrite/dart_appwrite.dart';

const endpoint = "http://localhost/v1";
const projectId = "cemind";
const key =
    "ce4f01f5cae412e2c41dc1e30b5a0fc180cf22c2296e1aa4d1d7cfc818ad4648a22dcdce46c9d84dea140aeb2ce02573b92080fdbc15d3d75a8755250916d8947328352b8da97221ce77847eadb5479def98ad0874e71f83a187f567b48adfb943b2fd5ea2f1e0f4600283ccc8efef73610bbc78a8606b4d7f250b60e911e18e";

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
