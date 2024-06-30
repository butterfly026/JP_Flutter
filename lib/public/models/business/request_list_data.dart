class RequestListData {
  RequestListData({
    this.request_user_address = '',
    this.worktime = '',
    this.request_content = "",
    this.request_user_gender = '',
    this.status = '',
  });

  String request_user_address;
  String worktime;
  String request_content;
  String request_user_gender;
  String status;

  dynamic toJson() {
    return {
      'request_user_address': request_user_address,
      'worktime': worktime,
      'request_content': request_content,
      'request_user_gender': request_user_gender,
      'status': status,
    };
  }

  static RequestListData fromJson(Map<String, dynamic> data) {
    RequestListData ret = RequestListData();
    ret.request_user_address = data['request_user_address'] ?? '';
    ret.worktime = data['worktime'] ?? '';
    ret.request_content = data['request_content'] ?? '';
    ret.request_user_gender = data['request_user_gender'] ?? '';
    ret.status = data['status'] ?? '';
    return ret;
  }

  static List<RequestListData> requestList = <RequestListData>[
    RequestListData(
      request_user_address: 'テスト',
      worktime: '1',
      request_content: 'テスト',
      request_user_gender: '男性',
      status: '依頼確定',
    ),
    RequestListData(
      request_user_address: 'テスト',
      worktime: '1',
      request_content: 'テスト',
      request_user_gender: '男性',
      status: '募集中',
    ),
    RequestListData(
      request_user_address: 'テスト',
      worktime: '1',
      request_content: 'テスト',
      request_user_gender: '男性',
      status: '依頼拒否',
    ),
    RequestListData(
      request_user_address: 'テスト',
      worktime: '1',
      request_content: 'テスト',
      request_user_gender: '男性',
      status: '依頼拒否',
    ),
  ];
}
