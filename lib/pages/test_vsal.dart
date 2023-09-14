import 'dart:convert';
import 'dart:io';
import 'package:aiataf/services/upload_post_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../const/global_const.dart';
import '../provider/brand_provider.dart';
import 'package:http/http.dart' as http;

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  List<String> productCategories = [
    "Skin",
    "Oral Mucosa",
  ];
  File? image;
  UploadPostService uploadPostService = UploadPostService();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _subTitleController = TextEditingController();

  String catgories = "Skin";
  void sendPost() async {
    if (_titleController.text.isNotEmpty &&
        _subTitleController.text.isNotEmpty) {
      uploadPostService.uplodPost(
          context: context,
          catagory: catgories,
          title: _titleController.text,
          subTitle: _subTitleController.text,
          img: image!.path);
    }
  }

  File? _image;

  // Function to pick an image from the device's gallery
  Future pickImage(BuildContext context, ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);
    setState(() {
      _image = pickedImage == null ? null : File(pickedImage.path);
    });
  }

  Future<void> uploadImage({
    required String title,
    required String subTitle,
  }) async {
    if (_image == null) return;
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
    };
    final serverUrl = "$uri/api/cases"; // Replace with your server URL

    List<int> imageBytes = await _image!.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    String baseI = "data:image/png;base64,";
    String data = baseI + base64Image;
    print("dataddddddddd${data}");
    print("basssssssss   ${base64Image}");

    final response = await http.post(
      Uri.parse(serverUrl),
      body: {
        "thumbnail": data,
        'case_category_id': "1",
        'title': title,
        'short_desc': subTitle,
      },
      headers: headers,
    );
    print(response.body);

    if (response.statusCode == 200) {
      // Image successfully uploaded
      Fluttertoast.showToast(
          msg: "Your Image upload sucessfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print('Image uploaded successfully!');
    } else {
      Fluttertoast.showToast(
          msg: "Your Image upload Unsucessfully ${response.statusCode}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // Handle error
      print('Image upload failed with status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Product'),
        ),
        body: Consumer<RecipeClass>(
          builder: (context, provider, child) => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        label: const Text('Title'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _subTitleController,
                    decoration: InputDecoration(
                        label: const Text('Describe your case'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: catgories,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: productCategories.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          catgories = newVal!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      PopupMenuButton(
                        itemBuilder: ((context) => [
                              PopupMenuItem(
                                onTap: (() =>
                                    pickImage(context, ImageSource.camera)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.camera_alt_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Take a picture'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: (() =>
                                    pickImage(context, ImageSource.gallery)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.image_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Select a picture'),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      const Text(
                        'ADD A PICTURE',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Visibility(
                      visible: provider.image != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              provider.image = null;
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                          ),
                          provider.image != null
                              ? Image.file(
                                  provider.image!,
                                  width: 100,
                                  height: 100,
                                )
                              : Container(),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await uploadImage(
                          title: _titleController.text,
                          subTitle: _subTitleController.text);

                      _titleController.clear();
                      _subTitleController.clear();


                      Navigator.pop(context);
                    },
                    child: const Center(child: Text('Uplaod Post')),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
