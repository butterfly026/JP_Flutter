class IconModel {
  String? id;
  String? icon;
  String? name;
  String? url;
  String? category;
  String? levelType;
  String? sort;
  String? seriesId;
  String? subId8;
  String? tipFlag;
  String? openWay;
  String? hotIcon;
  String? gameCode;
  String? subtitle;
  String? isHot;
  String? title;
  int? gameId;

  IconModel(
      {this.id,
      this.category,
      this.gameCode,
      this.gameId,
      this.hotIcon,
      this.icon,
      this.isHot,
      this.levelType,
      this.name,
      this.openWay,
      this.seriesId,
      this.sort,
      this.subId8,
      this.subtitle,
      this.tipFlag,
      this.title,
      this.url});

  IconModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    category = json["category"];
    gameCode = json["gameCode"];
    gameId = json["gameId"];
    hotIcon = json["hotIcon"];
    icon = json["icon"];
    isHot = json["is_hot"];
    levelType = json["levelType"];
    name = json["name"];
    openWay = json["openWay"];
    seriesId = json["seriesId"];
    sort = json["sort"];
    subId8 = json["subId8"];
    subtitle = json["subtitle"];
    tipFlag = json["tipFlag"];
    title = json["title"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "category": category,
      "gameCode": gameCode,
      "gameId": gameId,
      "hotIcon": hotIcon,
      "icon": icon,
      "is_hot": isHot,
      "levelType": levelType,
      "name": name,
      "openWay": openWay,
      "seriesId": seriesId,
      "sort": sort,
      "subId8": subId8,
      "subtitle": subtitle,
      "tipFlag": tipFlag,
      "title": title,
      "url": url
    };
  }
}
