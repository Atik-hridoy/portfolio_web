class PersonalInfo {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String location;
  final String bio;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.location,
    required this.bio,
  });

  static PersonalInfo get sampleData => PersonalInfo(
        name: "Atika",
        title: "Flutter Developer",
        email: "atika@example.com",
        phone: "+8801XXXXXXXXX",
        location: "Dhaka, Bangladesh",
        bio: "Passionate about building amazing mobile apps with Flutter.",
      );
}
