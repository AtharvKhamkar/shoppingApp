import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UsersModelProvider = Provider.of<UsersModel>(context);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.height * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: UsersModelProvider.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
      title: Text(UsersModelProvider.name.toString()),
      subtitle: Text(UsersModelProvider.email.toString()),
      trailing: Text(
        UsersModelProvider.role.toString(),
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
