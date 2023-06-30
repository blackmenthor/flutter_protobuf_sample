package arifandi.tech.flutter_protobuf_sample

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import publish.AlbumOuterClass.ListOfAlbums
import publish.AlbumOuterClass.ListOfAlbums.Album

class MainActivity: FlutterActivity() {

    private val CHANNEL = "samples.flutter.dev/protobuf"

    private fun getProtos(): ByteArray {
        val albums = mutableListOf<Album>()

        for (i in 1..100) {
            val album = Album
                .newBuilder()
                .setId("ID_$i")
                .setTitle("TITLE $i")
                .setPrice(100F)
                .setArtist("ARTIST $i")
                .build()
            albums.add(album)
        }

        val items = ListOfAlbums
            .newBuilder()
            .addAllAlbums(albums)
            .build()
        return items.toByteArray()
    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getProtos") {
                val resp = getProtos()
                result.success(resp)
            } else {
                result.notImplemented()
            }
        }
    }

}
