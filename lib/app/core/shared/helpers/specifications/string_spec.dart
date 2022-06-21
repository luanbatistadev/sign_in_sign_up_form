class StringSpecification {
  bool isSatisfiedBy(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }
}
