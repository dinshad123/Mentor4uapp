import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor4u_app/assets.dart';

import 'package:mentor4u_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FieldSelectionScreen extends StatefulWidget {
  final String role;
  static const routeName = '/field-selection-screen';

  const FieldSelectionScreen({
    super.key,
    required this.role,
  });

  @override
  State<FieldSelectionScreen> createState() => _FieldSelectionScreenState();
}

class _FieldSelectionScreenState extends State<FieldSelectionScreen> {
  String? dropDownValue = null;

  List<String> dropDownMenu = [
    'Software Development',
    'Data & Analytics',
    'Information Techonology',
    'Marketing',
    'Design'
  ];

  final TextEditingController _nameController = TextEditingController();
  XFile? _image;
  void imagePicking({required bool isCameraSelected}) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? result = await picker.pickImage(
        source: isCameraSelected ? ImageSource.camera : ImageSource.gallery,
      );
      if (result != null) {
        setState(() {
          _image = result;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double horizontalPadding = screenSize.width * 0.05;
    double verticalPadding = screenSize.height * 0.05;
    double logoHeight = screenSize.height * 0.10;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child:
                Consumer<UserProvider>(builder: (context, roleProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    logoSmall,
                    fit: BoxFit.fill,
                    height: logoHeight,
                    width: MediaQuery.of(context).size.width * 0.35,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Name you & Field of Interest ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: _image == null
                                  ? TextButton(
                                      child: const Text('Upload\nImage'),
                                      onPressed: () {
                                        imagePicking(isCameraSelected: false);
                                      },
                                    )
                                  : Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                    ),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              ' Capture your image',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )),
                        IconButton(
                            onPressed: () {
                              imagePicking(isCameraSelected: true);
                            },
                            icon: const Icon(Icons.camera_enhance_rounded))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    elevation: 8,
                    color: Color.fromARGB(255, 176, 246, 178),
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Full Name',
                              style: TextStyle(fontSize: 20),
                            ),
                            TextField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                            ),
                            const Text(
                              'Select your Field',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                value: dropDownValue,
                                icon: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.35,
                                    ),
                                    child: const Icon(
                                        Icons.arrow_drop_down_circle_outlined)),
                                hint: const Text(
                                  'Nothing selected',
                                  style: TextStyle(color: Colors.green),
                                ),
                                items: dropDownMenu.map((String field) {
                                  return DropdownMenuItem<String>(
                                      value: field, child: Text(field));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropDownValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.001),
                    child: Center(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            splashFactory: InkRipple.splashFactory,
                            fixedSize: WidgetStatePropertyAll(
                              Size(
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height * 0.060,
                              ),
                            )),
                        onPressed: () {
                          final provider =
                              Provider.of<UserProvider>(context, listen: false);
                          provider.saveUser(
                            _nameController.text,
                            widget.role,
                            dropDownValue!,
                            File(_image!.path),
                            context,
                          );
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  ),
                  Consumer<UserProvider>(
                      builder: (context, useprovider, child) {
                    final provider =
                        Provider.of<UserProvider>(context, listen: false);
                    if (provider.isDataSaved! && provider.isDataSaved != null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
