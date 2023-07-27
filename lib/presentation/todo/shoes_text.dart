// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypeneedz/image_helper.dart';

import 'package:image_cropper/image_cropper.dart';

import '../../application/shoes/form_bloc/bloc/form_bloc_bloc.dart';

import '../NewsPage/widgets/custbut.dart';

class ShoesText extends StatelessWidget {
  const ShoesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final textEditingControllerName = TextEditingController();

    final textEditingControllerBrand = TextEditingController();
    final textEditingControllerSku = TextEditingController();
    final textEditingControllerDesc = TextEditingController();

    final textEditingControllerReleaseDates = TextEditingController();
    final textEditingControllerViews = TextEditingController();

    late String name;

    late String sku;
    late String brand;
    late String desc;
    late String releaseDate;
    late String modell;
    late int views;

    List<String> modells = [
      'Air Jordan 1',
      'Air Jordan 2',
      'Air Jordan 3',
      'Air Jordan 4',
      'Air Jordan 5',
      'Air Jordan 6',
      'Air Jordan 7',
      'Air Jordan 8',
      'Air Jordan 9',
      'Air Jordan 10',
      'Air Jordan 11',
      'Air Jordan 12',
      'Air Jordan 13',
      'Air Jordan 14'
    ];
    String? selectedModells;

// Initialize images as an empty list

    String? validateName(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 120) {
        name = input;
        return null;
      } else {
        return "name too long";
      }
    }

    String? validateSku(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 9000) {
        sku = input;
        return null;
      } else {
        return "sku too long";
      }
    }

    String? validateBrand(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 500) {
        brand = input;
        return null;
      } else {
        return "image too long";
      }
    }

    String? validateModell(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 120) {
        modell = input;
        return null;
      } else {
        return "src too long";
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

    String? validateReleaseDate(String? input) {
      if (input == null || input.isEmpty) {
        return 'Please enter some text';
      } else if (input.length < 120) {
        releaseDate = input;
        return null;
      } else {
        return "src too long";
      }
    }

    return BlocConsumer<ShoesFormBloc, ShoesFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingControllerName.text = state.shoes.name;

        textEditingControllerSku.text = state.shoes.sku;

        textEditingControllerDesc.text = state.shoes.desc;
        textEditingControllerReleaseDates.text = state.shoes.releaseDate;

        textEditingControllerViews.text = state.shoes.views.toString();
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
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        items: modells
                            .map((modell) => DropdownMenuItem<String>(
                                  value: modell,
                                  child: Text(modell),
                                ))
                            .toList(),
                        value: selectedModells,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Modell',
                          labelStyle: Theme.of(context).textTheme.bodyText1!,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                        onChanged: (value) {
                          selectedModells = value;
                        },
                        validator: validateModell,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name',
                          style: Theme.of(context).textTheme.bodyText1!),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        controller: textEditingControllerName,
                        cursorColor: Colors.amber,
                        validator: validateName,
                        maxLength: 120,
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: "Name",
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
                  controller: textEditingControllerBrand,
                  cursorColor: Colors.amber,
                  validator: validateBrand,
                  maxLength: 120,
                  maxLines: 3,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "brand",
                    labelStyle: Theme.of(context).textTheme.bodyText2!,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: textEditingControllerSku,
                  cursorColor: Colors.amber,
                  validator: validateSku,
                  maxLength: 9000,
                  maxLines: 199,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "sku",
                    labelStyle: Theme.of(context).textTheme.bodyText2!,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: textEditingControllerReleaseDates,
                  cursorColor: Colors.amber,
                  validator: validateReleaseDate,
                  maxLength: 9000,
                  maxLines: 199,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "ReleaseDates",
                    labelStyle: Theme.of(context).textTheme.bodyText1!,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  buttonText: "Save",
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      name = textEditingControllerName.text;
                      desc = textEditingControllerDesc.text;
                      sku = textEditingControllerSku.text;
                      brand = textEditingControllerSku.text;

                      releaseDate = textEditingControllerReleaseDates.text;
                      views = 0;

                      BlocProvider.of<ShoesFormBloc>(context).add(
                        SafePressedEvent(
                          sku: sku,
                          desc: desc,
                          name: name,
                          images: state.images,
                          brand: brand,
                          releaseDate: releaseDate,
                          views: views,
                          modell: modell,
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
                      BlocProvider.of<ShoesFormBloc>(context).add(
                        SafePressedEvent(
                          sku: null,
                          name: null,
                          desc: null,
                          brand: null,
                          releaseDate: null,
                          modell: null,
                          views: null,
                          images: null,
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

  void _pickImages(BuildContext context) async {
    final pickedFiles = await ImageHelper.pickImagesFromGallery(
        context: context,
        cropStyle: CropStyle.rectangle,
        title: 'Upload Images',
        color: Theme.of(context).primaryColor);
    if (pickedFiles != null) {
      context.read<ShoesFormBloc>().add(ImagesChangedEvent(
          images: pickedFiles.map((file) => File(file.path)).toList()));
    }
  }
}
