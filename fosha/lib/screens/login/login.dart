import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fosha/core/cubit/appcubit/app_cubit.dart';
import 'package:fosha/core/cubit/appcubit/app_states.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController(text: 'emilys');
    TextEditingController password = TextEditingController(text: 'emilyspass');
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                    ),
                    Positioned(
                      left: 30,
                      top: 50,
                      width: 150,
                      height: 200,
                      child: FadeInUp(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            child: Text('Fosha',
                                style: TextStyle(
                                  fontFamily: 'Ceremonials',
                                  fontSize: 60,
                                  color: Colors.white,
                                )),
                          )),
                    ),
                    Positioned(
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: 'Ceremonials',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                        duration: const Duration(milliseconds: 1800),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromRGBO(255, 152, 0, 1)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(255, 152, 0, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 152, 0, 1)))),
                                child: TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "User name",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700])),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700])),
                                ),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1900),
                        child: BlocBuilder<AppCubit, AppStates>(
                          builder: (context, state) {
                            return state is LoginLoadingState
                                ? const CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      AppCubit.get(context).login(context,
                                          username.text, password.text);
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color.fromRGBO(255, 152, 0, 1),
                                            Color.fromRGBO(255, 152, 0, .6),
                                          ])),
                                      child: const Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: const Text(
                          "Forgot Password?",
                          style:
                              TextStyle(color: Color.fromRGBO(255, 152, 0, 1)),
                        )),
                    FadeInUp(
                        duration: const Duration(milliseconds: 3000),
                        child: InkWell(
                          onTap: () {
                            AppCubit.get(context)
                                .login(context, username.text, password.text);
                          },
                          child: Container(
                            margin: EdgeInsetsDirectional.only(
                                top: MediaQuery.sizeOf(context).height * .13),
                            child: Center(
                              child: Text(
                                "Don't have an account? Sign up",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 152, 0, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
