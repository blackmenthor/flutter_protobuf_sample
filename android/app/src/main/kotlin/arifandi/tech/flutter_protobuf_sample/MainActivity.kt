package arifandi.tech.flutter_protobuf_sample

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import publish.AlbumOuterClass.ListOfAlbums
import publish.AlbumOuterClass.ListOfAlbums.Album

class MainActivity: FlutterActivity() {

    private val CHANNEL = "samples.flutter.dev/protobuf"

    private val albums = mutableListOf<Album>()
    private val albumsA = mutableListOf<AlbumA>()

    class PigeonImpl(private val albumsA: List<AlbumA> = mutableListOf()): AlbumApi {

        override fun getAlbum(): List<AlbumA?> {
           return albumsA
        }
    }

    private fun getProtos(): ByteArray {
        Log.e("ONGGO", "PROT ${albums.size}")
        val items = ListOfAlbums
            .newBuilder()
            .addAllAlbums(albums)
            .build()
        return items.toByteArray()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        for (i in 1..100000) {
            val album = Album
                .newBuilder()
                .setId("ID_$i")
                .setTitle("TITLE $i")
                .setPrice(100F)
                .setArtist("ARTIST $i")
                .build()
            albums.add(album)

            val albumA = AlbumA(
                id = "ID_$i",
                title = "TITLE $i",
                artist = "ARTIST $i",
                price = Double.MAX_VALUE
            )
            albumsA.add(albumA)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        AlbumApi.setUp(binaryMessenger = flutterEngine.dartExecutor.binaryMessenger, api = PigeonImpl(albumsA))

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "getProtos" -> {
                    val resp = getProtos()
                    result.success(resp)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

}
