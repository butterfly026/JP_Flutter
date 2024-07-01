class CardInfo {
  CardInfo({
    this.regDate = '',
    this.content = '',
    this.price = '',
  });

  String regDate;
  String content;
  String price;

  dynamic toJson() {
    return {
      'regDate': regDate,
      'content': content,
      'price': price,
    };
  }

  static CardInfo fromJson(Map<String, dynamic> data) {
    CardInfo ret = CardInfo();
    ret.regDate = data['regDate'] ?? '';
    ret.content = data['content'] ?? '';
    ret.price = data['price'] ?? '';
    return ret;
  }

  static List<CardInfo> cards = <CardInfo>[
    CardInfo(
      regDate: '2024年6月24日',
      content: '犬の散歩',
      price: '100',
    ),
    CardInfo(
      regDate: '2024年6月24日',
      content: '犬の散歩',
      price: '101',
    ),
    CardInfo(
      regDate: '2024年6月24日',
      content: '犬の散歩',
      price: '102',
    ),
    CardInfo(
      regDate: '2024年6月24日',
      content: '犬の散歩',
      price: '103',
    ),
  ];
}
