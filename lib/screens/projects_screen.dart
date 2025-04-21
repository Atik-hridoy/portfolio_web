import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int selectedIndex = 0;

  Color get background => const Color(0xFF1E1F28);
  Color get sidebarColor => const Color(0xFF0F111A);
  Color get accentColor => const Color(0xFF64FFDA);
  Color get textColor => const Color(0xFFABB2BF);
  Color get commentColor => const Color(0xFF5C6370);
  Color get keywordColor => const Color(0xFFc678dd);
  Color get valueColor => const Color(0xFF98c379);

  final List<Project> projects = [
    Project(
      name: 'Kontho',
      description:
          'AI-based music generator app that creates personalized music from lyrics.',
      detailedDescription:
          '''Kontho is an innovative AI-based mobile application that takes a user-provided set of lyrics and generates personalized music. It utilizes AI to analyze the tone of the input and harmonizes the voice with the generated music, creating a custom track based on the user's input.''',
      techStack: 'Flutter, Dart, Python',
      role: 'Full-stack Developer',
      githubLink: 'https://github.com/yourusername/kontho',
      demoLink: 'https://yourappdemo.com/kontho',
    ),
    Project(
      name: 'SkillShare',
      description:
          'Platform for programming & study materials connecting instructors and learners.',
      detailedDescription:
          '''SkillShare is a platform that allows instructors to create and share study materials for programming and other technical skills. The app provides interactive learning experiences for users, allowing them to take courses and track their progress in real time.''',
      techStack: 'Flutter, Firebase',
      role: 'Lead UI/UX Developer',
      githubLink: 'https://github.com/yourusername/skill-share',
      demoLink: 'https://yourappdemo.com/skillshare',
    ),
    Project(
      name: 'FreshMind',
      description:
          'Fitness app with daily quotes, mood tracking, and habit formation.',
      detailedDescription:
          '''FreshMind is a fitness-focused mobile application designed to help users track their physical and mental well-being. It includes features like mood tracking, daily motivational quotes, and habit formation tools to help users build a consistent and healthy routine.''',
      techStack: 'Django, Python',
      role: 'Full-stack Developer',
      githubLink: 'https://github.com/yourusername/fresh-mind',
      demoLink: 'https://yourappdemo.com/freshmind',
    ),
    Project(
      name: 'EcoTracker',
      description:
          'App to track and reduce environmental footprint with real-time data syncing.',
      detailedDescription:
          '''EcoTracker helps users monitor their environmental impact by providing data on energy usage, carbon footprint, and waste generation. The app helps users make informed decisions to reduce their ecological footprint and live sustainably.''',
      techStack: 'Flutter, Firebase',
      role: 'Developer & Data Analyst',
      githubLink: 'https://github.com/yourusername/eco-tracker',
      demoLink: 'https://yourappdemo.com/ecotracker',
    ),
    Project(
      name: 'WeatherApp',
      description:
          'Real-time weather forecasting app with location-based services and weather maps.',
      detailedDescription:
          '''WeatherApp provides real-time weather forecasts, including temperature, humidity, wind speed, and more. It uses location-based services to provide accurate data for the user’s current location or any selected city. The app also features weather maps for tracking severe weather events.''',
      techStack: 'Flutter, OpenWeather API',
      role: 'Developer & UI Designer',
      githubLink: 'https://github.com/yourusername/weather-app',
      demoLink: 'https://yourappdemo.com/weatherapp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 240,
            decoration: BoxDecoration(
              color: sidebarColor,
              border: Border(
                right:
                    BorderSide(color: accentColor.withOpacity(0.3), width: 1.5),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back to Home
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new,
                          color: accentColor, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Home',
                        style: GoogleFonts.firaCode(
                          color: accentColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  '> _projects',
                  style: GoogleFonts.firaCode(
                    fontSize: 16,
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? accentColor.withOpacity(0.2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                selectedIndex == index
                                    ? Icons.folder_open
                                    : Icons.folder,
                                size: 20,
                                color: accentColor,
                              ),
                              const SizedBox(
                                  width:
                                      8), // Reduced space between icon and name
                              Expanded(
                                child: Text(
                                  project.name,
                                  style: GoogleFonts.firaCode(
                                    color: textColor,
                                    fontSize: 13,
                                  ),
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

          // Code Viewer
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: CodeWindow(
                project: projects[selectedIndex],
                accentColor: accentColor,
                commentColor: commentColor,
                textColor: textColor,
                keywordColor: keywordColor,
                valueColor: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String name;
  final String description;
  final String detailedDescription;
  final String techStack;
  final String role;
  final String githubLink;
  final String demoLink;

  Project({
    required this.name,
    required this.description,
    required this.detailedDescription,
    required this.techStack,
    required this.role,
    required this.githubLink,
    required this.demoLink,
  });
}

class CodeWindow extends StatelessWidget {
  final Project project;
  final Color accentColor;
  final Color commentColor;
  final Color textColor;
  final Color keywordColor;
  final Color valueColor;

  const CodeWindow({
    super.key,
    required this.project,
    required this.accentColor,
    required this.commentColor,
    required this.textColor,
    required this.keywordColor,
    required this.valueColor,
  });

  Widget _codeLine(int lineNumber, String code, Color color) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: lineNumber.toString().padLeft(2) + '  ',
            style: GoogleFonts.firaCode(fontSize: 14, color: commentColor),
          ),
          TextSpan(
            text: code,
            style: GoogleFonts.firaCode(fontSize: 14, color: color),
          ),
        ],
      ),
    );
  }

  Widget _windowDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D3038),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Window Header
          Container(
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF1E1F28),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const SizedBox(width: 4),
                _windowDot(Colors.red),
                const SizedBox(width: 6),
                _windowDot(Colors.yellow),
                const SizedBox(width: 6),
                _windowDot(Colors.green),
                const SizedBox(width: 16),
                Text(
                  "${project.name}.dart",
                  style: GoogleFonts.firaCode(
                    color: textColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Code Area
          Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _codeLine(1, 'class ${project.name} {', keywordColor),
                    _codeLine(2, '  description: "${project.description}",',
                        valueColor),
                    _codeLine(
                        3, '  techStack: "${project.techStack}",', valueColor),
                    _codeLine(4, '  role: "${project.role}",', valueColor),
                    _codeLine(5, '  githubLink: "${project.githubLink}",',
                        valueColor),
                    _codeLine(
                        6, '  demoLink: "${project.demoLink}",', valueColor),
                    _codeLine(7, '}', keywordColor),
                    const SizedBox(height: 20),
                    _codeLine(8, '// Detailed Description:', commentColor),
                    _codeLine(9, project.detailedDescription, textColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
