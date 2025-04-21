import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math';
import 'projects_screen.dart';

class WaveBackground extends StatefulWidget {
  const WaveBackground({Key? key}) : super(key: key);

  @override
  _WaveBackgroundState createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<WaveBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WavePainter(_controller.value),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final double waveOffset;

  WavePainter(this.waveOffset);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final Path path = Path();
    for (double i = 0; i <= size.width; i++) {
      final y =
          sin((i / 180 * pi) + (waveOffset * 2 * pi)) * 30 + size.height / 2;
      if (i == 0) {
        path.moveTo(i, y);
      } else {
        path.lineTo(i, y);
      }
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

const String portfolioName = "Atikportfolio";

const String homeScreenBio = '''
I'm a passionate developer who loves building clean, responsive, and user-centric apps. I specialize in cross-platform mobile and web development using Flutter and Django.

🔧 Tools I use: Python, Django, Flutter, Dart, MySQL, Firebase, Git, REST APIs  
🎯 Focused on: Real-world projects, app optimization, and seamless user experience  
🌍 Open to freelance and full-time opportunities  

Explore my projects and let’s connect!
''';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Color get background => const Color(0xFF0F111A);
  Color get sectionColor => const Color(0xFFF07178);
  Color get textColor => const Color(0xFFD6DEEB);
  Color get hoverColor => const Color(0xFF1F2233);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          const WaveBackground(),
          Column(
            children: [
              // --- NAV BAR ---
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    _NavTab(label: '_home', isSelected: true, onTap: () {}),
                    const SizedBox(width: 16),
                    _NavTab(
                        label: '_about-me',
                        isSelected: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/about');
                        }),
                    const SizedBox(width: 16),
                    _NavTab(
                        label: '_projects',
                        isSelected: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/projects');
                        }),
                    const SizedBox(width: 16),
                    _NavTab(
                        label: '_contact',
                        isSelected: false,
                        onTap: () {
                          Navigator.pushNamed(context, '/contact');
                        }),
                  ],
                ),
              ),

              const Spacer(),

              // --- CENTERED BOX CONTENT ---
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Welcome to $portfolioName!',
                            textStyle: GoogleFonts.firaCode(
                              color: sectionColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 50),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                      const SizedBox(height: 12),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            "Hi, I'm Atik 👋",
                            textStyle: GoogleFonts.firaCode(
                              color: textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 50),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 500),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        homeScreenBio,
                        style: GoogleFonts.firaCode(
                          color: textColor.withOpacity(0.9),
                          fontSize: 14,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _NavTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      hoverColor: hoverColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? background : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: GoogleFonts.firaCode(
            color: isSelected ? sectionColor : textColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
