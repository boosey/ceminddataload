import 'package:dart_appwrite/dart_appwrite.dart';

const endpoint = "http://localhost/v1";
const projectId = "cemind";
const key =
    "831f2b4cc33afff73f18f26c5e3a8b2ccdfd266572192a085bd8ab733ec1324cfe2292134c440f6ee9d0d7e1be8396eebf68957cce6127a844d6e700fb368918a6f13b3dd85b320947e53773901a122269dee76047a8f229572151d98632bb7745817923d8054fa06b470e944f557ee4df83dab6e8bbe85aa5c371402c640794";

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
