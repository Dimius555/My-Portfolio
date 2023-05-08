import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/views/widgets/custom/custom_app_bar.dart';

part 'components/skill_component.dart';
part 'components/skills_section_component.dart';
part 'components/explanation_component.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  // final List<SkillModel> programmingLanguagesSkills = [
  //   SkillModel(id: 1, name: 'Swift', level: .95),
  //   SkillModel(id: 2, name: 'Dart', level: .95),
  //   SkillModel(id: 3, name: 'Kotlin', level: .7),
  //   SkillModel(id: 4, name: 'C#', level: .6),
  //   SkillModel(id: 5, name: 'JavaScript', level: .6),
  //   SkillModel(id: 6, name: 'Python', level: .6),
  //   SkillModel(id: 7, name: 'Objective-C', level: .5),
  //   SkillModel(id: 8, name: 'HTML/CSS', level: .5),
  // ];

  // final List<SkillModel> frameworksSkills = [
  //   SkillModel(id: 9, name: 'Flutter for mobile', level: .9),
  //   SkillModel(id: 10, name: 'Flutter for web', level: .75),
  //   SkillModel(id: 11, name: 'UIKit (iOS)', level: .75),
  //   SkillModel(id: 12, name: 'SwiftUI', level: .80),
  //   SkillModel(id: 13, name: 'Firebase SDK', level: .9),
  //   SkillModel(id: 14, name: 'Google SDK', level: .70),
  //   SkillModel(id: 15, name: 'AppWrites', level: .60),
  //   SkillModel(id: 16, name: 'ASP.NET', level: .50),
  // ];

  // final List<SkillModel> architecturesSkills = [
  //   SkillModel(id: 23, name: 'MVC', level: .9),
  //   SkillModel(id: 24, name: 'MVP', level: .9),
  //   SkillModel(id: 25, name: 'MVVM', level: .9),
  //   SkillModel(id: 26, name: 'Clean Architecture', level: .90),
  //   SkillModel(id: 27, name: 'Clean Swift', level: .7),
  //   SkillModel(id: 28, name: 'VIPER', level: .7),
  // ];

  // final List<SkillModel> ideSkills = [
  //   SkillModel(id: 17, name: 'XCode', level: .90),
  //   SkillModel(id: 18, name: 'Android Studio', level: .75),
  //   SkillModel(id: 19, name: 'VS Code', level: .90),
  //   SkillModel(id: 20, name: 'MS Visual Studio', level: .6),
  //   SkillModel(id: 21, name: 'GitHub', level: .9),
  //   SkillModel(id: 22, name: 'GitLab', level: .9),
  // ];

  // final List<SkillModel> languagesSkills = [
  //   SkillModel(id: 29, name: 'Українська (рідна)', level: 1),
  //   SkillModel(id: 30, name: 'Русский (родной)', level: 1),
  //   SkillModel(id: 31, name: 'English (C1)', level: .9),
  //   SkillModel(id: 32, name: 'Español (B1)', level: .6),
  //   SkillModel(id: 33, name: '汉语 (HSK1)', level: .166),
  // ];

  // final List<SkillModel> csSkills = [
  //   SkillModel(id: 34, name: 'Computer knowledge', level: 0.9),
  //   SkillModel(id: 35, name: 'Binary algebra', level: 0.9),
  //   SkillModel(id: 36, name: 'Data types', level: .9),
  //   SkillModel(id: 37, name: 'Data Structures', level: .75),
  //   SkillModel(id: 38, name: 'Graphs', level: .5),
  //   SkillModel(id: 39, name: 'Boolean algebra', level: .9),
  //   SkillModel(id: 40, name: 'Big-O notation', level: .6),
  //   SkillModel(id: 41, name: 'Search algorithms', level: .4),
  //   SkillModel(id: 42, name: 'Sorting algorithms', level: .4),
  //   SkillModel(id: 43, name: 'Shortest pathes algorithms', level: .4),
  //   SkillModel(id: 44, name: 'Backtracking algorithms', level: .4),
  //   SkillModel(id: 45, name: 'Networking', level: .7),
  //   SkillModel(id: 45, name: 'System design', level: .65),
  // ];

  // final List<SkillModel> pricipalsSkills = [
  //   SkillModel(id: 45, name: 'Declarative programing', level: .9),
  //   SkillModel(id: 46, name: 'Imperative programing', level: .9),
  //   SkillModel(id: 47, name: 'Functional programing', level: .9),
  //   SkillModel(id: 48, name: 'Async programing', level: .8, info: 'Depending on language'),
  //   SkillModel(id: 49, name: 'REST', level: .95),
  //   SkillModel(id: 49, name: 'GraphQL', level: .6),
  //   SkillModel(id: 49, name: 'OOP', level: 1),
  //   SkillModel(id: 50, name: 'SOLID', level: 1),
  //   SkillModel(id: 51, name: 'DRY', level: 1),
  //   SkillModel(id: 52, name: 'KISS', level: 1),
  //   SkillModel(id: 53, name: 'TDD', level: .8),
  //   SkillModel(id: 54, name: 'DDD', level: .9),
  // ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: size.width > AppConstants.mobileModeBorderWidth
                  ? EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 16.0)
                  : EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // _SkillsSectionComponent(
                  //   skills: programmingLanguagesSkills,
                  //   title: 'Programming languages',
                  //   tooltip:
                  //       'This section represents my knowledges of certain programming language,\nknowledges of its capabilities and my experience on working with this language.',
                  // ),
                  // _SkillsSectionComponent(
                  //   skills: frameworksSkills,
                  //   title: 'Frameworks & SDKs',
                  //   tooltip: 'This section provides you information about some featured  (but not all) of frameworks and SDKs that I had been working with.',
                  // ),
                  // _SkillsSectionComponent(
                  //   skills: architecturesSkills,
                  //   title: 'Architectures',
                  //   tooltip: 'This section describes my knowledges and experience of work with different mobile and web architectures.',
                  // ),
                  // _SkillsSectionComponent(
                  //   skills: languagesSkills,
                  //   isOnlyMobile: true,
                  //   title: 'Languages',
                  //   tooltip: 'This section shows my knowledges of languages',
                  // ),
                  // _SkillsSectionComponent(
                  //   skills: ideSkills,
                  //   title: 'IDEs & Tools',
                  //   tooltip: 'This section shows my experience of work with different IDEs and tools that are requeired for development.',
                  // ),
                  // _SkillsSectionComponent(
                  //   skills: csSkills,
                  //   title: 'Computer science',
                  //   tooltip:
                  //       'This section shows my knowledges of computer science section.\nScince this section is very big I will not know everything, but I am try to do and know my best.',
                  // ),
                  // _SkillsSectionComponent(
                  //   skills: pricipalsSkills,
                  //   title: 'Programming principles',
                  //   tooltip: 'This sectin shows my knowledges and understanding of programming principles.',
                  // ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            const _ExplanationComponent()
          ],
        ),
      ),
    );
  }
}
