package com.niozihni.zippy

import android.media.MediaPlayer
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.niozihni.zippy.AudioPlayer

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.niozihni.zippy/audio"
    private var audioPlayer: AudioPlayer? = null
    private lateinit var methodChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        audioPlayer = AudioPlayer(context)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

       
        audioPlayer?.setPositionUpdateCallback { position: Int ->
            runOnUiThread {
                methodChannel.invokeMethod("onPositionChanged", position)
            }
        }

        audioPlayer?.setPlayingStateCallback { isPlaying: Boolean ->
            runOnUiThread {
                methodChannel.invokeMethod("onPlayingStateChanged", isPlaying)
            }
        }

        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "playAudio" -> {
                    val path = call.argument<String>("path")
                    path?.let {
                        audioPlayer?.playAudio(it)
                        result.success(true)
                    }
                }
                "pauseAudio" -> {
                    audioPlayer?.pause()
                    result.success(null)
                }
                "resumeAudio" -> {
                    audioPlayer?.resume()
                    result.success(null)
                }
                "stopAudio" -> {
                    audioPlayer?.stop()
                    result.success(null)
                }
                "clearAudioCache" -> {
                    audioPlayer?.clearCache()
                    result.success(null)
                }
                "seekTo" -> {
                    val position = call.argument<Int>("position")
                    if(position != null){
                        audioPlayer?.seekTo(position)
                        result.success(null)
                    }else{
                        result.error("INVALID_ARGUMENT", "Position cannot be null", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        audioPlayer?.stop()
        audioPlayer = null
        super.onDestroy()
    }
}