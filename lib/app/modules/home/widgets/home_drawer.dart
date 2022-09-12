import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tap_to_count/app/widgets/theme_switch/theme_switch_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawerWidget extends StatefulWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  State<HomeDrawerWidget> createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {
  PackageInfo? _packageInfo;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getPackageInfo();
    });
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = packageInfo;
    });
  }

  openPrivacy() {
    Get.defaultDialog(
      radius: 10,
      titlePadding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      contentPadding: const EdgeInsets.only(
        bottom: 20,
        right: 20,
        left: 20,
      ),
      title: 'titleAboutDialog'.tr,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/icon/app_icon.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _packageInfo?.appName ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                _packageInfo?.version ?? '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
      cancel: TextButton(
        child: Text('viewLicenseAboutDialog'.tr),
        onPressed: () {
          showLicensePage(context: context);
        },
      ),
      confirm: TextButton(
        child: Text(
          'closeAboutDialog'.tr,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  openContact() {
    Get.defaultDialog(
      radius: 10,
      titlePadding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      contentPadding: const EdgeInsets.only(
        bottom: 20,
        right: 20,
        left: 20,
      ),
      title: 'contactTextDrawer'.tr,
      content: Column(
        children: [
          Text(
            '${'developedBy'.tr}: Israel Gutierrez Salazar',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse('https://israelgs.com');
              if (!await launchUrl(url)) {
                throw 'Could not launch';
              }
            },
            child: Row(
              children: const [
                Icon(
                  FontAwesomeIcons.globe,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  'https://israelgs.com',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final Uri url =
              Uri.parse('https://www.linkedin.com/in/israel-gs/');
              if (!await launchUrl(url)) {
                throw 'Could not launch';
              }
            },
            child: Row(
              children: const [
                Icon(
                  FontAwesomeIcons.linkedin,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  'https://www.linkedin.com/in/israel-gs/',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      confirm: TextButton(
        child: Text(
          'closeAboutDialog'.tr,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          _buildDrawerHeader(),
          _buildItem(
            icon: FontAwesomeIcons.shieldHalved,
            title: 'titleAboutDialog'.tr,
            onTap: openPrivacy,
          ),
          const SizedBox(height: 20),
          _buildItem(
            icon: FontAwesomeIcons.solidMessage,
            title: 'contactTextDrawer'.tr,
            onTap: openContact,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ThemeSwitchWidget(),
          ),
        ],
      ),
    );
  }

  _buildItem({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        leading: Icon(icon, size: 20),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }

  _buildDrawerHeader() {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/icon/app_icon.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _packageInfo?.appName ?? '',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'v${(_packageInfo?.version ?? '')}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
