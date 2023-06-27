
import 'package:insta_demo/models/response_handler.dart';

import '../di/api_provider.dart';
import '../models/post.dart';
import '../ui/common/api_client.dart';

abstract class MainRepository {
  Future<List<Post>> getPostList();
}

class MainRepositoryImpl implements MainRepository {
  final BaseApiProvider provider;

  MainRepositoryImpl(this.provider);

  @override
  Future<List<Post>> getPostList() async {
    ResponseHandler responseHandler =
        await provider.getMethod(APIConstants.postList);

    return responseHandler.hasError
        ? []
        : (responseHandler.result as List)
            .map((e) => Post.fromJson(e))
            .toList();
  }
}
