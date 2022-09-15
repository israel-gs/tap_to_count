import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tap_to_count/app/widgets/theme_switch/theme_switch_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    DefaultAssetBundle.of(context)
        .loadString('lib/assets/privacy/privacy_policy.md')
        .then((String value) {
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
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Markdown(
            physics: const BouncingScrollPhysics(),
            selectable: true,
            data: value,
            onTapLink: (text, href, title) async {
              if (await canLaunchUrlString(href!)) {
                await launchUrlString(href);
              } else {
                throw 'Could not launch $href';
              }
            },
          ),
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
    });
  }

  openAbout() {
    Get.defaultDialog(
      radius: 10,
      titlePadding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      contentPadding: const EdgeInsets.only(
        bottom: 20,
        right: 20,
        left: 20,
      ),
      title: 'aboutTextDrawer'.tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 30),
          Text(
            '${'developedBy'.tr}: Israel Gutierrez',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://github.com/israel-gs');
                  if (!await launchUrl(url)) {
                    throw 'Could not launch';
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.github,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final Uri url =
                      Uri.parse('https://www.linkedin.com/in/israel-gs/');
                  if (!await launchUrl(url)) {
                    throw 'Could not launch';
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.linkedin,
                  size: 40,
                ),
              )
            ],
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
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                    icon: FontAwesomeIcons.circleInfo,
                    title: 'aboutTextDrawer'.tr,
                    onTap: openAbout,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: ThemeSwitchWidget(),
            ),
          ],
        ),
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
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'v${(_packageInfo?.version ?? '')}',
                    style: Theme.of(context).textTheme.titleSmall,
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
