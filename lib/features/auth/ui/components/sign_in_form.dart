import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_news/config/logger_config.dart';
import 'package:mobile_news/core/models/error_format.dart';
import 'package:mobile_news/features/auth/models/sign_in.dart';
import 'package:mobile_news/features/auth/service/auth_service.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  final bool hiddenPassword = true;

  @override
  void initState() {
    super.initState();
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? true) {
      _formKey.currentState?.save();

      SignIn signIn = SignIn(
          username: _usernameController.text,
          password: _passwordController.text);

      final response = await _authService.signIn(signIn);

      if (response is String) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign in successful'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        final error = response as ErrorFormat;
        LoggerConfig.logger.e(error.message);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      GoRouter.of(context).push("/");
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ElevatedButtonThemeData buttonTheme =
        Theme.of(context).elevatedButtonTheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: textTheme.bodyMedium,
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter your username"),
                  MaxLengthValidator(32,
                      errorText: 'Username must be less than 32 characters'),
                ]).call,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: textTheme.bodyMedium,
                ),
                obscureText: hiddenPassword,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please enter your password"),
                  MinLengthValidator(8,
                      errorText: 'Password must be at least 8 characters'),
                  MaxLengthValidator(32,
                      errorText: 'Password must be less than 32 characters'),
                ]).call,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => {},
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  minimumSize: WidgetStatePropertyAll(Size(140, 10)),
                  foregroundColor: WidgetStatePropertyAll(Colors.blue),
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                child: const Text('Forgot your password?'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: ElevatedButton(
                style: buttonTheme.style?.merge(
                  ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(size.width, 50.0)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                ),
                onPressed: () => _submitForm(),
                child: Text(
                  'Sign in',
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
