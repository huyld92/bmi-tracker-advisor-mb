class UpdateMenuRequest {
  int? menuID;
  String? menuName;
  String? menuDescription;

  UpdateMenuRequest({this.menuID, this.menuName, this.menuDescription});

  factory UpdateMenuRequest.fromJson(Map<String, dynamic> json) {
    return UpdateMenuRequest(
      menuID: json['menuID'],
      menuName: json['menuName'],
      menuDescription: json['menuDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuID': menuID,
      'menuName': menuName,
      'menuDescription': menuDescription,
    };
  }
}
