mixin ValidatorMixin {
  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "Title cannot be empty";
    } else if (value.length < 5) {
      return "Title must be more than 5 characters";
    }
    return null;
  }

  String? validateDesc(String? value) {
    if (value == null || value.isEmpty) {
      return "Title cannot be empty";
    } else if (value.length < 8) {
      return "Title must be more than 8 characters";
    }
    return null;
  }
}
