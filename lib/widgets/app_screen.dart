import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'responsive_scaffold.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.title,
    this.lightStatusBar = false,
    this.actions,
    this.leading,
    this.showAppHeader = false,
    this.floatingActionButton,
    this.backgroundColor = Colors.white,
    this.header,
    this.headerHeight,
    this.drawer,
    this.forceMenuButton = false,
  }) : super(key: key);

  final Widget child;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final String? title;
  final bool lightStatusBar;
  final bool showAppHeader;

  final List<Widget>? actions;
  final Widget? leading;
  final Widget? floatingActionButton;

  final Color backgroundColor;
  final Widget? drawer;
  final Widget? header;
  final double? headerHeight;
  final bool forceMenuButton;

  @override
  Widget build(BuildContext context) {
    final uiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          lightStatusBar ? Brightness.light : Brightness.dark,
      // For Android (dark icons)
      statusBarBrightness: lightStatusBar ? Brightness.dark : Brightness.light,
      // For iOS (dark icons)
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: Colors.transparent,
      // systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          lightStatusBar ? Brightness.light : Brightness.dark,
    );

    return AnnotatedRegion(
      value: uiOverlayStyle,
      child: ResponsiveScaffold(
        backgroundColor: backgroundColor,
        title: title,
        forceMenuButton: forceMenuButton,
        body: showAppHeader
            ? Column(
                children: [
                  Expanded(child: child),
                ],
              )
            : child,
        appBar: appBar,
        drawer: drawer,
        header: header,
        headerHeight: headerHeight,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
