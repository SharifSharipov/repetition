import 'package:get/get.dart';
import 'package:repetition/src/features/architekture_patterns_getx/data/models/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_getx/domain/network/network.dart';

class HomeControllers extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    isLoading.value = false;
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
  }

  void apiPostDelete(PostModel post) async {
    isLoading.value = true;
    var response =
        await Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading.value = false;
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
  }

  void apiPostUpdate(PostModel post) async {
    isLoading.value = true;
    var response =
        await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsEmpty());
    isLoading.value = false;
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
  }
}
