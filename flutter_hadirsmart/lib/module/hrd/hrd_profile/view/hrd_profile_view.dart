import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/list/list_item.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../shared/widget/typography/heading.dart';
import '../controller/hrd_profile_controller.dart';
import '../state/hrd_profile_state.dart';
import 'package:get_it/get_it.dart';

class HrdProfileView extends StatefulWidget {
  const HrdProfileView({super.key});

  @override
  State<HrdProfileView> createState() => _HrdProfileViewState();
}

class _HrdProfileViewState extends State<HrdProfileView> {
  HrdProfileController controller = HrdProfileController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<HrdProfileController>()) {
      GetIt.I.unregister<HrdProfileController>();
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
      child: BlocListener<HrdProfileController, HrdProfileState>(
        listener: (context, state) {},
        child: BlocBuilder<HrdProfileController, HrdProfileState>(
          builder: (context, state) {
            final bloc = context.read<HrdProfileController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    HrdProfileController controller,
    HrdProfileState state,
  ) {
    if (state.getUserByIdResponse == null) return LoadingScaffold();
    var item = state.getUserByIdResponse!.data!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  Builder(builder: (context) {
                    double size = 52.0;
                    return InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: size,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: size - 2,
                              child: CircleAvatar(
                                radius: size - 4,
                                backgroundImage: NetworkImage(
                                  item.photo ??
                                      "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: primaryColor.withOpacity(0.8),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    item.name ?? "Error Name",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    item.email ?? "Error Email",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            HS6(title: "GENERAL"),
            ListItem(
              prefixIcon: Icons.wallet,
              label: "Edit company",
              onTap: () {
                Get.to(HrdEditCompanyFormView());
              },
            ),
            ListItem(
              prefixIcon: Icons.wallet,
              label: "25000",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: Icons.favorite_outline,
              label: "Blogs",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: Icons.password,
              label: "Change password",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.starOutline,
              label: "Rate us",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.starOutline,
              label: "My Reviews",
              onTap: () {},
            ),
            HS6(title: "ABOUT APP"),
            ListItem(
              prefixIcon: MdiIcons.informationSlabBoxOutline,
              label: "About App",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.security,
              label: "Privacy Policy",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.post,
              label: "Terms & Conditions",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.chatQuestionOutline,
              label: "Help & Support",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.phoneRingOutline,
              label: "Helpline Number",
              onTap: () {},
            ),
            HS6(title: "Settings"),
            ListItem(
              prefixIcon: MdiIcons.flagOutline,
              label: "App Language",
              onTap: () {},
            ),
            HS6(title: "DANGER ZONE"),
            ListItem(
              prefixIcon: MdiIcons.accountRemoveOutline,
              label: "Delete Account",
              onTap: () {},
            ),
            ListItem(
              prefixIcon: MdiIcons.logout,
              label: "Logout",
              onTap: () => controller.logout(),
            ),
            const SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
