import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:get_it/get_it.dart';

class HrdDashboardView extends StatefulWidget {
  const HrdDashboardView({super.key});

  @override
  State<HrdDashboardView> createState() => _HrdDashboardViewState();
}

class _HrdDashboardViewState extends State<HrdDashboardView> {
  HrdDashboardController controller = HrdDashboardController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<HrdDashboardController>()) {
      GetIt.I.unregister<HrdDashboardController>();
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
      child: BlocListener<HrdDashboardController, HrdDashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<HrdDashboardController, HrdDashboardState>(
          builder: (context, state) {
            final bloc = context.read<HrdDashboardController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    HrdDashboardController controller,
    HrdDashboardState state,
  ) {
    if (state.getUserByIdResponse == null) return LoadingScaffold();
    var item = state.getUserByIdResponse!.data!;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 120,
          child: LogoApk(
            icon: false,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 32.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 32 - 2,
                            child: CircleAvatar(
                              radius: 32 - 4,
                              backgroundImage: NetworkImage(
                                item.photo ??
                                    "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name ?? "Default Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${item.role} - ${item.department}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    const QCarousel(
                      type: CarouselType.type5,
                      images: [
                        "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://plus.unsplash.com/premium_photo-1661775434014-9c0e8d71de03?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://images.unsplash.com/photo-1564069114553-7215e1ff1890?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://plus.unsplash.com/premium_photo-1677529494239-682591edd525?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: 1.0,
                            child: InkWell(
                              onTap: () async {
                                if (controller.isCheckedInToday) return;

                                // Tampilkan dialog untuk memilih opsi
                                await showDialogRequestImage(context)
                                    .then((result) {
                                  if (result == "camera") {
                                    controller.checkIn(
                                        source: ImageSource.camera);
                                  } else if (result == "gallery") {
                                    controller.checkIn(
                                        source: ImageSource.gallery);
                                  }
                                });
                              },
                              child: EmployeeDashboardMainActionButton(
                                icon: Icons.login,
                                label: "Check In",
                                time: !controller.isCheckedInToday
                                    ? "--:--"
                                    : controller.checkInDate!.kkmm,
                                status: "-",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: !controller.isCheckedInToday ? 0.6 : 1.0,
                            child: InkWell(
                              onTap: () async {
                                if (!controller.isCheckedInToday) return;
                                // Tampilkan dialog untuk memilih opsi
                                await showDialogRequestImage(context)
                                    .then((result) {
                                  if (result == "camera") {
                                    controller.checkOut(
                                        source: ImageSource.camera);
                                  } else if (result == "gallery") {
                                    controller.checkOut(
                                        source: ImageSource.gallery);
                                  }
                                });
                              },
                              child: EmployeeDashboardMainActionButton(
                                icon: Icons.login,
                                label: "Check Out",
                                time: !controller.isCheckedOutToday
                                    ? "--:--"
                                    : controller.checkoutDate!.kkmm,
                                status: "-",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (kDebugMode) ...[
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => controller.reset(),
                  child: Text(
                    "Reset",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  onTap: () => controller.loadData(),
                  child: Text(
                    "Check Attendance Status Today",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
          const SizedBox(
            height: 20.0,
          ),
          Builder(builder: (context) {
            List items = [
              {
                "icon": Icons.timer,
                "label": "Cuti",
                "on_tap": () => Get.to(UserRequestListView(
                      requestType: "Leave",
                    )),
              },
              {
                "icon": Icons.nordic_walking,
                "label": "Izin",
                "on_tap": () => Get.to(UserRequestListView(
                      requestType: "Permission",
                    )),
              },
              {
                "icon": Icons.timelapse,
                "label": "Lembur",
                "on_tap": () => Get.to(UserRequestListView(
                      requestType: "Overtime",
                    )),
              },
              {
                "icon": Icons.face,
                "label": "FaceTraining",
                "on_tap": () => Get.to(UserRequestListView(
                      requestType: "FaceTraining",
                    )),
              },
              {
                "icon": Icons.event,
                "label": "Event",
                "on_tap": () {},
              },
              {
                "icon": Icons.calendar_month,
                "label": "Kalender Absensi",
                "on_tap": () {},
              },
              {
                "icon": Icons.request_quote,
                "label": "User Request",
                "on_tap": () {},
              },
              {
                "icon": Icons.request_quote,
                "label": "xxx",
                "on_tap": () {},
              },
            ];

            return GridView.builder(
              padding: EdgeInsets.all(12.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0 / 1.1,
                crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
              ),
              itemCount: items.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return InkWell(
                  onTap: () => item["on_tap"](),
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: FittedBox(
                              child: Icon(
                                item["icon"],
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          item["label"],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Future<dynamic> showDialogRequestImage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Opsi"),
          content: Text("Ambil foto dari kamera atau galeri?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, "camera");
              },
              child: Text("Kamera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "gallery");
              },
              child: Text("Galeri"),
            ),
          ],
        );
      },
    );
  }
}
