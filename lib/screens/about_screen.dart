import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with TickerProviderStateMixin {
  Color get background => const Color(0xFF0F111A);
  Color get codeText => const Color(0xFFD6DEEB);
  Color get commentColor => const Color(0xFF546E7A);
  Color get sectionColor => const Color(0xFFF07178);
  Color get accentColor => const Color(0xFF82AAFF);
  Color get checkboxColor => const Color(0xFF51576D);
  Color get boxColor => const Color(0xFF1A1C25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title:
            Text('_about-me', style: GoogleFonts.firaCode(color: sectionColor)),
        elevation: 0,
      ),
      body: Stack(
        children: [
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                baseColor: Colors.blueAccent.withOpacity(0.2),
                spawnOpacity: 0.0,
                opacityChangeRate: 0.25,
                minOpacity: 0.1,
                maxOpacity: 0.3,
                spawnMinSpeed: 30.0,
                spawnMaxSpeed: 70.0,
                spawnMinRadius: 2.0,
                spawnMaxRadius: 6.0,
                particleCount: 80,
              ),
            ),
            vsync: this,
            child: const SizedBox.expand(),
          ),

          // Split layout
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  // Left Panel
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: _boxDecoration(),
                        padding: const EdgeInsets.all(16),
                        child: DefaultTextStyle(
                          style: GoogleFonts.firaCode(
                              color: codeText, fontSize: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('/*', style: TextStyle(color: commentColor)),
                              const SizedBox(height: 8),
                              Text(' * About Atik Hridoy'),
                              Text(' * Welcome to my portfolio.'),
                              const SizedBox(height: 8),
                              _line('[Background]',
                                  'Cross-platform developer with a passion for building smooth and efficient mobile/web experiences.'),
                              _line('[Expertise]',
                                  'Focused on Flutter, Dart, Django, and backend integration with REST APIs.'),
                              _line('[Learning Path]',
                                  'Started programming in early 2023 and continuously sharpening my skills with real-world projects.'),
                              const SizedBox(height: 8),
                              Text(
                                  ' * I love writing clean and readable code,'),
                              Text(' * building apps with great UX/UI,'),
                              Text(
                                  ' * and experimenting with animations and state management.'),
                              const SizedBox(height: 8),
                              _line('[Mindset]',
                                  'Curious, team-oriented, and solution-driven — I believe every problem has a clean fix.'),
                              const SizedBox(height: 8),
                              Text(
                                  ' * My mission is to deliver tech that makes life simpler.'),
                              Text(
                                  ' * Let\'s build something awesome together!'),
                              const SizedBox(height: 8),
                              Text(' */',
                                  style: TextStyle(color: commentColor)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Right Panel
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: _boxDecoration(),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '// Programming languages I have learned or am learning',
                                style:
                                    GoogleFonts.firaCode(color: commentColor)),
                            const SizedBox(height: 10),
                            _checkboxBlock([
                              'FLUTTER',
                              'DART',
                              'DJANGO',
                              'PYTHON',
                              'Typescript',
                              'Node',
                              'SASS',
                              'Git'
                            ]),
                            const SizedBox(height: 20),
                            Text('// Operating System and other programs',
                                style:
                                    GoogleFonts.firaCode(color: commentColor)),
                            const SizedBox(height: 10),
                            _checkboxBlock([
                              'Windows',
                              'Linux',
                              'Adobe Suite',
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: boxColor.withOpacity(0.85),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: checkboxColor),
    );
  }

  Widget _line(String label, String text) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.firaCode(color: codeText, fontSize: 14),
        children: [
          const TextSpan(text: ' * '),
          TextSpan(text: label, style: TextStyle(color: sectionColor)),
          TextSpan(text: ' $text'),
        ],
      ),
    );
  }

  Widget _checkboxBlock(List<String> items) {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: items.map((item) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_box, color: accentColor, size: 16),
            const SizedBox(width: 4),
            Text(item, style: GoogleFonts.firaCode(color: codeText)),
          ],
        );
      }).toList(),
    );
  }
}
