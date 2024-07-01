class Notice {
  Notice({
    this.regDate = '',
    this.content = '',
    this.title = "",
  });

  String regDate;
  String content;
  String title;

  dynamic toJson() {
    return {
      'regDate': regDate,
      'content': content,
      'title': title,
    };
  }

  static Notice fromJson(Map<String, dynamic> data) {
    Notice ret = Notice();
    ret.regDate = data['regDate'] ?? '';
    ret.content = data['content'] ?? '';
    ret.title = data['title'] ?? '';
    return ret;
  }

  static List<Notice> notices = <Notice>[
    Notice(
      regDate: '2024年6月24日',
      content: 'あああああああああああああああああいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい',
      title: 'あああああああああああああああああ',
    ),
    Notice(
      regDate: '2024年6月28日',
      content: 'いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい',
      title: 'あああああああああああああああ22ああ',
    ),
  ];
}
