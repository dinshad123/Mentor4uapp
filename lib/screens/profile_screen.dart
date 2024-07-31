import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=996&t=st=1721698700~exp=1721699300~hmac=5de1f287cd1bdf67454fb234551913924163a3d62d728ca266d8761e565a9ef7',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Dinshad',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Mentee',
            style: TextStyle(
                color: Color.fromARGB(255, 170, 215, 172),
                fontWeight: FontWeight.w100),
          ),
          ListTile(
            leading: const Icon(
              Icons.book,
            ),
            title: const Text('Your Courses'),
            iconColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryColor,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.wallet,
            ),
            title: const Text('Payments'),
            iconColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryColor,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.login_outlined,
            ),
            title: const Text('Sign out'),
            iconColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryColor,
            onTap: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ListTile(
              leading: const Icon(
                Icons.delete,
              ),
              title: const Text('Delete Account'),
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {},
            ),
          ),
        ],
      ),
    ));
  }
}
