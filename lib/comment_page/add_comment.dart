import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_akhir/main.dart';
import 'package:tugas_akhir/product_model/comment_model.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late Box<CommentModel> _myBox;

  @override
  void initState(){
    super.initState();
    _myBox = Hive.box(boxName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Add Comment',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Add Comment"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child:Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title', border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'Title is Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Title', border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'Title is Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () {
                       if (_formKey.currentState!.validate()){
                         _myBox.add(CommentModel
                           (title: _titleController.text, description: _descriptionController.text),
                         );
                         Navigator.pop(context);
                       }
                    },
                    child: const Text('SUBMIT'),
                  ),
                ],
              ),
            )
          ),
        ),
    );

  }
}