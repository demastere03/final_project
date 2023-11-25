import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_akhir/comment_page/add_comment.dart';
import 'package:tugas_akhir/main.dart';
import 'package:tugas_akhir/product_model/comment_model.dart';

class CommentList extends StatefulWidget {
  const CommentList({super.key});

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late Box<CommentModel> _myBox;

  @override
  void initState() {
    super.initState();
    _myBox = Hive.box(boxName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comment Section Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Comment List"),
          automaticallyImplyLeading: false,
        ),
        body: ValueListenableBuilder(
            valueListenable: _myBox.listenable(),
            builder: (context, value, child) {
              if (value.isEmpty) {
                return const Center(
                  child: Text('Comment List Masih Kosong'),
                );
              }
              return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    CommentModel comment = value.getAt(index)!;
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        _myBox.deleteAt(index);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Comment Deleted'),
                          backgroundColor: Colors.red,
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(comment.title),
                            subtitle: Text(comment.description),
                          ),
                        ),
                      ),
                    );
                  });
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddComment();
              }));
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
