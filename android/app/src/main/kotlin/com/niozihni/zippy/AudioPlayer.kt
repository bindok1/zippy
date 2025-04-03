package com.niozihni.zippy

import android.content.Context
import android.media.MediaPlayer
import java.io.File
import java.net.URL
import java.io.FileOutputStream

class AudioPlayer(private val context: Context) {
    private var mediaPlayer: MediaPlayer? = null
    private var positionUpdateCallback: ((Int) -> Unit)? = null
    private var playingStateCallback: ((Boolean) -> Unit)? = null
    private var isUpdating = false 
    private var lastPosition = 0

    fun playAudio(path: String) {
        try {  
            if(mediaPlayer?.isPlaying == true){
                pause()
                return
            }
            if(mediaPlayer != null){
                resume()
                return
            }
            lastPosition = 0
            stopPositionUpdates()
            mediaPlayer?.release()
            
            if (path.startsWith("http")) {
                val cachedFile = getCachedFile(path)
                if (cachedFile.exists()) {
                    playFromFile(cachedFile)
                } else {
                    downloadAndPlay(path, cachedFile)
                }
            } else {
                playFromAsset(path)
            }
        } catch (e: Exception) {
            e.printStackTrace()
            playingStateCallback?.invoke(false)
        }
    }

    private fun getCachedFile(url: String): File {
        val fileName = url.substringAfterLast("/")
        return File(context.cacheDir, fileName)
    }

    private fun downloadAndPlay(url: String, outputFile: File) {
        Thread {
            try {
                URL(url).openStream().use { input ->
                    FileOutputStream(outputFile).use { output ->
                        val buffer = ByteArray(4096)
                        var bytesRead: Int
                        while (input.read(buffer).also { bytesRead = it } != -1) {
                            output.write(buffer, 0, bytesRead)
                        }
                    }
                }
                context.mainExecutor.execute {
                    playFromFile(outputFile)
                }
            } catch (e: Exception) {
                e.printStackTrace()
                context.mainExecutor.execute {
                    playingStateCallback?.invoke(false)
                }
            }
        }.start()
    }

    private fun playFromFile(file: File) {
        mediaPlayer = MediaPlayer().apply {
            setDataSource(file.path)
            prepare()
            start()
            playingStateCallback?.invoke(true)
            startPositionUpdates()
        }
    }

    private fun playFromAsset(assetPath: String) {
        mediaPlayer = MediaPlayer().apply {
            val descriptor = context.assets.openFd(assetPath)
            setDataSource(descriptor.fileDescriptor, descriptor.startOffset, descriptor.length)
            prepare()
            start()
            playingStateCallback?.invoke(true)
            startPositionUpdates()
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
        mediaPlayer?.let {
            player -> lastPosition = player.currentPosition
        }
        stopPositionUpdates()
        mediaPlayer?.pause()
        playingStateCallback?.invoke(false)
    }

    fun clearCache(){
        try{
            context.cacheDir.listFiles()?.forEach { file ->
                if(file.name.endsWith(".mp3")){
                    file.delete()
                }
            }
        }catch (e: Exception){
            e.printStackTrace()
        }
    }

    fun resume() {
        mediaPlayer?.let{player ->
        player.seekTo(lastPosition)
        player.start()
        playingStateCallback?.invoke(true)
        startPositionUpdates()}
    }

    fun seekTo(position: Int) {
        mediaPlayer?.let {player -> player.seekTo(position)
            lastPosition=position
            if(!player.isPlaying){
                resume()
            }
        }
    }

    fun stop() {
        stopPositionUpdates()
        lastPosition = 0
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