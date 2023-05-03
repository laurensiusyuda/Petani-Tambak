import 'package:core/core.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auth/presentasion/bloc/auth_bloc.dart';
import 'package:auth/presentasion/bloc/auth_event.dart';
import 'package:auth/presentasion/bloc/auth_state.dart';
import 'package:auth/presentasion/widget/email_field.dart';
import 'package:auth/presentasion/widget/button_forgot.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);
  static const routeName = 'forgot';

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final double _elementsOpacity = 1;

  bool loadingBallAppear = false;
  double loadingBallSize = 1;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashboard()));
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              //* Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              //* Showing the sign in form if the user is not authenticated
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            // * membuat jarak awal
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 4 - 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/Logo_Udangku.png',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Lupa Kata Sandi',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // membuat form login
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // email field
                                  EmailField(
                                    emailController: _emailController,
                                    fadeEmail: _elementsOpacity == 0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ButtonForgot(
                                    elementsOpacity: _elementsOpacity,
                                    onAnimatinoEnd: () async {
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                      setState(() {
                                        loadingBallAppear = true;
                                      });
                                    },
                                    onTap: () {
                                      _resetpasswordemail(context);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _resetpasswordemail(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(ForgotPassword(_emailController.text));
    }
  }
}
