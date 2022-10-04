import 'package:flutter/material.dart';

class EnvDropdownConfig { 
  final Map<String, dynamic> items; // displayableText, value 
  final void Function(dynamic) onChanged;
  final TextStyle? style;

  EnvDropdownConfig({
    required this.items,
    required this.onChanged,
    this.style,
  });
}
