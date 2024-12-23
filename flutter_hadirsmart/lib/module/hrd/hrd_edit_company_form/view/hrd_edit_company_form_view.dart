import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/hrd_edit_company_form_controller.dart';
import '../state/hrd_edit_company_form_state.dart';
import 'package:get_it/get_it.dart';

class HrdEditCompanyFormView extends StatefulWidget {
  const HrdEditCompanyFormView({super.key});

  @override
  State<HrdEditCompanyFormView> createState() => _HrdEditCompanyFormViewState();
}

class _HrdEditCompanyFormViewState extends State<HrdEditCompanyFormView> {
  HrdEditCompanyFormController controller = HrdEditCompanyFormController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<HrdEditCompanyFormController>()) {
      GetIt.I.unregister<HrdEditCompanyFormController>();
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
      child:
          BlocListener<HrdEditCompanyFormController, HrdEditCompanyFormState>(
        listener: (context, state) {},
        child:
            BlocBuilder<HrdEditCompanyFormController, HrdEditCompanyFormState>(
          builder: (context, state) {
            final bloc = context.read<HrdEditCompanyFormController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    HrdEditCompanyFormController controller,
    HrdEditCompanyFormState state,
  ) {
    if (state.getCompanyByIdResponse == null) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Company Form'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                QImagePicker(
                  label: "Company Photo",
                  value: state.photo,
                  onChanged: (value) {
                    state.photo = value;
                  },
                ),
                QTextField(
                  label: "Company Name",
                  validator: Validator.required,
                  value: state.companyName,
                  onChanged: (value) {
                    state.companyName = value;
                  },
                ),
                QMemoField(
                  label: "Company Address",
                  maxLines: 2,
                  value: state.address,
                  onChanged: (value) {
                    state.address = value;
                  },
                ),
                QMemoField(
                  label: "Company Description",
                  maxLines: 3,
                  value: state.description,
                  onChanged: (value) {
                    state.description = value;
                  },
                ),
                QLocationPicker2(
                  label: "Location",
                  latitude: state.latitude,
                  longitude: state.longitude,
                  onChanged: (latitude, longitude, address) {
                    state.latitude = latitude;
                    state.longitude = longitude;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: QTimePicker(
                        label: "Working Hour Start",
                        validator: Validator.required,
                        value: state.workingHourStart,
                        onChanged: (value) {
                          state.workingHourStart = value;
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: QTimePicker(
                        label: "Working Hour End",
                        validator: Validator.required,
                        value: state.workingHourEnd,
                        onChanged: (value) {
                          state.workingHourEnd = value;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }
}
