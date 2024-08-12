package com.example.chapter23_3_3;

import androidx.annotation.NonNull;
import io.flutter.plugins.DatePigeon;
import io.flutter.plugins.DatePigeon.Result;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL_DATETIME = "chapter23/datetime";

    public class DateTimeClass implements DatePigeon.NativeDateAPI {
        @Override
        public void getDate(@NonNull Result<String> result) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss", Locale.getDefault());
            result.success(sdf.format(new Date()));
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        BinaryMessenger messenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        DateTimeClass dateTimeClass = new DateTimeClass();
        DatePigeon.NativeDateAPI.setUp(messenger, dateTimeClass);
    }
}
