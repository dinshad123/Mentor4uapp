import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/provider/user_provider.dart';
import 'package:mentor4u_app/screens/field_selection_screen.dart';
import 'package:provider/provider.dart';

enum RoleSelection { mentor, mentee }

class RoleSelectionScreen extends StatefulWidget {
  static const String routeName = '/roleselection-screen';
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  bool toggleSelection = false;
  RoleSelection? roleSelected = null;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double horizontalPadding = screenSize.width * 0.05;
    double verticalPadding = screenSize.height * 0.10;
    double logoHeight = screenSize.height * 0.10;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
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
                      'Set your goal ! \nBe ready to be guided..... ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (toggleSelection == true)
                      Column(
                        children: [
                          RadioListTile(
                            value: RoleSelection.mentor,
                            groupValue: roleSelected,
                            title: Text(
                              'Mentor',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            subtitle: Text(
                              'A guide who leads you to your goals',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            onChanged: (RoleSelection) {
                              setState(() {
                                roleSelected = RoleSelection;
                              });
                            },
                          ),
                          RadioListTile(
                            value: RoleSelection.mentee,
                            groupValue: roleSelected,
                            title: Text(
                              'Mentee',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            subtitle: Text(
                              'A guide who leads you to your goals',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            onChanged: (value) {
                              setState(() {
                                roleSelected = value;
                              });
                            },
                          ),
                        ],
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          (toggleSelection == true ? 0.2 : 0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.001),
                      child: Consumer<UserProvider>(
                          builder: (context, roleProvider, child) {
                        return Center(
                          child: OutlinedButton(
                            style: ButtonStyle(
                                splashFactory: InkRipple.splashFactory,
                                fixedSize: WidgetStatePropertyAll(
                                  Size(
                                    MediaQuery.of(context).size.width * 0.5,
                                    MediaQuery.of(context).size.height * 0.060,
                                  ),
                                )),
                            onPressed: () {
                              toggleButton();
                              if (roleSelected != null) {
                                Navigator.pushNamed(
                                    context, FieldSelectionScreen.routeName,
                                    arguments: roleSelected
                                        .toString()
                                        .split('.')
                                        .last);
                              }
                            },
                            child: Text(toggleSelection == true
                                ? "Next"
                                : "Let's get Started"),
                          ),
                        );
                      }),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void toggleButton() {
    setState(() {
      toggleSelection = true;
    });
  }
}
