package com.example.chapter23;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL_DATETIME = "chapter23/datetime";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_DATETIME)
                .setMethodCallHandler(
                        (call, result) -> {
                            switch (call.method) {
                                case "getDateTime":
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss", Locale.getDefault());
                                    result.success(sdf.format(new Date()));
                                    break;
                            }
                        });
    }
}
