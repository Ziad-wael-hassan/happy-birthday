import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hdb/widgets/custom_app_bar.dart';
import 'package:hdb/widgets/custom_confitti.dart';
import 'package:hdb/widgets/custom_text_widget.dart';
import 'package:hdb/widgets/drawer.dart';
import 'package:extended_image/extended_image.dart';

class Memory {
  final String title;
  final String imageUrl;
  bool isFavorite = false;

  Memory({required this.title, required this.imageUrl});
}

List<Memory> memories = [
  Memory(
    title: "the day we were so nervous but happy to be with each other",
    imageUrl: "assets/love.jpg",
  ),
  Memory(
    title:
        "the neckless that really makes me feel like i'm with you every second",
    imageUrl: "assets/neck.jpg",
  ),
  Memory(
    title:
        "that bunny every time i see i become so happy because you named it after me",
    imageUrl: "assets/bunny.jpg",
  ),
  Memory(title: "The best drawing of me ever made", imageUrl: "assets/man.jpg"),
  Memory(
    title: "first time i tried to get you a gift for your birthday",
    imageUrl: "assets/neck2.jpg",
  ),
  Memory(
    title: "the first time we tried to combine our hearts together",
    imageUrl: "assets/heart.jpg",
  ),
  Memory(
    title: "first time you tried to draw an eye and it was amazing",
    imageUrl: "assets/eye.jpg",
  ),
  Memory(
    title: "the time I knew you were a little van gogh since you were little",
    imageUrl: "assets/dora.jpg",
  ),
];

class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  late ConfettiController _controllerCenterTop;

  @override
  void initState() {
    super.initState();
    _controllerCenterTop = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    memories.shuffle();
  }

  @override
  void dispose() {
    _controllerCenterTop.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    memories.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: Drawer(child: WholeDrawer(dSize: dSize)),
      backgroundColor: const Color(0xFF000C15),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 24, end: 30),
              duration: const Duration(seconds: 3),
              curve: Curves.bounceOut,
              builder: (context, value, child) {
                return Text(
                  'Memories',
                  style: TextStyle(
                    fontSize: value,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              },
            ),
            CustomConfittiWIdget(controllerCenterTop: _controllerCenterTop),
            Expanded(
              child: ListView.builder(
                itemCount: memories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => _ImageView(memory: memories[index]),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Opacity(
                              opacity: 0.5,
                              child: ExtendedImage.asset(
                                memories[index].imageUrl,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                _controllerCenterTop.play();
                                setState(() {
                                  memories[index].isFavorite =
                                      !memories[index].isFavorite;
                                });
                              },
                              child: Icon(
                                memories[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 12,
                            right: 12,
                            child: CustomTextWidget(
                              text: memories[index].title,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  final Memory memory;

  const _ImageView({Key? key, required this.memory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000C15),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtendedImage.asset(
                memory.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              CustomTextWidget(text: memory.title),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
