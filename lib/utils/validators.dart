String? generalValidator(String? value) {
  if (value!.isEmpty) {
    return 'Field required';
  }
  if (value.length > 20) {
    return 'Can not have more than 20 characters';
  }
  return null;
}
