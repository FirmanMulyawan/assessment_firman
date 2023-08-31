class HomeTransactionHistoryRequestModel {
  String? l;

  HomeTransactionHistoryRequestModel({this.l});

  HomeTransactionHistoryRequestModel.fromJson(Map<String, dynamic> json) {
    l = json['l'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['l'] = l;
    return data;
  }
}
