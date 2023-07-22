import 'package:get/get.dart';
import 'package:my_anime/constants.dart';
import '../models/anime_model.dart';
import '../api/dio_services.dart';

class AnimeListController extends GetxController {
  final APIService apiService = APIService();
  RxList<AnimeModel> animeList = <AnimeModel>[].obs;
  RxList<AnimeModel> movieList = <AnimeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAnimeList();
    fetchMovieList();
  }

  Future<void> fetchAnimeList() async {
    try {
      final List<AnimeModel> list =
          await apiService.fetchTopAnime(kTopAnimeEndpoint);
      animeList.value = list;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch top animes data: $e');
    }
  }

  Future<void> fetchMovieList() async {
    try {
      final List<AnimeModel> list =
          await apiService.fetchTopAnime(kTopMovieEndpoint);
      movieList.value = list;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch top movies data: $e');
    }
  }
}
