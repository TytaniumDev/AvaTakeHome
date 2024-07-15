/// A collection of [FormFieldValidator]s for use in [TextFormFields] or other
/// text widgets that need validators.
library;

import 'package:flutter/widgets.dart';

FormFieldValidator<String> notEmptyValidator = (String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
};
