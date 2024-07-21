import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  return integrationDriver(responseDataCallback: (data) async {
    if (data != null) {
      final timeline = Timeline.fromJson(data['counter_button_perf']);
      final summary = TimelineSummary.summarize(timeline);

      await summary.writeTimelineToFile(
        'counter_button_perf',
        pretty: true,
        includeSummary: true,
      );
    }
  });
}
