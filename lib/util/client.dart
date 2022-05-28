import 'package:dart_appwrite/dart_appwrite.dart';

const endpoint = "http://localhost/v1";
const projectId = "cemind";
const key =
    "c88e110b8a91cad4795711b27fc29d1ce6992be14351ff3de6e2926b6eb626fabb90af8edab252c02df1f123f804e2b488daba30d996c9a775f667e579e2841e192dc453a6497e878c38c4f0e133846a9c4e4dcd2f6dfde4a3d62c16243c0ce07b8c7d634a48633262d58d60564b97c1db9799eadfb143917841a83bf42ba213";

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
