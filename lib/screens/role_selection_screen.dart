import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/providers/role_provider.dart';
import 'package:provider/provider.dart';

// enum RoleSelection { mentor, mentee }

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  // RoleSelection? _roleSelectionItems = RoleSelection.mentor;

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
                Consumer<RoleProvider>(builder: (context, roleProvider, child) {
              return Column(
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
                  if (roleProvider.showradioButton)
                    Column(
                      children: [
                        RadioListTile(
                          value: RoleSelection.mentor,
                          groupValue: roleProvider.selectedRole,
                          title: Text(
                            'Mentor',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            'A guide who leads you to your goals',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          onChanged: (RoleSelection? value) {
                            roleProvider.selectRole(value);
                          },
                        ),
                        RadioListTile(
                          value: RoleSelection.mentee,
                          groupValue: roleProvider.selectedRole,
                          title: Text(
                            'Mentee',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            'A guide who leads you to your goals',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          onChanged: (RoleSelection? value) {
                            roleProvider.selectRole(value);
                          },
                        ),
                      ],
                    ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  // ),

                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.001),
                    child: Consumer<RoleProvider>(
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
                            roleProvider.toggleRadioButtons();
                          },
                          child: const Text("Let's get Started"),
                        ),
                      );
                    }),
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
