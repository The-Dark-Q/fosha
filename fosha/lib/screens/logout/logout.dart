import 'package:flutter/material.dart';
import 'package:fosha/core/cubit/appcubit/app_cubit.dart';
import 'package:fosha/core/resources/get_it.dart';
import 'package:fosha/core/resources/routes.dart';
import 'package:fosha/services/user.dart';
import 'package:fosha/utils.dart';
import '../../core/resources/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainColor.elevatedColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 72,
                    child: Image.network(
                      AppCubit.get(context).user.image!,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(72)),
                              // color: Colors.white,
                              height: 300,
                              width: double.infinity,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      '${AppCubit.get(context).user.firstName!} ${AppCubit.get(context).user.lastName!}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColors.buttonColorWhite)),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  AppCubit.get(context).user = User();

                  instance.reset();
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.loginScreen);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.buttonColorWhite,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Logout',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// child: Stack(
//         children: [
//           Container(
//             height: MediaQuery.sizeOf(context).height * .23,
//             decoration: const BoxDecoration(
//               color: mainColor,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(13),
//                 bottomRight: Radius.circular(13),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const CircleAvatar(
//                   radius: 75,
//                   backgroundColor: AppColors.backGroundColorLightMode,
//                   child: CircleAvatar(
//                     radius: 72,
//                     backgroundImage: AssetImage("assets/images/2.png"),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(userDetails.EMPNM,
//                     style: Theme.of(context).textTheme.headlineMedium!),
//               ],
//             ),
//           ),
//         ],
//       ),
