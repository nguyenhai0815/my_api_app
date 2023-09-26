import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'add_album.dart';
import 'album_service.dart';
import 'album.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  final AlbumService _albumService = AlbumService();
  late Future<List<Album>> _albums;

  void _addAlbum(String title) {
    _albumService.addAlbum(title).then((newAlbum) {
      // Sau khi thêm album thành công, cập nhật danh sách
      setState(() {
        _albums = _albumService.getAlbums();
      });
    }).catchError((error) {
      // Xử lý lỗi
      if (kDebugMode) {
        print('Error adding album: $error');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _albums = _albumService.getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAlbumPage(),
                ),
              );
              if (result == true) {
                setState(() {
                  _albums = _albumService.getAlbums();
                });
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Album>>(
        future: _albums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final albums = snapshot.data;
            return ListView.builder(
              itemCount: albums!.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return ListTile(
                  title: Text(album.title),
                );
              },
            );
          }
        },
      ),
    );
  }
}
