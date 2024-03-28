import 'package:flutter/foundation.dart';
import 'package:repetition/src/features/architecture_patterns_provider/domain/network/network.dart';

import '../../../data/models/post_model/post_mopel.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<PostModel> postList = [];
  notifyListeners();
  Future<void> apiPostList() async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    isLoading = false;
    if (response != null) {
      postList = Network.parsePostList(response);
    } else {
      postList = [];
    }
    notifyListeners();
  }

  Future<bool> apiPostDelete(PostModel post) async {
    isLoading = true;
    notifyListeners();
    var response =
        await Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;
    notifyListeners();
    return response != null;
  }

  Future<bool>  apiPostUpdate(PostModel post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsEmpty());
      isLoading = false;
      notifyListeners();
     return response != null;
  }
}
