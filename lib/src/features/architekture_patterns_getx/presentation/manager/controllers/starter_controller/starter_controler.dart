import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:repetition/src/features/architekture_patterns_getx/data/models/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_getx/domain/network/network.dart';

class StarterController extends GetxController {
  var isLoading = false;
  var items = [];
  void apiList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
      update();
    } else {
      items = [];
    }
    isLoading = false;
  }

  void apiPostDelete(PostModel post) async {
    isLoading = true;
    update();
    var response =
        await Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      items = Network.parsePostList(response);
      update();
    }else{
      items = [];
    }
    isLoading = false;
    update();
  }
}
