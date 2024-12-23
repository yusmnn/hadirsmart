import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/employee_edit_profile_form_controller.dart';
import '../state/employee_edit_profile_form_state.dart';
import 'package:get_it/get_it.dart';

class EmployeeEditProfileFormView extends StatefulWidget {
  const EmployeeEditProfileFormView({super.key});

  @override
  State<EmployeeEditProfileFormView> createState() =>
      _EmployeeEditProfileFormViewState();
}

class _EmployeeEditProfileFormViewState
    extends State<EmployeeEditProfileFormView> {
  EmployeeEditProfileFormController controller =
      EmployeeEditProfileFormController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<EmployeeEditProfileFormController>()) {
      GetIt.I.unregister<EmployeeEditProfileFormController>();
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
      child: BlocListener<EmployeeEditProfileFormController,
          EmployeeEditProfileFormState>(
        listener: (context, state) {},
        child: BlocBuilder<EmployeeEditProfileFormController,
            EmployeeEditProfileFormState>(
          builder: (context, state) {
            final bloc = context.read<EmployeeEditProfileFormController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    EmployeeEditProfileFormController controller,
    EmployeeEditProfileFormState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                QTextField(
                  label: "Name",
                  validator: Validator.required,
                  value: state.name,
                  onChanged: (value) {
                    state.name = value;
                  },
                ),
                QTextField(
                  label: "Email",
                  suffixIcon: Icons.email,
                  enabled: false,
                  value: state.email,
                  onChanged: (value) {
                    state.email = value;
                    printr(value);
                  },
                ),
                QTextField(
                  label: "Role",
                  suffixIcon: Icons.group,
                  enabled: false,
                  value: state.role,
                  onChanged: (value) {},
                ),
                QTextField(
                  label: "Department",
                  value: state.department,
                  enabled: false,
                  suffixIcon: Icons.work,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () {
          bool isNotValid = formKey.currentState!.validate() == false;
          if (isNotValid) {
            return;
          }
          controller.save();
        },
      ),
    );
  }
}
