import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'album_service.dart';
import 'album.dart';

class AddAlbumPage extends StatefulWidget {
  const AddAlbumPage({Key? key}) : super(key: key);

  @override
  _AddAlbumPageState createState() => _AddAlbumPageState();
}

class _AddAlbumPageState extends State<AddAlbumPage> {
  final TextEditingController _titleController = TextEditingController();
  final AlbumService _albumService = AlbumService();

  bool _isAlbumAdded = false;

  void _addAlbum(String title) {
    _albumService.addAlbum(title).then((newAlbum) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Album added successfully!'),
        ),
      );
      setState(() {
        _isAlbumAdded = true;
      });
      Navigator.pop(context, true);
    }).catchError((error) {
      if (kDebugMode) {
        print('Error adding album: $error');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add album. Please try again.'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Album'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Album Title'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                _addAlbum(title);
              },
              child: const Text('Add Album'),
            ),
          ],
        ),
      ),
    );
  }
}
