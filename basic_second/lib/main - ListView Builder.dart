import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LVPage(),
    );
  }
}

class LVPage extends StatefulWidget {
  const LVPage({super.key});

  @override
  State<LVPage> createState() => _LVPageState();
}

class _LVPageState extends State<LVPage> {
  var titleList = [
    'Dentist(치과 의사)',
    'Pharmacist(약사)',
    'School teacher(학교 선생님)',
    'IT manager(IT 관리자)',
    'Accountant(회계사)',
    'Lawyer(변호사)',
    'Hairdresser(미용사)',
    'Physician(내과 의사)',
    'Web developer(웹 개발자)',
    'Medical Secretary(의료 비서)',
  ];

  var imageList = [
    'image/1.png',
    'image/2.png',
    'image/3.png',
    'image/4.png',
    'image/5.png',
    'image/6.png',
    'image/7.png',
    'image/8.png',
    'image/9.png',
    'image/10.png',
  ];

  var description = [
    '1. There are different types of careers you can pursue in your life. Which one will it be?',
    '2. There are different types of careers you can pursue in your life. Which one will it be?',
    '3. There are different types of careers you can pursue in your life. Which one will it be?',
    '4. There are different types of careers you can pursue in your life. Which one will it be?',
    '5. There are different types of careers you can pursue in your life. Which one will it be?',
    '6. There are different types of careers you can pursue in your life. Which one will it be?',
    '7. There are different types of careers you can pursue in your life. Which one will it be?',
    '8. There are different types of careers you can pursue in your life. Which one will it be?',
    '9. There are different types of careers you can pursue in your life. Which one will it be?',
    '10. There are different types of careers you can pursue in your life. Which one will it be?',
  ];

  void showPopup(context, title, image, description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Builder',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              debugPrint(titleList[index]);
              showPopup(
                context,
                titleList[index],
                imageList[index],
                description[index],
              );
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      imageList[index],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          titleList[index],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: width,
                          child: Text(
                            description[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
