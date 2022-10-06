import 'package:flutter/material.dart';
import 'package:meetup/constants/app_images.dart';
import 'package:meetup/widgets/buttons/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:meetup/translations/empty.i18n.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key key,
    this.imageUrl,
    this.title = "",
    this.actionText = "Action",
    this.description = "",
    this.showAction = false,
    this.actionPressed,
    this.auth = false,
  }) : super(key: key);

  final String title;
  final String actionText;
  final String description;
  final String imageUrl;
  final Function actionPressed;
  final bool showAction;
  final bool auth;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        //
        Image.asset(
          imageUrl ?? AppImages.user,
        )
            .wh(
              Vx.dp64 * 2,
              Vx.dp64 * 2,
            )
            .box
            .makeCentered()
            .wFull(context),

        //
        title.isNotEmpty
            ? title.text.xl.semiBold.center.makeCentered()
            : SizedBox.shrink(),

        //
        auth
            ? "You have to login to access profile and history"
                .i18n
                .text
                .center
                .lg
                .light
                .makeCentered()
            : description.isNotEmpty
                ? description.text.lg.light.makeCentered()
                : SizedBox.shrink(),

        //
        auth
            ? CustomButton(
                title: "Login".i18n,
                onPressed: actionPressed,
              ).centered()
            : showAction
                ? CustomButton(
                    title: actionText,
                    onPressed: actionPressed,
                  ).centered()
                : SizedBox.shrink(),
      ],
    );
  }
}
