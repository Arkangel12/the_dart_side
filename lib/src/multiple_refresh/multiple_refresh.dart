import 'package:flutter/material.dart';
import 'package:the_dart_side/src/multiple_refresh/stateful/sample_stateful.dart';
import 'package:the_dart_side/src/multiple_refresh/value_notifier/sample_valuenotifier.dart';

import 'change_notifier/sample_changenotifier.dart';

class MultipleRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: SampleValueNotifier.init(),
    );
  }
}
