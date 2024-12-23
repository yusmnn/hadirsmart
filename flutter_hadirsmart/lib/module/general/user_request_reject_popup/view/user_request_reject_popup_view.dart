import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/model/get_user_request_history_response.dart';
import 'package:hyper_ui/module/general/user_request_list/controller/user_request_list_controller.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:hyper_ui/shared/util/log/log.dart';
import 'package:hyper_ui/shared/util/validator/validator.dart';
import 'package:hyper_ui/shared/widget/form/button/action_button.dart';
import 'package:hyper_ui/shared/widget/form/memo_field/memo_field.dart';
import 'package:hyper_ui/state_util.dart';
import '../controller/user_request_reject_popup_controller.dart';
import '../state/user_request_reject_popup_state.dart';
import 'package:get_it/get_it.dart';
import 'package:hyper_ui/shared/util/type_extension/date_extension.dart';

class UserRequestRejectPopupView extends StatefulWidget {
  final UserRequestHistory item;
  const UserRequestRejectPopupView({super.key, required this.item});

  @override
  State<UserRequestRejectPopupView> createState() =>
      _UserRequestRejectPopupViewState();
}

class _UserRequestRejectPopupViewState
    extends State<UserRequestRejectPopupView> {
  UserRequestRejectPopupController controller =
      UserRequestRejectPopupController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String getLabel(double amount) {
    switch (amount) {
      case 0.24:
        return "Full Days";
      case 0.12:
        return "Half Days";
      case 0.1:
        return "One Hour";
      default:
        return "${amount.toInt()} Hours";
    }
  }

  @override
  void initState() {
    if (GetIt.I.isRegistered<UserRequestRejectPopupController>()) {
      GetIt.I.unregister<UserRequestRejectPopupController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.state.item = widget.item;
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
      child: BlocListener<UserRequestRejectPopupController,
          UserRequestRejectPopupState>(
        listener: (context, state) {},
        child: BlocBuilder<UserRequestRejectPopupController,
            UserRequestRejectPopupState>(
          builder: (context, state) {
            final bloc = context.read<UserRequestRejectPopupController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    UserRequestRejectPopupController controller,
    UserRequestRejectPopupState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.item.requestType} Reject Popup'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 32.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 32 - 2,
                  child: CircleAvatar(
                    radius: 32 - 4,
                    backgroundImage: NetworkImage(
                      widget.item.user?.photo ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                ),
              ),
              title: Text(
                "${widget.item.user!.name}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                "${widget.item.user!.email}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  si("Feature Not Availaible");
                },
                icon: Icon(
                  Icons.more_vert,
                ),
              ),
            ),
            SizedBox(height: 12),
            if (controller.isFaceTraining) ...[
              Container(
                height: MediaQuery.of(context).size.height * 0.36,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.item.attachment ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.requestType ?? "Error!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.item.createdAt?.dMMMykkmm ?? "Error!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            if (!controller.isFaceTraining) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Amount: ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    getLabel(
                      widget.item.amount!,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
            ],
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.item.description ?? "Error!",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50),
            QMemoField(
              label: "Rejected Note",
              validator: Validator.required,
              value: state.rejectedNote,
              onChanged: (value) {
                state.rejectedNote = value;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: "Reject ${widget.item.requestType}",
        enabled: true,
        color: warningColor,
        onPressed: () {
          bool isNotValid = formKey.currentState!.validate() == false;
          if (isNotValid) {
            return;
          }
          var userRequestListController = GetIt.I<UserRequestListController>();
          userRequestListController.state.rejectedNote = state.rejectedNote;
          Get.back();
        },
      ),
    );
  }
}
