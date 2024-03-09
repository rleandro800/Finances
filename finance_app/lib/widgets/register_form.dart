import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(20),
          //color: Colors.black12,
        ),
        width: 380,
        height: 665,
        child: ListView(
          children: [
            const Text(
              'Cadastre-se',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                  labelText: 'Nome Completo'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  labelText: 'E-mail'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                  labelText: 'Senha'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFF00FFFF), //0xFFF58524
                      Color(0xFF48D1CC), //0XFFF92B7F
                    ]
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(5)
                ),
              ),
              child: SizedBox.expand(
                  child: TextButton(onPressed: (){}, child: Text('Cadastrar',style: TextStyle(color: Colors.black),))
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 40,
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: (){},
                    child: Text('Login', style: TextStyle(color: Colors.black54),)
                )
            ),
          ],
        ),
      ),
    );
  }
}
