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
