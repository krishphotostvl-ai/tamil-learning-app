import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(const TamilApp());
}

class TamilApp extends StatelessWidget {
  const TamilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4th Std Tamil Fun Learning',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Roboto',
      ),
      home: const MainTermScreen(),
    );
  }
}

// 1. பருவங்கள் திரை (Main Terms Screen)
class MainTermScreen extends StatelessWidget {
  const MainTermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4-ஆம் வகுப்பு - தமிழ்',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFFFF9C4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTermButton(context, '📚 பருவம் 1 (Term 1)',
                    Colors.grey.shade400, null),
                _buildTermButton(context, '🌟 பருவம் 2 (Term 2)',
                    Colors.orangeAccent, const SubjectsScreen()),
                _buildTermButton(context, '📚 பருவம் 3 (Term 3)',
                    Colors.grey.shade400, null),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTermButton(
      BuildContext context, String title, Color color, Widget? nextPage) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 5,
        ),
        onPressed: () {
          if (nextPage != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('இந்த பருவம் விரைவில் அப்டேட் செய்யப்படும்!')),
            );
          }
        },
        child: Text(title,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// 2. பாடங்கள் திரை (Subjects Screen)
class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('பருவம் 2 - பாடங்கள்'),
          backgroundColor: Colors.orangeAccent),
      body: Container(
        color: const Color(0xFFF3E5F5),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildSubjectCard(
                context, '📘 தமிழ்', Colors.teal, const LessonListScreen()),
            _buildSubjectCard(context, '📙 ஆங்கிலம்', Colors.blue, null),
            _buildSubjectCard(context, '🟢 கணிதம்', Colors.green, null),
            _buildSubjectCard(context, '🟣 சூழ்நிலையியல்', Colors.purple, null),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(
      BuildContext context, String title, Color color, Widget? nextPage) {
    return Card(
      color: color,
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        title: Text(title,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 28),
        onTap: () {
          if (nextPage != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('விரைவில் அப்டேட் செய்யப்படும்!')),
            );
          }
        },
      ),
    );
  }
}

// 3. வண்ணமயமான தமிழ் பொருளடக்கம் (Colorful Index Screen)
class LessonListScreen extends StatelessWidget {
  const LessonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('தமிழ் - பொருளடக்கம்'),
          backgroundColor: Colors.teal),
      body: Container(
        color: const Color(0xFFE8F5E9),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildColorfulLessonTile(context, '1. காவல்காரர்',
                const Color(0xFFFF7043), const LessonInteractiveScreen()),
            _buildColorfulLessonTile(
                context, '2. யானையும் பானையும்', const Color(0xFF66BB6A), null),
            _buildColorfulLessonTile(
                context, '3. பனிமலைப் பயணம்', const Color(0xFF42A5F5), null),
            _buildColorfulLessonTile(context, '4. உள்ளங்கையில் ஓர் உலகம்',
                const Color(0xFFFFB74D), null),
            _buildColorfulLessonTile(context, '5. எழில் கொஞ்சும் அருவி',
                const Color(0xFF9CCC65), null),
            _buildColorfulLessonTile(
                context, '6. அன்பின் வழி', const Color(0xFF8D6E63), null),
            _buildColorfulLessonTile(
                context, '7. நன்னெறி', const Color(0xFF26C6DA), null),
            _buildColorfulLessonTile(
                context, '8. அகர முதலி', const Color(0xFFBDBDBD), null),
          ],
        ),
      ),
    );
  }

  Widget _buildColorfulLessonTile(
      BuildContext context, String title, Color color, Widget? nextPage) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 4,
        ),
        onPressed: () {
          if (nextPage != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('இந்த பாடம் விரைவில் அப்டேட் செய்யப்படும்!')),
            );
          }
        },
        child: Text(title,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// 4. இன்டராக்டிவ் வண்ணமயமான பயிற்சித் திரை (PageView)
class LessonInteractiveScreen extends StatefulWidget {
  const LessonInteractiveScreen({super.key});

  @override
  State<LessonInteractiveScreen> createState() =>
      _LessonInteractiveScreenState();
}

class _LessonInteractiveScreenState extends State<LessonInteractiveScreen> {
  final PageController _pageController = PageController();
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("ta-IN");
  }

  void _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('1. காவல்காரர் - பயிற்சிகள்'),
          backgroundColor: const Color(0xFFFF7043)),
      body: PageView(
        controller: _pageController,
        children: [
          // பக்கம் 1: பொருள் தருக
          ColorfulExercisePage(
            title: '📖 பொருள் தருக',
            themeColor: Colors.deepOrange,
            bgColor: const Color(0xFFFFF3E0),
            speakFunc: _speak,
            questions: const [
              {'q': 'நேர்த்தியான', 'a': 'சீரான'},
              {'q': 'நித்தமும்', 'a': 'நாள்தோறும்'},
              {'q': 'உலவுதல்', 'a': 'நடமாடுதல்'},
              {'q': 'ஆவல்', 'a': 'விருப்பம்'},
              {'q': 'கழற்றி', 'a': 'நீக்கி'},
            ],
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease),
          ),
          // பக்கம் 2: பிரித்து எழுதுக
          ColorfulExercisePage(
            title: '✂️ பிரித்து எழுதுக',
            themeColor: Colors.purple,
            bgColor: const Color(0xFFF3E5F5),
            speakFunc: _speak,
            questions: const [
              {'q': 'பெயரில்லாத', 'a': 'பெயர் + இல்லாத'},
              {'q': 'வாழையிலை', 'a': 'வாழை + இலை'},
              {'q': 'காவல்காரர்', 'a': 'காவல் + காரர்'},
              {'q': 'பயமில்லாமல்', 'a': 'பயம் + இல்லாமல்'},
              {'q': 'ஆடைஅணிந்து', 'a': 'ஆடை + அணிந்து'},
            ],
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease),
          ),
          // பக்கம் 3: சேர்த்து எழுதுக
          ColorfulExercisePage(
            title: '🧩 சேர்த்து எழுதுக',
            themeColor: Colors.teal,
            bgColor: const Color(0xFFE0F2F1),
            speakFunc: _speak,
            questions: const [
              {'q': 'அசைய + இல்லை', 'a': 'அசையவில்லை'},
              {'q': 'பயம் + இல்லை', 'a': 'பயமில்லை'},
              {'q': 'பூ + காய்', 'a': 'பூக்காய்'},
              {'q': 'காவல் + காப்பார்', 'a': 'காவல்காப்பார்'},
              {'q': 'காகம் + ஒன்று', 'a': 'காகமொன்று'},
            ],
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease),
          ),
          // பக்கம் 4: எதிர்ச்சொல்
          ColorfulExercisePage(
            title: '↔️ எதிர்ச்சொல்',
            themeColor: Colors.indigo,
            bgColor: const Color(0xFFE8EAF6),
            speakFunc: _speak,
            questions: const [
              {'q': 'மேலே', 'a': 'கீழே'},
              {'q': 'அருகில்', 'a': 'தொலைவில்'},
              {'q': 'இரவும்', 'a': 'பகலும்'},
              {'q': 'பழைய', 'a': 'புதிய'},
              {'q': 'பலவகை', 'a': 'சிலவகை'},
            ],
            onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease),
          ),
          // பக்கம் 5: வினா - விடை
          ColorfulExercisePage(
            title: '❓ வினா - விடை',
            themeColor: Colors.pink,
            bgColor: const Color(0xFFFCE4EC),
            speakFunc: _speak,
            questions: const [
              {
                'q': 'தோட்டத்தின் நடுவே காவல்காரர் எப்படி நின்றிருந்தார்?',
                'a': 'ராஜா போலே நின்றிருந்தார்'
              },
              {
                'q': 'காவல்காரர் எவ்வாறு காவல் காத்தார்?',
                'a': 'தூங்காமல் காவல் காத்தார்'
              },
              {
                'q': 'பொம்மைக்குக் காகம் என்னென்ன கொடுத்தது?',
                'a': 'கோட்டு மற்றும் சட்டை'
              },
              {
                'q': 'காகம் கொடுத்த ஆடைகளை காவல்காரர் ஏன் அணியவில்லை?',
                'a': 'உயிர் இல்லாத பொம்மை என்பதால்'
              },
              {
                'q': 'காவல்காரர் சட்டையின் மேல் என்ன மாட்டியிருந்தார்?',
                'a': 'கருப்புக் கோட்டு'
              },
            ],
            onNext: null,
          ),
        ],
      ),
    );
  }
}

// 5. வண்ணமயமான பொதுப் பயிற்சி Widget
class ColorfulExercisePage extends StatefulWidget {
  final String title;
  final Color themeColor;
  final Color bgColor;
  final List<Map<String, String>> questions;
  final Function(String) speakFunc;
  final VoidCallback? onNext;

  const ColorfulExercisePage({
    super.key,
    required this.title,
    required this.themeColor,
    required this.bgColor,
    required this.questions,
    required this.speakFunc,
    this.onNext,
  });

  @override
  State<ColorfulExercisePage> createState() => _ColorfulExercisePageState();
}

class _ColorfulExercisePageState extends State<ColorfulExercisePage> {
  final Map<int, TextEditingController> _controllers = {};
  final Map<int, bool> _results = {};
  late stt.SpeechToText _speech;
  bool _isListening = false;
  int _activeVoiceIndex = -1;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    for (int i = 0; i < widget.questions.length; i++) {
      _controllers[i] = TextEditingController();
    }
  }

  void _listenVoice(int index) async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() {
          _isListening = true;
          _activeVoiceIndex = index;
        });
        _speech.listen(
          localeId: 'ta_IN',
          onResult: (val) {
            setState(() {
              _controllers[index]!.text = val.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _activeVoiceIndex = -1;
      });
      _speech.stop();
    }
  }

  void _checkAnswer(int index) {
    String userInput = _controllers[index]!.text.trim().replaceAll(' ', '');
    String correctAnswer = widget.questions[index]['a']!.replaceAll(' ', '');

    if (userInput.contains(correctAnswer) ||
        correctAnswer.contains(userInput)) {
      setState(() {
        _results[index] = true;
      });
      widget.speakFunc(
          "சரி! ${widget.questions[index]['q']} - ${widget.questions[index]['a']}");
    } else {
      setState(() {
        _results[index] = false;
      });
      widget.speakFunc("தவறு! மீண்டும் முயற்சிக்கவும்.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: widget.themeColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: widget.questions.length,
              itemBuilder: (indexContext, index) {
                var item = widget.questions[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.volume_up,
                                  color: widget.themeColor, size: 30),
                              onPressed: () => widget.speakFunc(item['q']!),
                            ),
                            Expanded(
                              child: Text(
                                "${index + 1}. ${item['q']} - ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: widget.themeColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controllers[index],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                                decoration: InputDecoration(
                                  hintText: 'டைப் செய்யவும் அல்லது பேசவும்...',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: widget.themeColor),
                                  ),
                                  suffixIcon: _results[index] == true
                                      ? const Icon(Icons.check_circle,
                                          color: Colors.green, size: 28)
                                      : _results[index] == false
                                          ? const Icon(Icons.cancel,
                                              color: Colors.red, size: 28)
                                          : null,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            IconButton(
                              icon: Icon(
                                _isListening && _activeVoiceIndex == index
                                    ? Icons.mic
                                    : Icons.mic_none,
                                color:
                                    _isListening && _activeVoiceIndex == index
                                        ? Colors.red
                                        : widget.themeColor,
                                size: 28,
                              ),
                              onPressed: () => _listenVoice(index),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: widget.themeColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () => _checkAnswer(index),
                              child: const Text('சரி',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.onNext != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.themeColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  elevation: 5,
                ),
                onPressed: widget.onNext,
                child: const Text('அடுத்த பயிற்சி ➔',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }
}
