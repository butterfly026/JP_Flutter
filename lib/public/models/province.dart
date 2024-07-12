class Province {
  Province(
      {this.id = '0',
      this.name = '',
      this.jpName = '',
      this.enName = "",
      this.mainId = '0'});

  String id;
  String name;
  String jpName;
  String enName;
  String mainId;

  dynamic toJson() {
    return {
      'id': id,
      'name': name,
      'jp_name': jpName,
      'en_name': enName,
      'main_id': mainId,
    };
  }

  dynamic operator [](String key) {
    dynamic json = toJson();
    return json[key];
  }

  static Province fromJson(Map<String, dynamic> data) {
    Province ret = Province();
    ret.id = data['id'] ?? '0';
    ret.name = data['name'] ?? '';
    ret.jpName = data['jp_name'] ?? '';
    ret.enName = data['en_name'] ?? '';
    ret.mainId = data['main_id'] ?? '0';
    return ret;
  }

  static List<Province> provinces() {
    List<dynamic> jsonProvinces = [
      {
        "id": "1",
        "name": "\u5317\u6d77\u9053",
        "jp_name": "北海道",
        "en_name": "hokkaido",
        "main_id": "1"
      },
      {
        "id": "2",
        "name": "\u9752\u68ee\u770c",
        "jp_name": "青森県",
        "en_name": "aomori",
        "main_id": "1"
      },
      {
        "id": "3",
        "name": "\u5ca9\u624b\u770c",
        "jp_name": "岩手県",
        "en_name": "iwate",
        "main_id": "1"
      },
      {
        "id": "4",
        "name": "\u5bae\u57ce\u770c",
        "jp_name": "宮城県",
        "en_name": "miyagi",
        "main_id": "1"
      },
      {
        "id": "5",
        "name": "\u79cb\u7530\u770c",
        "jp_name": "秋田県",
        "en_name": "akita",
        "main_id": "1"
      },
      {
        "id": "6",
        "name": "\u5c71\u5f62\u770c",
        "jp_name": "山形県",
        "en_name": "yamagata",
        "main_id": "1"
      },
      {
        "id": "7",
        "name": "\u798f\u5cf6\u770c",
        "jp_name": "福島県",
        "en_name": "fukushima",
        "main_id": "1"
      },
      {
        "id": "8",
        "name": "\u8328\u57ce\u770c",
        "jp_name": "茨城県",
        "en_name": "ibaraki",
        "main_id": "2"
      },
      {
        "id": "9",
        "name": "\u6803\u6728\u770c",
        "jp_name": "栃木県",
        "en_name": "tochigi",
        "main_id": "2"
      },
      {
        "id": "10",
        "name": "\u7fa4\u99ac\u770c",
        "jp_name": "群馬県",
        "en_name": "gunma",
        "main_id": "2"
      },
      {
        "id": "11",
        "name": "\u57fc\u7389\u770c",
        "jp_name": "埼玉県",
        "en_name": "saitama",
        "main_id": "2"
      },
      {
        "id": "12",
        "name": "\u5343\u8449\u770c",
        "jp_name": "千葉県",
        "en_name": "chiba",
        "main_id": "2"
      },
      {
        "id": "13",
        "name": "\u6771\u4eac\u90fd",
        "jp_name": "東京都",
        "en_name": "tokyo",
        "main_id": "2"
      },
      {
        "id": "14",
        "name": "\u795e\u5948\u5ddd\u770c",
        "jp_name": "神奈川県",
        "en_name": "kanagawa",
        "main_id": "2"
      },
      {
        "id": "15",
        "name": "\u65b0\u6f5f\u770c",
        "jp_name": "新潟県",
        "en_name": "niigata",
        "main_id": "3"
      },
      {
        "id": "16",
        "name": "\u5bcc\u5c71\u770c",
        "jp_name": "富山県",
        "en_name": "toyama",
        "main_id": "3"
      },
      {
        "id": "17",
        "name": "\u77f3\u5ddd\u770c",
        "jp_name": "石川県",
        "en_name": "ishikawa",
        "main_id": "3"
      },
      {
        "id": "18",
        "name": "\u798f\u4e95\u770c",
        "jp_name": "福井県",
        "en_name": "fukui",
        "main_id": "3"
      },
      {
        "id": "19",
        "name": "\u5c71\u68a8\u770c",
        "jp_name": "山梨県",
        "en_name": "yamanashi",
        "main_id": "3"
      },
      {
        "id": "20",
        "name": "\u9577\u91ce\u770c",
        "jp_name": "長野県",
        "en_name": "nagano",
        "main_id": "3"
      },
      {
        "id": "21",
        "name": "\u5c90\u961c\u770c",
        "jp_name": "岐阜県",
        "en_name": "gifu",
        "main_id": "4"
      },
      {
        "id": "22",
        "name": "\u9759\u5ca1\u770c",
        "jp_name": "静岡県",
        "en_name": "shizuoka",
        "main_id": "4"
      },
      {
        "id": "23",
        "name": "\u611b\u77e5\u770c",
        "jp_name": "愛知県",
        "en_name": "aichi",
        "main_id": "4"
      },
      {
        "id": "24",
        "name": "\u4e09\u91cd\u770c",
        "jp_name": "三重県",
        "en_name": "mie",
        "main_id": "4"
      },
      {
        "id": "25",
        "name": "\u6ecb\u8cc0\u770c",
        "jp_name": "滋賀県",
        "en_name": "shiga",
        "main_id": "5"
      },
      {
        "id": "26",
        "name": "\u4eac\u90fd\u5e9c",
        "jp_name": "京都",
        "en_name": "kyoto",
        "main_id": "5"
      },
      {
        "id": "27",
        "name": "\u5927\u962a\u5e9c",
        "jp_name": "大坂",
        "en_name": "osaka",
        "main_id": "5"
      },
      {
        "id": "28",
        "name": "\u5175\u5eab\u770c",
        "jp_name": "兵庫県",
        "en_name": "hyogo",
        "main_id": "5"
      },
      {
        "id": "29",
        "name": "\u5948\u826f\u770c",
        "jp_name": "奈良県",
        "en_name": "nara",
        "main_id": "5"
      },
      {
        "id": "30",
        "name": "\u548c\u6b4c\u5c71\u770c",
        "jp_name": "和歌山県",
        "en_name": "wakayama",
        "main_id": "5"
      },
      {
        "id": "31",
        "name": "\u9ce5\u53d6\u770c",
        "jp_name": "鳥取県",
        "en_name": "tottori",
        "main_id": "6"
      },
      {
        "id": "32",
        "name": "\u5cf6\u6839\u770c",
        "jp_name": "島根県",
        "en_name": "shimane",
        "main_id": "6"
      },
      {
        "id": "33",
        "name": "\u5ca1\u5c71\u770c",
        "jp_name": "岡山県",
        "en_name": "okayama",
        "main_id": "6"
      },
      {
        "id": "34",
        "name": "\u5e83\u5cf6\u770c",
        "jp_name": "広島県",
        "en_name": "hiroshima",
        "main_id": "6"
      },
      {
        "id": "35",
        "name": "\u5c71\u53e3\u770c",
        "jp_name": "山口県",
        "en_name": "yamaguchi",
        "main_id": "6"
      },
      {
        "id": "36",
        "name": "\u5fb3\u5cf6\u770c",
        "jp_name": "徳島県",
        "en_name": "tokushima",
        "main_id": "6"
      },
      {
        "id": "37",
        "name": "\u9999\u5ddd\u770c",
        "jp_name": "香川県",
        "en_name": "kagawa",
        "main_id": "6"
      },
      {
        "id": "38",
        "name": "\u611b\u5a9b\u770c",
        "jp_name": "愛媛県",
        "en_name": "ehime",
        "main_id": "6"
      },
      {
        "id": "39",
        "name": "\u9ad8\u77e5\u770c",
        "jp_name": "香落県",
        "en_name": "kochi",
        "main_id": "6"
      },
      {
        "id": "40",
        "name": "\u798f\u5ca1\u770c",
        "jp_name": "福岡県",
        "en_name": "fukuoka",
        "main_id": "7"
      },
      {
        "id": "41",
        "name": "\u4f50\u8cc0\u770c",
        "jp_name": "佐賀県",
        "en_name": "saga",
        "main_id": "7"
      },
      {
        "id": "42",
        "name": "\u9577\u5d0e\u770c",
        "jp_name": "長崎県",
        "en_name": "nagasaki",
        "main_id": "7"
      },
      {
        "id": "43",
        "name": "\u718a\u672c\u770c",
        "jp_name": "熊本県",
        "en_name": "kumamoto",
        "main_id": "7"
      },
      {
        "id": "44",
        "name": "\u5927\u5206\u770c",
        "jp_name": "大分県",
        "en_name": "oita",
        "main_id": "7"
      },
      {
        "id": "45",
        "name": "\u5bae\u5d0e\u770c",
        "jp_name": "宮崎県",
        "en_name": "miyazaki",
        "main_id": "7"
      },
      {
        "id": "46",
        "name": "\u9e7f\u5150\u5cf6\u770c",
        "jp_name": "鹿児島県",
        "en_name": "kagoshima",
        "main_id": "7"
      },
      {
        "id": "47",
        "name": "\u6c96\u7e04\u770c",
        "jp_name": "沖縄",
        "en_name": "okinawa",
        "main_id": "7"
      }
    ];
    List<Province> lstProvinces = [];
    for(dynamic item in jsonProvinces) {
      lstProvinces.add(Province.fromJson(item));
    }
    return lstProvinces;
  }
}
