import 'package:flutter/material.dart';
import 'package:fosha/core/resources/app_colors.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({super.key, required this.errorMassege});
  final String errorMassege;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * .3,
        height: MediaQuery.sizeOf(context).height * .8,
        child: Stack(children: [
          Center(
              child: SizedBox(
                  // width: MediaQuery.sizeOf(context).width * .3,
                  height: MediaQuery.sizeOf(context).height * .8,
                  child: const Image(
                    image: AssetImage("assets/images/error.png"),
                    fit: BoxFit.cover,
                  ))),
          LayoutBuilder(
            builder: (context, constraints) => Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    errorMassege,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: constraints.maxWidth * .7,
                    height: 35,
                    child: MaterialButton(
                      color: AppColors.buttonColorGray,
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.buttonColorWhite),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
