package com.hopeman.im;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViewById(R.id.btn).setOnClickListener((View v) -> startActivity(FlutterActivity.withNewEngine().build(MainActivity.this)));
    }
}
