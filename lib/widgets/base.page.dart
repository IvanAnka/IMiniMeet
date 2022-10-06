import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:i18n_extension/i18n_widget.dart';

class BasePage extends StatefulWidget {
  final bool showAppBar;
  final bool showLeadingAction;
  final String title;
  final Widget body;
  BasePage({
    this.showAppBar = false,
    this.showLeadingAction = false,
    this.title = "",
    this.body,
    Key key,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          I18n.language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: widget.showAppBar
            ? AppBar(
                automaticallyImplyLeading: widget.showLeadingAction,
                leading: widget.showLeadingAction
                    ? IconButton(
                        icon: Icon(
                          FlutterIcons.arrow_left_fea,
                        ),
                        onPressed: () => Navigator.pop(context),
                      )
                    : null,
                title: Text(
                  widget.title,
                ),
              )
            : null,
        body: widget.body,
      ),
    );
  }
}
