import 'package:flutter/material.dart';
import 'animal_page.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> animalName = [
    'Cat',
    'Chicken',
    'Cow',
    'Donkey',
    'Duck',
    'Pig',
    'Rabbit',
    'Sheep'
  ];

  static List<String> animalImagePath = [
    'image/cat.png',
    'image/chicken.png',
    'image/cow.png',
    'image/donkey.png',
    'image/duck.png',
    'image/pig.png',
    'image/rabbit.png',
    'image/sheep.png'
  ];

  static List<String> animalLocation = [
    'home',
    'BBQ',
    'forest',
    'forest',
    'river',
    'HanDon',
    'forest',
    'forest'
  ];

  final List<Animal> animalData = List.generate(
      animalLocation.length,
      (index) => Animal(
          animalName[index],
          animalLocation[index],
          animalImagePath[
              index])); // generate는 리스트의 길이를 받아와서 0부터 길이-1까지 오르차순으로 List에 인덱스를 배정해줌

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              //ListTile은 행의 높이가 고정되어 있고 행은 텍스트나 선행 또는 후행 아이콘을 포함함
              title: Text(animalData[index].name),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(animalData[index].imgPath),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimalPage(
                          animal: animalData[index],  //AnimalPage의 animal에 animlaData[index]를 전달해 줌
                        )));
                debugPrint(animalData[index].name);
              },
            ),
          );
        },
      ),
    );
  }
}
