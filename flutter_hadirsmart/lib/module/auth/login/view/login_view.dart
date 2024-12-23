import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/auth/login/widget/form_box.dart';
import 'package:hyper_ui/shared/widget/form/button/button.dart';
import '../../../../shared/widget/logo_apk/logo_apk.dart';
import '../controller/login_controller.dart';
import '../state/login_state.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<LoginController>()) {
      GetIt.I.unregister<LoginController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginController, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginController controller,
    LoginState state,
  ) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              LogoApk(
                icon: true,
                width: 160,
                height: 160,
              ),
              QTextField(
                label: "Email",
                value: state.email,
                onChanged: (value) {
                  state.email = value;
                },
              ),
              QTextField(
                label: "Password",
                obscure: true,
                validator: Validator.required,
                suffixIcon: Icons.password,
                value: state.password,
                onChanged: (value) {
                  state.password = value;
                },
              ),
              QButton(
                label: 'Login',
                onPressed: () {
                  controller.login();
                },
              ),
              SizedBox(height: 32),
              if (kDebugMode) ...[
                QButton(
                  color: Colors.blue,
                  label: 'Login Employee Sasha',
                  onPressed: () {
                    state.email = "user4.alphawaveinc@demo.com";
                    state.password = "123456";
                    controller.login();
                  },
                ),
                SizedBox(height: 16),
                QButton(
                  color: Colors.blue,
                  label: 'Login Employee Frieren',
                  onPressed: () {
                    state.email = "user6.alphawaveinc@demo.com";
                    state.password = "123456";
                    controller.login();
                  },
                ),
                SizedBox(height: 16),
                QButton(
                  label: 'Login HRD',
                  color: Colors.green,
                  onPressed: () {
                    state.email = "hrd2.alphawaveinc@demo.com";
                    state.password = "123456";
                    controller.login();
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
