import 'package:get/get.dart';
import 'package:my_anime/constants.dart';
import '../api/dio_services.dart';
import '../models/manga_model.dart';

class MangaController extends GetxController {
  final APIService apiService = APIService();
  RxList<MangaModel> mangaList = <MangaModel>[].obs;
  bool isMangaListFetched = false;

  @override
  void onInit() {
    super.onInit();
    if (!isMangaListFetched) {
      fetchMangaList();
    }
  }

  Future<void> fetchMangaList() async {
    try {
      final List<MangaModel> list =
          await apiService.fetchTopManga(kTopMovieEndpoint);
      mangaList.value = list;
      isMangaListFetched = true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch top manga data: $e');
    }
  }
}
