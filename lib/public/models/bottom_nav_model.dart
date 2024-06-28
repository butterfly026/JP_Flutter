class BottomNavModel {
  String? path;
  String? name;
  String? sort;
  String? isBuilding;
  String? iconLogo;
  String? selectedLogo;
  String? iconHot;
  int? status;
  String? isHot;
  String? icon;
  String? roles;
  String? url;
  List<dynamic>? setting;

  BottomNavModel({
    this.path,
    this.name,
    this.sort,
    this.isBuilding,
    this.iconLogo,
    this.selectedLogo,
    this.iconHot,
    this.status,
    this.isHot,
    this.icon,
    this.roles,
    this.url,
    this.setting,
  });

  // Factory method to create an instance from a JSON object
  factory BottomNavModel.fromJson(Map<String, dynamic> json) {
    return BottomNavModel(
      path: json['path'] as String,
      name: json['name'] as String,
      sort: json['sort'] as String,
      isBuilding: json['isBuilding'] as String,
      iconLogo: json['icon_logo'] as String,
      selectedLogo: json['selected_logo'] as String,
      iconHot: json['icon_hot'] as String,
      status: json['status'] as int,
      isHot: json['isHot'] as String,
      icon: json['icon'] as String,
      roles: json['roles'] as String,
      url: json['url'] as String,
      setting: json['setting'] as List<dynamic>,
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'name': name,
      'sort': sort,
      'isBuilding': isBuilding,
      'icon_logo': iconLogo,
      'selected_logo': selectedLogo,
      'icon_hot': iconHot,
      'status': status,
      'isHot': isHot,
      'icon': icon,
      'roles': roles,
      'url': url,
      'setting': setting,
    };
  }
}
