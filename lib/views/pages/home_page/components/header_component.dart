part of '../home_page.dart';

class _HeaderComponent extends StatelessWidget {
  const _HeaderComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: size.width > AppConstants.mobileModeBorderWidth ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        const CustomAppBar(
          showHomeButton: false,
        ),
        size.width > AppConstants.mobileModeBorderWidth
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 44.0),
                child: _webOrientation(theme),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 44.0),
                child: _mobileOrientation(theme),
              ),
        size.width > AppConstants.mobileModeBorderWidth
            ? Padding(
                padding: EdgeInsets.only(left: size.width * 0.16, bottom: 44.0),
                child: CustomButton(onPressed: () {}, title: LocaleKeys.download_resume.tr()),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: CustomButton(onPressed: () {}, title: LocaleKeys.download_resume.tr()),
              )
      ],
    );
  }

  Widget _webOrientation(AppTheme theme) {
    return Row(
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
                LocaleKeys.home_title.tr(),
                style: theme.header0,
              ),
              const SizedBox(height: 32),
              Text(
                LocaleKeys.home_header_description.tr(),
                style: theme.regular3,
              ),
            ],
          ),
        ),
        const Spacer(),
        const CustomAvatar(),
      ],
    );
  }

  Widget _mobileOrientation(AppTheme theme) {
    return Column(
      children: [
        const CustomAvatar(),
        const SizedBox(height: 32),
        Text(
          LocaleKeys.home_title.tr(),
          style: theme.header1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Text(
          LocaleKeys.home_header_description.tr(),
          style: theme.regular4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
