class EnvRadioButtonConfig {
  String label;
  dynamic value;
  dynamic groupValue;
  void Function(dynamic) onChanged;


  EnvRadioButtonConfig({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
}
