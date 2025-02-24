import 'package:confetti/confetti.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hdb/widgets/custom_app_bar.dart';
import 'package:hdb/widgets/custom_confitti.dart';
import 'package:hdb/widgets/custom_text_widget.dart';

class Quote {
  final String title;
  final String imageUrl;
  final String quote;
  bool isFavorite = false;

  Quote({required this.title, required this.imageUrl, required this.quote});
}

List<Quote> quotes = [
  Quote(
    title: '''
        هلا يا حبي عامله ايه 
        طمنيني عليكي عامله ايه 
        انا عارف انك كويسة وبخير وشاطرة وقوية زي على طول 
        كل سنه وانتي طيبة وبخير وبصحة وسلامه يارب 
        كل سنه وانتي بتحققي حاجه جديده نفسك فيها وبتبقي احسن وافضل في كل حاجه
        كل سنه وانتي بتقربي مني يوم بيوم علشان نبقا مع بعض 
        انا عارف انك قد اي صعوبات وقد اي مشاكل بتواجهك في حياتك علشان انا حبيت بنوتة قوية جدا وملتزمه جدا ومحترمه جدا 
        عارف انك شاطرة في مذاكرتك وحياتك وهتطلعي الاولى دايما 
        وعارف انك دايما طيبة وحنونة وبتحبي الخير لأي حد حواليكي 
        بس متخليش ده يخلي الناس تضحك عليكي خليكي واعيه برضو 
        واعرفي اني دايما معاكي وجنبك في كل لحظه 
        وعلشان اثبتلك ده عملتلك الابلكيشن ده علشان دايما تدخلي تشوفيه وتعرفي اني دايما معاكي في كل لحظة واني جنبك ودايما بحاول علشانك وبدعيلك 
        ربنا يحميكي ويوفقك ويسترها معاكي دايما يارب وعليكي ويبعد عنك 
       ❤ كل شر واذى وسوء يارب بحبك اوي 
    ''',
    imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
    quote: "zizo",
  ),
];

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late ConfettiController _controllerCenterTop;

  @override
  void initState() {
    super.initState();
    _controllerCenterTop = ConfettiController(
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _controllerCenterTop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFF000C15),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 24, end: 30),
            duration: const Duration(seconds: 3),
            curve: Curves.bounceOut,
            builder: (context, value, child) {
              return Text(
                'Quotes',
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
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _ImageView(quote: quotes[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  quotes[index].imageUrl,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 25,
                          right: 25,
                          child: Center(
                            child: CustomTextWidget(
                              text: quotes[index].title,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: GestureDetector(
                            onTap: () {
                              _controllerCenterTop.play();
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              child: Center(
                                child: Image.asset(
                                  "assets/quotes_bg/celebrate.png",
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            quotes[index].quote,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
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
    );
  }
}

class _ImageView extends StatelessWidget {
  final Quote quote;

  const _ImageView({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFF000C15),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtendedImage.asset(
                quote.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              CustomTextWidget(
                text: quote.title,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 12),
              CustomTextWidget(
                text: "~ ${quote.quote}",
                fontSize: 20,
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
