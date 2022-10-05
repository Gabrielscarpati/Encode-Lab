
/*
class YoutubeController extends GetxController {

  var items = <Items> [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var videoTemporary = await DaoYoutube.fetchVideos();
      if (videoTemporary != null) {
        items(videoTemporary);
      }

    } finally {
      isLoading(false);
    }
  }
}

*/

/*


class SnippetController extends GetxController {

  var snippet = <Snippet> [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchSnippet();
    super.onInit();
  }

  Future<List<Snippet>> fetchSnippet() async {
      isLoading = true.obs;


      List<Snippet> videoTemporary = await DaoYoutube.fetchVideos();
      isLoading = false.obs;

      return videoTemporary;
  }
}
*/
