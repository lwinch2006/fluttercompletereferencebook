import 'package:flutter/material.dart';

class AppTextFieldStyle extends InputDecoration {
  const AppTextFieldStyle({super.icon, super.labelText, super.helperText})
      : super(
          isDense: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        );
}
