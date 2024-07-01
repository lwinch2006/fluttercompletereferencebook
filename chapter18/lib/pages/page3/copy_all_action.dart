import 'package:chapter18/pages/page3/copy_all_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectAllAction extends Action<SelectAllIntent> {
  final BuildContext context;
  final String text;

  SelectAllAction(this.context, this.text);

  @override
  bool isEnabled(covariant SelectAllIntent intent) {
    return text.isNotEmpty;
  }

  @override
  Future<Object?> invoke(covariant SelectAllIntent intent) async {
    await Clipboard.setData(ClipboardData(text: text));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data copied to clipboard')));
    }

    return null;
  }
}
