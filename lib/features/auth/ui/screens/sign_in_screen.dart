import 'package:flutter/material.dart';
import 'package:mobile_news/features/auth/ui/components/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ElevatedButtonThemeData buttonTheme =
        Theme.of(context).elevatedButtonTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to Veritas',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        SignInForm(),
        Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          width: 300,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.white60,
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text("or")),
            const Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.white60,
              ),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: ElevatedButton(
            style: buttonTheme.style?.merge(
              ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(size.width, 50.0)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Sign up',
              style: textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
