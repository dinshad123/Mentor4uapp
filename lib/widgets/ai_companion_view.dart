import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';

class AiCompanionView extends StatelessWidget {
  const AiCompanionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onDoubleTap: () {},
                child: const Image(
                  image: AssetImage(chatGptLogo),
                  width: 35,
                  height: 35,
                ),
              ),
              InkWell(
                onDoubleTap: () {},
                splashColor: Colors.amber,
                child: const Image(
                  image: AssetImage(claudeLogo),
                  width: 35,
                  height: 35,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Image(
                  image: AssetImage(
                    geminiLogo,
                  ),
                  width: 35,
                  height: 35,
                ),
              ),
            ],
          ),
        ));
  }
}
