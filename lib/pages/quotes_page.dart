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
       example text
      Artificial Intelligence (AI) has rapidly evolved over the past few decades, transforming industries and redefining the way humans interact with technology. From voice assistants to self-driving cars, AI has made its presence felt in almost every aspect of daily life. However, its future holds even more significant advancements that could reshape the global landscape.

The Evolution of AI
AI's journey began with simple rule-based systems, where computers followed predefined instructions. As machine learning and deep learning emerged, AI systems became more capable of recognizing patterns, making predictions, and automating complex tasks. Today, AI models, such as ChatGPT and DALL·E, showcase the ability to generate human-like text and images, pushing the boundaries of what machines can achieve.

The Impact on Industries
AI is revolutionizing multiple sectors:

Healthcare: AI-powered diagnostic tools assist doctors in detecting diseases earlier, while robotic surgeries increase precision and reduce risks. Personalized treatment plans based on AI-driven data analysis enhance patient care.

Finance: Banks and financial institutions use AI to detect fraudulent transactions, assess credit risks, and automate trading decisions, leading to more efficient and secure financial systems.

Education: AI-driven platforms provide personalized learning experiences, adapting to students' strengths and weaknesses. Virtual tutors and AI-powered grading systems reduce the workload on educators.

Transportation: Autonomous vehicles are becoming a reality, promising safer and more efficient transportation. AI optimizes traffic flow and reduces congestion in smart cities.

Entertainment: AI generates music, art, and even movie scripts. Streaming services use AI to recommend content based on user preferences, enhancing user experience.

Ethical and Societal Challenges
Despite its benefits, AI raises concerns about privacy, bias, and job displacement. The automation of tasks threatens traditional employment structures, requiring societies to adapt through reskilling programs. Additionally, AI's decision-making processes must be transparent to avoid reinforcing societal biases.

The Road Ahead
As AI continues to advance, researchers are exploring artificial general intelligence (AGI) – a level of AI that can perform any intellectual task that a human can. While AGI remains theoretical, its potential raises questions about human-AI coexistence. Collaboration between policymakers, researchers, and industry leaders is crucial to ensuring AI's development benefits humanity while addressing its risks.
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
