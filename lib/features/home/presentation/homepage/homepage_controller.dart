import 'package:assessment_firman/features/home/model/home_transaction_history_request_model.dart';
import 'package:assessment_firman/features/home/model/home_transaction_history_response_model.dart';
import 'package:get/get.dart';
import 'homepage_state.dart';
import '../../repository/home_transaction_history_repository.dart';
import '../../../../components/util/state.dart';
import '../../../detail_team/detail_team_route.dart';

class HomePageController extends GetxController {
  final HomePageRepository _repository;
  HomePageController(this._repository);
  List<Teams> list = [];
  HomePageState state = HomePageIdle();

  @override
  void onInit() {
    _getCountHomeData();
    super.onInit();
  }

  void onRefresh() {
    _getCountHomeData();
    update();
  }

  _getCountHomeData() async {
    state = HomePageLoading();
    _repository.getListNewTransaction(
      req: HomeTransactionHistoryRequestModel(l: 'English Premier League'),
      response: ResponseHandler(
          onSuccess: (data) {
            list = data;
            state = HomePageLoadSuccess();
            update();
          },
          onFailed: (e, text) {
            state = HomePageError();
          },
          onDone: () => update()),
    );
  }

  void toDetailProduct(element) {
    Get.toNamed(
      DetailTeamRoute.detailTeamScreen,
      arguments: element,
    );
  }
}
