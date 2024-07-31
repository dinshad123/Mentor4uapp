import 'package:flutter/material.dart';

class MentorBuilderView extends StatefulWidget {
  const MentorBuilderView({super.key});

  @override
  State<MentorBuilderView> createState() => _MentorBuilderViewState();
}

class _MentorBuilderViewState extends State<MentorBuilderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.secondaryFixed,
      ),
      child: Stack(
        children: [
          Positioned(
            height: 70,
            width: 70,
            top: 10,
            left: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=996&t=st=1721698700~exp=1721699300~hmac=5de1f287cd1bdf67454fb234551913924163a3d62d728ca266d8761e565a9ef7',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 75,
              child: Text(
                'Software Development',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              )),
          const Positioned(
              top: 90,
              left: 15,
              child: Text(
                'Field Name',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              )),
        ],
      ),
    );
  }
}
