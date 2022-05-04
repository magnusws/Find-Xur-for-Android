import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager extends BaseCacheManager {
  static const key = "customCache";

  static CustomCacheManager _instance;

  factory CustomCacheManager() {
    if (_instance == null) {
      _instance = new CustomCacheManager._();
    }
    return _instance;
  }

  CustomCacheManager._() : super(key,
      maxAgeCacheObject: Duration(days: 4),
      maxNrOfCacheObjects: 5);

  Future<String> getFilePath() async {
    var p;
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }
}