// ignore_for_file: deprecated_member_use, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/image_helper.dart';
import 'package:hypeneedz/presentation/NewsPage/widgets/custbut.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../application/news/form_bloc/bloc/form_bloc_bloc.dart';

class NewsText extends StatelessWidget {
  const NewsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final textEditingControllerTitle = TextEditingController();

    final textEditingControllerBody = TextEditingController();
    final textEditingControllerBody2 = TextEditingController();
    final textEditingControllerDesc = TextEditingController();

    final textEditingControllerShoeId = TextEditingController();
    final textEditingControllerViews = TextEditingController();

    late String title;

    late String body;
    late String body2;
    late String desc;
    late String category;
    late String shoeId;
    late int views;

    List<String> categories = ['News', 'Release', 'Drop'];
    String? selectedCategory;

// Initialize images as an empty list

    String? validateTitle(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 120) {
        title = input;
        return null;
      } else {
        return "title too long";
      }
    }

    String? validateBody(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 9000) {
        body = input;
        return null;
      } else {
        return "body too long";
      }
    }

    String? validateBody2(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 500) {
        body2 = input;
        return null;
      } else {
        return "image too long";
      }
    }

    String? validateDesc(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 9000) {
        desc = input;
        return null;
      } else {
        return "desc too long";
      }
    }

    String? validateCategory(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 120) {
        category = input;
        return null;
      } else {
        return "src too long";
      }
    }

    String? validateShoeId(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 500) {
        shoeId = input;
        return null;
      } else {
        return "shoeId too long";
      }
    }

    return BlocConsumer<NewsFormBloc, NewsFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingControllerTitle.text = state.news.title;

        textEditingControllerBody.text = state.news.body;
        textEditingControllerBody2.text = state.news.author;
        textEditingControllerDesc.text = state.news.desc;

        textEditingControllerShoeId.text = state.news.shoeId;
        textEditingControllerViews.text = state.news.views.toString();
        // Initialize thumb and images with existing values
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              children: [
                state.thumb != null
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                          ),
                          height: 130,
                          width: 130,
                          child: Image.file(
                            state.thumb!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => _pickThumbImage(context),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200],
                            ),
                            height: 130,
                            width: 130,
                            child: const Icon(Icons.add_a_photo),
                          ),
                        ),
                      ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        items: categories
                            .map((category) => DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        value: selectedCategory,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Category',
                          labelStyle: Theme.of(context).textTheme.bodyText1!,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                        onChanged: (value) {
                          selectedCategory = value;
                        },
                        validator: validateCategory,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Title',
                          style: Theme.of(context).textTheme.bodyText1!),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        onSaved: (value) => context
                            .read<NewsFormBloc>()
                            .add(TitleChangedEvent(title: value)),
                        controller: textEditingControllerTitle,
                        cursorColor: Colors.amber,
                        validator: validateTitle,
                        maxLength: 120,
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: "Title",
                          labelStyle: Theme.of(context).textTheme.bodyText2!,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: textEditingControllerDesc,
                  cursorColor: Colors.amber,
                  validator: validateDesc,
                  maxLength: 120,
                  maxLines: 3,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "description",
                    labelStyle: Theme.of(context).textTheme.bodyText2!,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: textEditingControllerBody,
                  cursorColor: Colors.amber,
                  validator: validateBody,
                  maxLength: 9000,
                  maxLines: 199,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "body",
                    labelStyle: Theme.of(context).textTheme.bodyText2!,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: textEditingControllerShoeId,
                  cursorColor: Colors.amber,
                  validator: validateShoeId,
                  maxLength: 9000,
                  maxLines: 199,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "ShoeId",
                    labelStyle: Theme.of(context).textTheme.bodyText1!,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                state.images != null
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: state.images?.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            state.images![index],
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : ElevatedButton(
                        onPressed: () => _pickImages(context),
                        child: const Text('Pick Images'),
                      ),
                const SizedBox(height: 10),
                CustomButton(
                  buttonText: "Save",
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      title = textEditingControllerTitle.text;
                      desc = textEditingControllerDesc.text;
                      body = textEditingControllerBody.text;
                      body2 = textEditingControllerBody2.text;

                      shoeId = textEditingControllerShoeId.text;
                      views = 0;

                      BlocProvider.of<NewsFormBloc>(context).add(
                        SafePressedEvent(
                          body: body,
                          desc: desc,
                          title: title,
                          thumb: state.thumb,
                          images: state.images,
                          author: state.news.author,
                          body2: body2,
                          category: category,
                          shoeId: shoeId,
                          views: views,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              const Color.fromARGB(255, 67, 255, 120),
                          content: Text(
                            "New article added",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      );
                      Navigator.of(context).pop();
                    } else {
                      BlocProvider.of<NewsFormBloc>(context).add(
                        SafePressedEvent(
                          body: null,
                          title: null,
                          desc: null,
                          body2: null,
                          category: null,
                          shoeId: null,
                          views: null,
                          thumb: null,
                          images: null,
                          author: null,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            "Invalid Input",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      );
                    }
                  },
                  br: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _pickThumbImage(BuildContext context) async {
    final pickedFile = await ImageHelper.pickImageFromGallery(
        context: context,
        cropStyle: CropStyle.rectangle,
        title: 'Upload Thumb');
    if (pickedFile != null) {
      context.read<NewsFormBloc>().add(ThumbChangedEvent(
            thumb: File(
              pickedFile.path,
            ),
          ));
    }
  }

  void _pickImages(BuildContext context) async {
    final pickedFiles = await ImageHelper.pickImagesFromGallery(
        context: context,
        cropStyle: CropStyle.rectangle,
        title: 'Upload Images',
        color: Theme.of(context).primaryColor);
    if (pickedFiles != null) {
      context.read<NewsFormBloc>().add(ImagesChangedEvent(
          images: pickedFiles.map((file) => File(file.path)).toList()));
    }
  }
}
