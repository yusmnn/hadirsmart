import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:get_it/get_it.dart';

class UserRequestListView extends StatefulWidget {
  final String requestType;
  const UserRequestListView({super.key, required this.requestType});

  @override
  State<UserRequestListView> createState() => _UserRequestListViewState();
}

class _UserRequestListViewState extends State<UserRequestListView> {
  UserRequestListController controller = UserRequestListController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<UserRequestListController>()) {
      GetIt.I.unregister<UserRequestListController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.state.requestType = widget.requestType;
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    scrollController.addListener(() {
      var offset = scrollController.offset;
      var maxScroll = scrollController.position.maxScrollExtent;
      if (offset == maxScroll) {
        controller.nextPage();
        setState(() {});
      }
    });
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
      child: BlocListener<UserRequestListController, UserRequestListState>(
        listener: (context, state) {},
        child: BlocBuilder<UserRequestListController, UserRequestListState>(
          builder: (context, state) {
            final bloc = context.read<UserRequestListController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    UserRequestListController controller,
    UserRequestListState state,
  ) {
    var items = state.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Request ${controller.state.requestType} Histories'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          controller.reload();
          return Future.value(true);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: QCategoryPicker(
                style: QCategoryPickerStyle.fittedStyle,
                items: const [
                  {
                    "label": "Pending",
                    "value": "Pending",
                  },
                  {
                    "label": "Approved",
                    "value": "Approved",
                  },
                  {
                    "label": "Rejected",
                    "value": "Rejected",
                  },
                ],
                value: state.status,
                validator: Validator.required,
                onChanged: (index, label, value, item) {
                  controller.state.status = value;
                  controller.reload();
                },
              ),
            ),
            Expanded(
              child: state.loading
                  ? LoadingScaffold()
                  : ListView.builder(
                      padding: const EdgeInsets.all(20.0),
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = items[index];
                        var isNotPending = item.status != "Pending";
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: InkWell(
                              splashColor: primaryColor,
                              onTap: () {
                                Get.to(UserRequestDetailView(
                                  item: item,
                                ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration:
                                        BoxDecoration(color: primaryColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${item.createdAt!.dMMMy} | ${item.createdAt!.HHmm}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${item.status}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      radius: 32.0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 32 - 2,
                                        child: CircleAvatar(
                                          radius: 32 - 4,
                                          backgroundImage: NetworkImage(
                                            item.user?.photo ??
                                                "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "${item.user!.name}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${item.user!.email}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    trailing: isHRD
                                        ? Container(
                                            width: 120,
                                            // color: Colors.blue,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    if (isNotPending) return;
                                                    controller.approve(item);
                                                  },
                                                  icon: CircleAvatar(
                                                    backgroundColor:
                                                        isNotPending
                                                            ? disabledColor
                                                            : successColor,
                                                    radius: 16.0,
                                                    child: Icon(
                                                      Icons.check,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.0),
                                                IconButton(
                                                  onPressed: () async {
                                                    if (isNotPending) return;

                                                    await Get.to(
                                                        UserRequestRejectPopupView(
                                                            item: item));
                                                    if (state.rejectedNote ==
                                                        null) return;
                                                    if (state.rejectedNote!
                                                        .isEmpty) return;

                                                    await controller
                                                        .reject(item);
                                                  },
                                                  icon: CircleAvatar(
                                                    backgroundColor:
                                                        isNotPending
                                                            ? disabledColor
                                                            : dangerColor,
                                                    radius: 16.0,
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : null,
                                  ),
                                  if (widget.requestType == "FaceTraining")
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                      ),
                                      child: Image.network(
                                        item.attachment ??
                                            "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(UserRequestFormView(
            requestType: widget.requestType,
          ));
          controller.reload();
        },
      ),
    );
  }
}
