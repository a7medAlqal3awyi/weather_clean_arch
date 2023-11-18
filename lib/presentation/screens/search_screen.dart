import 'package:flutter/material.dart';
import 'package:weather_clean_arch/presentation/screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              height: 15,
            ),
            const Text(
              "Enter the city",
              style: TextStyle(fontSize: 16, ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: cityNameController,
              onSubmitted: (value) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      city:cityNameController.text ,
                        )));
                print(cityNameController.text);
              },
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                  hintText: "City Name ",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
