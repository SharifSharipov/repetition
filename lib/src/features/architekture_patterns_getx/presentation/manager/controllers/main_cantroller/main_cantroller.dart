import 'package:get/get.dart';
import 'package:repetition/src/features/architekture_patterns_getx/data/models/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_getx/domain/network/network.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var items = <PostModel>[].obs;

  void apiPostList() async {
    try {
      isLoading.value = true;
      var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
      isLoading.value = false;
      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
    } catch (e) {
      isLoading.value = false;
      items.value = [];
      print("Error fetching post list: $e");
    }
  }

  void apiPostDelete(PostModel post) async {
    try {
      isLoading.value = true;
      var response = await Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
      isLoading.value = false;
      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
    } catch (e) {
      isLoading.value = false;
      items.value = [];
      print("Error deleting post: $e");
    }
  }

  void apiPostUpdate(PostModel post) async {
    try {
      isLoading.value = true;
      var response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsEmpty());
      isLoading.value = false;
      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
    } catch (e) {
      isLoading.value = false;
      items.value = [];
      print("Error updating post: $e");
    }
  }
}
