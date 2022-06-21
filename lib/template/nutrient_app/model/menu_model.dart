class MenuModel {
  String? meal;
  String? totalKcal;
  String? menuName;
  String? kind;
  List<String>? ingredients;
  String? dose;
  String? kcal;
  MenuModel(
      {this.meal,
      this.totalKcal,
      this.menuName,
      this.kind,
      this.ingredients,
      this.dose,
      this.kcal});
  MenuModel.fromJson(Map<String, dynamic> json) {
    meal = json['meal'];
    totalKcal = json['totalKcal'];
    menuName = json['menuName'];
    kind = json['kind'];
    ingredients = json['ingredients'];
    dose = json['dose'];
    kcal = json['kcal'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meal'] = meal;
    data['totalKcal'] = totalKcal;
    data['menuName'] = menuName;
    data['kind'] = kind;
    data['ingredients'] = ingredients;
    data['dose'] = dose;
    data['kcal'] = kcal;
    return data;
  }
}

class MenuModelList {
  List<MenuModel>? menus;

  MenuModelList({
    this.menus,
  });

  factory MenuModelList.fromJson(List<dynamic> parsedJson) {
    List<MenuModel> menus =
        parsedJson.map((e) => MenuModel.fromJson(e)).toList();

    return MenuModelList(
      menus: menus,
    );
  }
}
