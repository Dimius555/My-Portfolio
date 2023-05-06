part of '../home_page.dart';

class _HeaderComponent extends StatelessWidget {
  const _HeaderComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Works',
                style: theme.buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Blog',
                style: theme.buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Contact',
                style: theme.buttonStyle,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 44.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi, I am John,\nCreative Technologist',
                      style: theme.header0,
                    ),
                    Text(
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                      style: theme.regular3,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const CustomAvatar(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.16, bottom: 44.0),
          child: CustomButton(onPressed: () {}, title: 'Download Resume'),
        ),
      ],
    );
  }
}
