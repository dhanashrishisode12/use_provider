import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_provider/providers/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privoder"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider(),
              child: Consumer<HomePageProvider>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.eligibilityMassage.toString(),
                        style: TextStyle(
                            color: (provider.isEligible == true)
                                ? Colors.green
                                : Colors.red),
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: "Enter the age"),
                        onChanged: (val) {
                          provider.checkEligibility(int.parse(val));
                        },
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
