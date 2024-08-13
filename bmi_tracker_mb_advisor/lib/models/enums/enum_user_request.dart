enum EUserRequestType { CREATE_FOOD, CREATE_EXERCISE, Dinner, OTHER }

extension EUserRequestTypeExtension on EUserRequestType {
  static EUserRequestType fromString(String mealType) {
    switch (mealType) {
      case 'Create food request':
        return EUserRequestType.CREATE_FOOD;
      case 'Create exercise request':
        return EUserRequestType.CREATE_EXERCISE;
      case 'Dinner':
        return EUserRequestType.Dinner;
      case 'Snack':
        return EUserRequestType.Dinner;
      default:
        return EUserRequestType.OTHER;
    }
  }

  String get name {
    switch (this) {
      case EUserRequestType.CREATE_FOOD:
        return 'Create food request';
      case EUserRequestType.CREATE_EXERCISE:
        return 'Create exercise request';
      case EUserRequestType.Dinner:
        return 'Dinner';
      case EUserRequestType.OTHER:
        return 'Other';
    }
  }
}
