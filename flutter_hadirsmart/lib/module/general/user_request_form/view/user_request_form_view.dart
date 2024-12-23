import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/user_request_form_controller.dart';
import '../state/user_request_form_state.dart';
import 'package:get_it/get_it.dart';

class UserRequestFormView extends StatefulWidget {
  final String requestType;
  const UserRequestFormView({super.key, required this.requestType});

  @override
  State<UserRequestFormView> createState() => _UserRequestFormViewState();
}

class _UserRequestFormViewState extends State<UserRequestFormView> {
  UserRequestFormController controller = UserRequestFormController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<UserRequestFormController>()) {
      GetIt.I.unregister<UserRequestFormController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.state.requestType = widget.requestType;
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
      child: BlocListener<UserRequestFormController, UserRequestFormState>(
        listener: (context, state) {},
        child: BlocBuilder<UserRequestFormController, UserRequestFormState>(
          builder: (context, state) {
            final bloc = context.read<UserRequestFormController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    UserRequestFormController controller,
    UserRequestFormState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${state.requestType} Request Form",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          scrollDirection: Axis.vertical,
          children: [
            if (controller.isFaceTraining)
              QImagePicker(
                label: "Photo",
                validator: Validator.required,
                value: state.attachment,
                onChanged: (value) {
                  state.attachment = value;
                },
              ),
            if (!controller.isFaceTraining)
              QDropdownField(
                label: "${state.requestType} Type",
                validator: Validator.required,
                items: [
                  if (!controller.isOvertime) ...[
                    {
                      "label": "Full days",
                      "value": 0.24,
                    },
                    {
                      "label": "Half days",
                      "value": 0.12,
                    },
                  ],
                  if (controller.isPermission)
                    {
                      "label": "One Hour",
                      "value": 0.1,
                    },
                  if (controller.isOvertime)
                    ...List.generate(
                      24,
                      (index) => {
                        "label": "${index + 1} hours",
                        "value": double.parse("${index + 1}"),
                      },
                    )
                ],
                value: state.amount,
                onChanged: (value, label) {
                  state.amount = double.tryParse(value.toString());
                },
              ),
            if (!controller.isFaceTraining)
              Row(
                children: [
                  Expanded(
                    child: QDatePicker(
                      label: "From date",
                      validator: Validator.required,
                      value: state.fromDate,
                      onChanged: (value) {
                        state.fromDate = value;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: QDatePicker(
                      label: "To date",
                      validator: Validator.required,
                      value: state.toDate,
                      onChanged: (value) {
                        state.toDate = value;
                      },
                    ),
                  ),
                ],
              ),
            QMemoField(
              label: "Description",
              maxLines: 3,
              value: state.description,
              onChanged: (value) {
                state.description = value;
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Submit",
        onPressed: () {
          bool isNotValid = formKey.currentState!.validate() == false;
          if (isNotValid) {
            return;
          }
          controller.submit();
        },
      ),
    );
  }
}
