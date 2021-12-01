import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? selectedCity = "Santa Cruz";

  @override
  Widget build(BuildContext context) {
    var _currencies = [
      'Santa Cruz',
      'Parque das Mangabas',
      'Terceira Etapa',
    ];
    return Scaffold(
      backgroundColor: kColorAzulPrincipal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              width: 300,
              child: DropdownButtonFormField(
                dropdownColor: kColorAzulPrincipal,
                style: const TextStyle(
                  color: Colors.white,
                ),
                items: _currencies.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  selectedCity = newValue;
                },
                value: selectedCity,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    hintText: 'Cidade',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kColorAmareloPrincipal
              ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(localIgreja: selectedCity!,),
                    ),
                  );
                },
                child: const Text("Continuar"))
          ],
        ),
      ),
    );
  }
}
