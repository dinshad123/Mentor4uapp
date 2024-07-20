import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/models/mentee_model.dart';
import 'package:mentor4u_app/models/mentor_model.dart';
import 'package:mentor4u_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FieldSelectionScreen extends StatefulWidget {
  String role;
  static const routeName = '/field-selection-screen';

  FieldSelectionScreen({
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double horizontalPadding = screenSize.width * 0.05;
    double verticalPadding = screenSize.height * 0.10;
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 206, 231, 207)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Enter Your Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.050,
                          ),
                          DropdownButton(
                            value: dropDownValue,
                            icon: const Icon(Icons.arrow_drop_down_circle),
                            hint: const Text('Select your field'),
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
                        ],
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
                          );
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
