import '../../../../components/base/base_repository.dart';
import '../../../../components/util/state.dart';
import 'home_transaction_history_datasource.dart';
import '../model/home_transaction_history_response_model.dart';
import '../model/home_transaction_history_request_model.dart';

class HomePageRepository extends BaseRepository {
  final HomePageDataSource _dataSource;
  HomePageRepository(this._dataSource);

  void getListNewTransaction({
    required ResponseHandler<List<Teams>> response,
    required HomeTransactionHistoryRequestModel req,
  }) async {
    try {
      final data =
          await _dataSource.apiGetListHistory(req: req).then(mapToData).then(
        (value) {
          final response = HomeTransactionHistoryResponseModel.fromJson(value);
          List<Teams> list = [];
          if (response.teams != null) {
            for (var e in response.teams!) {
              list.add(e);
            }
          }
          return list;
        },
      );
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
