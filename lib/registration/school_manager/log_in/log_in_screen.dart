import 'package:flutter/material.dart';
import 'components/body.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = 'log_in_screen';

  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/bg4.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.1),),
            ),
            child: Column(
                children: [
                  Text("Connexion",
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  Text("Veuillez renseigner vos informations de connexion",
                    style: const TextStyle(fontSize: 16),),
                  SizedBox(height: 50,),
                  Expanded(child: Body()),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
