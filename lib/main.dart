import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yashwanth Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        cardTheme: CardThemeData(
          elevation: 3,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ------------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;

                  return isMobile
                      ? const Column(
                          children: [
                            ProfileAvatar(),
                            SizedBox(height: 24),
                            HomeIntroduction(),
                          ],
                        )
                      : const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: ProfileAvatar(),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              flex: 5,
                              child: HomeIntroduction(),
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PROFILE AVATAR
// ------------------------------------------------------------

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
        ),
        child: const CircleAvatar(
          radius: 105,
          child: Icon(
            Icons.person,
            size: 100,
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// HOME INTRODUCTION
// ------------------------------------------------------------

class HomeIntroduction extends StatelessWidget {
  const HomeIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I am',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'DAMARAMADUGU YASHWANTH',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'AI ENGINEER',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'I am a 3rd year CSE (AI & ML) student at C.R. RAO AIMSCS, '
          'Hyderabad, interested in building intelligent systems and '
          'exploring Artificial Intelligence, Robotics and Computer Vision.',
          style: TextStyle(
            fontSize: 17,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 25),

        const InfoRow(
          icon: Icons.school,
          label: 'C.R. RAO AIMSCS',
        ),
        const InfoRow(
          icon: Icons.calendar_today,
          label: '3rd Year',
        ),
        const InfoRow(
          icon: Icons.computer,
          label: 'CSE (AI & ML)',
        ),
        const InfoRow(
          icon: Icons.location_on,
          label: 'Hyderabad',
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('About Me'),
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectsPage(),
                  ),
                );
              },
              icon: const Icon(Icons.code),
              label: const Text('My Projects'),
            ),
          ],
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// INFO ROW
// ------------------------------------------------------------

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// ABOUT PAGE
// ------------------------------------------------------------

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageHeading(
                    title: 'About Me',
                    subtitle:
                        'A quick overview of my education, skills and interests.',
                  ),

                  const SizedBox(height: 20),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            icon: Icons.person,
                            title: 'Personal Information',
                          ),
                          const SizedBox(height: 18),
                          const DetailRow(
                            label: 'Name',
                            value: 'DAMARAMADUGU YASHWANTH',
                          ),
                          const DetailRow(
                            label: 'College',
                            value: 'C.R. RAO AIMSCS',
                          ),
                          const DetailRow(
                            label: 'Year',
                            value: '3rd Year',
                          ),
                          const DetailRow(
                            label: 'Branch',
                            value: 'CSE (AI & ML)',
                          ),
                          const DetailRow(
                            label: 'Location',
                            value: 'Hyderabad',
                          ),
                          const DetailRow(
                            label: 'Career Goal',
                            value: 'AI Engineer',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            icon: Icons.lightbulb,
                            title: 'My Interests',
                          ),
                          const SizedBox(height: 18),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: const [
                              SkillChip(
                                label: 'Robotics',
                                icon: Icons.smart_toy,
                              ),
                              SkillChip(
                                label: 'Computer Vision',
                                icon: Icons.visibility,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            icon: Icons.code,
                            title: 'Programming Languages',
                          ),
                          const SizedBox(height: 18),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: const [
                              SkillChip(label: 'C'),
                              SkillChip(label: 'C++'),
                              SkillChip(label: 'Python'),
                              SkillChip(label: 'Java'),
                              SkillChip(label: 'Julia'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            icon: Icons.extension,
                            title: 'Technologies & Frameworks',
                          ),
                          const SizedBox(height: 18),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: const [
                              SkillChip(label: 'Scikit-learn'),
                              SkillChip(label: 'PyTorch'),
                              SkillChip(label: 'TensorFlow'),
                              SkillChip(label: 'Hugging Face'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PROJECTS PAGE
// ------------------------------------------------------------

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Project> projects = const [
    Project(
      title: 'Motion Detection',
      description:
          'A computer vision project focused on detecting motion from visual input.',
      icon: Icons.motion_photos_on,
    ),
    Project(
      title: 'MediQA',
      description:
          'Clinical Note Synthesis project focused on generating useful '
          'summaries from clinical information.',
      icon: Icons.medical_information,
    ),
    Project(
      title: 'PharmaGuard',
      description:
          'Drug-Interaction Checker designed to help identify potential '
          'interactions between medications.',
      icon: Icons.medication,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PageHeading(
                    title: 'My Projects',
                    subtitle:
                        'Some of the projects I have worked on.',
                  ),

                  const SizedBox(height: 25),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns;

                      if (constraints.maxWidth >= 900) {
                        columns = 3;
                      } else if (constraints.maxWidth >= 600) {
                        columns = 2;
                      } else {
                        columns = 1;
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: projects.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.95,
                        ),
                        itemBuilder: (context, index) {
                          return ProjectCard(
                            project: projects[index],
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PROJECT MODEL
// ------------------------------------------------------------

class Project {
  final String title;
  final String description;
  final IconData icon;

  const Project({
    required this.title,
    required this.description,
    required this.icon,
  });
}

// ------------------------------------------------------------
// PROJECT CARD
// ------------------------------------------------------------

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                project.icon,
                size: 32,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              project.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                project.description,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// SKILL CHIP
// ------------------------------------------------------------

class SkillChip extends StatelessWidget {
  final String label;
  final IconData? icon;

  const SkillChip({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null
          ? Icon(
              icon,
              size: 18,
            )
          : null,
      label: Text(label),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
    );
  }
}

// ------------------------------------------------------------
// PAGE HEADING
// ------------------------------------------------------------

class PageHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// SECTION TITLE
// ------------------------------------------------------------

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// DETAIL ROW
// ------------------------------------------------------------

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}