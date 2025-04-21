import 'package:atikportfolio/data/personal_info.dart';

class Project {
  final String name;
  final String description;
  final String techStack;
  final String role;
  final String githubLink;
  final String demoLink;

  Project({
    required this.name,
    required this.description,
    required this.techStack,
    required this.role,
    required this.githubLink,
    required this.demoLink,
  });

  static List<Project> get sampleProjects => [
        Project(
          name: 'Kontho',
          description:
              'AI-based music generator app that creates personalized music from lyrics.',
          techStack: 'Flutter, Dart, Python',
          role: 'Full-stack Developer',
          githubLink: 'https://github.com/yourusername/kontho',
          demoLink: 'https://yourappdemo.com/kontho',
        ),
        Project(
          name: 'SkillShare',
          description:
              'Platform for programming & study materials connecting instructors and learners.',
          techStack: 'Flutter, Firebase',
          role: 'Lead UI/UX Developer',
          githubLink: 'https://github.com/yourusername/skill-share',
          demoLink: 'https://yourappdemo.com/skillshare',
        ),
        Project(
          name: 'FreshMind',
          description:
              'Fitness app with daily quotes, mood tracking, and habit formation.',
          techStack: 'Django, Python',
          role: 'Full-stack Developer',
          githubLink: 'https://github.com/yourusername/fresh-mind',
          demoLink: 'https://yourappdemo.com/freshmind',
        ),
        Project(
          name: 'EcoTracker',
          description:
              'App to track and reduce environmental footprint with real-time data syncing.',
          techStack: 'Flutter, Firebase',
          role: 'Developer & Data Analyst',
          githubLink: 'https://github.com/yourusername/eco-tracker',
          demoLink: 'https://yourappdemo.com/ecotracker',
        ),
        Project(
          name: 'WeatherApp',
          description:
              'Real-time weather forecasting app with location-based services and weather maps.',
          techStack: 'Flutter, OpenWeather API',
          role: 'Developer & UI Designer',
          githubLink: 'https://github.com/yourusername/weather-app',
          demoLink: 'https://yourappdemo.com/weatherapp',
        ),
      ];
}
