package com.example.methodchannel_demo

import android.os.Environment
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File
import java.util.*
import kotlin.collections.ArrayList


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor, "flutter/MethodChannelDemo").setMethodCallHandler { call, result ->
            if (call.method == "Documents") {
                val folder = File(Environment.getExternalStorageDirectory().path + "/Download")
                val allFiles: Array<File> = folder.listFiles()
                val list = Arrays.asList(allFiles)
                var imgs = ArrayList<String>()
                if (list.size >= 1) {
                    for (i in 0..list[0].size - 1) {
                        imgs.add(list[0][i].toString())
                    }
                }
                if (imgs.size <= 0) {
                    result.error("Empty", "No Documents.", null);
                } else {
                    result.success(imgs);
                }

            }
        }
    }
}

