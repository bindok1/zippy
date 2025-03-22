package com.niozihni.zippy

import android.content.Context
import android.media.MediaPlayer

class AudioPlayer(private val context: Context) {
    private var mediaPlayer: MediaPlayer? = null
    private var positionUpdateCallback: ((Int) -> Unit)? = null
    private var playingStateCallback: ((Boolean) -> Unit)? = null
    private var isUpdating = false 

    fun playAudio(assetPath: String) {
        try {  
            stopPositionUpdates()
            mediaPlayer?.release()
            mediaPlayer = MediaPlayer().apply {
                val descriptor = context.assets.openFd(assetPath)
                setDataSource(descriptor.fileDescriptor, descriptor.startOffset, descriptor.length)
                prepare()
                start()
                playingStateCallback?.invoke(true)
                startPositionUpdates()
            }
        } catch (e: Exception) {
            e.printStackTrace()
            playingStateCallback?.invoke(false)
        }
    }

    private fun stopPositionUpdates() {
        isUpdating = false
    }

    private fun startPositionUpdates() {
        isUpdating = true
        Thread {
            while (isUpdating && mediaPlayer != null) {
                try {
                    if (mediaPlayer?.isPlaying == true) {
                        mediaPlayer?.currentPosition?.let { position ->
                            positionUpdateCallback?.invoke(position)
                        }
                    }
                    Thread.sleep(100)
                } catch (e: Exception) {
                    e.printStackTrace()
                    break
                }
            }
        }.start()
    }

    fun pause() {
        stopPositionUpdates()
        mediaPlayer?.pause()
        playingStateCallback?.invoke(false)
    }

    fun resume() {
        mediaPlayer?.start()
        playingStateCallback?.invoke(true)
        startPositionUpdates()
    }

    fun stop() {
        stopPositionUpdates()
        mediaPlayer?.apply {
            stop()
            reset()
            release()
        }
        mediaPlayer = null
        playingStateCallback?.invoke(false)
    }

    fun setPositionUpdateCallback(callback: (Int) -> Unit) {
        positionUpdateCallback = callback
    }

    fun setPlayingStateCallback(callback: (Boolean) -> Unit) {
        playingStateCallback = callback
    }
}