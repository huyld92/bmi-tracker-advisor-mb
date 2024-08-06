class Recipe {
  int? recipeID;
  int? ingredientID;
  String? ingredientName;
  String? ingredientPhoto;
  double? quantity;
  String? unit;

  Recipe({
    this.recipeID,
    this.ingredientID,
    this.ingredientName,
    this.ingredientPhoto,
    this.quantity,
    this.unit,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeID: json['recipeID'],
      ingredientID: json['ingredientID'],
      ingredientName: json['ingredientName'],
      ingredientPhoto: json['ingredientPhoto'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipeID': recipeID,
      'ingredientID': ingredientID,
      'ingredientName': ingredientName,
      'ingredientPhoto': ingredientPhoto,
      'quantity': quantity,
      'unit': unit,
    };
  }
}
