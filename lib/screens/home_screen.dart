import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/widgets/home_screen_field_container.dart';
import 'package:mentor4u_app/widgets/mentor_builder_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dropDownMenu = [
    'Software Development',
    'Data & Analytics',
    'Information Techonology',
    'Marketing',
    'Design',
    'Finance Accounting',
    'Business Operations',
    'Legal',
    'Writing',
    'Health & Wellness'
  ];

  bool _isExpanded = false;
  void showAllFields() {
    setState(() {
      if (!_isExpanded) {
        _isExpanded = true;
      } else {
        _isExpanded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                logoSmall,
                width: 60,
                color: Colors.white,
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'MENTOR4U',
              style: TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [],
      ),
      body: Column(children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(6),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => const MentorBuilderView(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color.fromARGB(255, 239, 231, 229)),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        'Select Interested Field',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                          itemCount: _isExpanded ? dropDownMenu.length : 4,
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 3),
                          itemBuilder: (context, index) {
                            return Material(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              color: Colors.blue[100],
                              child: HomeScreenFieldContainer(
                                gridViewContainerFunction: (index) {},
                                gridViewText: dropDownMenu[index],
                              ),
                            );
                          }),
                    ),
                    TextButton(
                      onPressed: () {
                        showAllFields();
                      },
                      child: Text(_isExpanded ? 'View less' : 'View more'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
