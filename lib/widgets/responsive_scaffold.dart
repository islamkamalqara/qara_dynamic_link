import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:web_firebase_app/widgets/app_colors.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    Key? key,
    this.scaffoldKey,
    this.drawer,
    this.header,
    this.headerHeight,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.menuButtonColor = Colors.red,
    this.title,
    this.forceMenuButton = false,
  }) : super(key: key);

  final Key? scaffoldKey;

  final Widget? drawer;
  final Widget? header;
  final double? headerHeight;

  final AppBar? appBar;

  final Widget? body;

  final Color? backgroundColor;
  final Color menuButtonColor;

  final Widget? bottomNavigationBar;

  final Widget? floatingActionButton;
  final String? title;
  final bool forceMenuButton;

  double get _drawerWidth => 231;

  // double get _kTabletBreakpoint => 720.0;

  // double get _kDesktopBreakpoint => 1440.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (Breakpoints.large.isActive(context) && !forceMenuButton) {
          return Title(
            title: title ?? '',
            color: Colors.red,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: backgroundColor,
              appBar: drawer == null
                  ? appBar
                  : AppBar(
                      toolbarHeight: headerHeight,
                      backgroundColor: backgroundColor,
                      elevation: 1,
                      automaticallyImplyLeading: false,
                      flexibleSpace: header,
                    ),
              floatingActionButton: floatingActionButton,
              body: SafeArea(
                right: false,
                bottom: false,
                child: Row(
                  children: [
                    if (drawer != null)
                      SizedBox(
                        width: _drawerWidth,
                        child: Drawer(
                          child: SafeArea(
                            child: drawer!,
                          ),
                        ),
                      ),
                    Expanded(
                      child: body ?? Container(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (Breakpoints.medium.isActive(context) || forceMenuButton) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: backgroundColor,
            floatingActionButton: floatingActionButton,
            drawer: drawer == null
                ? null
                : Drawer(
                    width: _drawerWidth,
                    child: SafeArea(
                      child: drawer!,
                    ),
                  ),
            appBar: drawer == null
                ? appBar
                : AppBar(
                    toolbarHeight: headerHeight,
                    backgroundColor: backgroundColor,
                    elevation: 1,
                    automaticallyImplyLeading: false,
                    leading: _MenuButton(
                      iconColor: menuButtonColor,
                    ),
                    flexibleSpace: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 30),
                      child: header,
                    ),
                  ),
            body: SafeArea(
              right: false,
              bottom: false,
              child: body ?? Container(),
            ),
          );
        }
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroundColor,
          floatingActionButton: floatingActionButton,
          drawer: drawer == null
              ? null
              : Drawer(
                  width: _drawerWidth,
                  child: SafeArea(
                    child: drawer!,
                  ),
                ),
          appBar: drawer == null
              ? appBar
              : AppBar(
                  toolbarHeight: headerHeight,
                  backgroundColor: backgroundColor,
                  elevation: 1,
                  automaticallyImplyLeading: false,
                  leading: _MenuButton(
                    iconColor: menuButtonColor,
                  ),
                  flexibleSpace: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 30),
                    child: header,
                  ),
                ),
          body: SafeArea(
            right: false,
            bottom: false,
            child: body ?? Container(),
          ),
        );
      },
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    Key? key,
    this.iconColor = AppColors.cherryRed,
  }) : super(key: key);

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 35,
      icon: Icon(
        Icons.menu,
        color: iconColor,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
