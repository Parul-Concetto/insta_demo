import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../enum/theme_type.dart';
import '../theme_resource.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key, required this.themeMode}) : super(key: key);
  final String themeMode;

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  String _verticalGroupValue = '';
  final List<String> _status =
      EThemeType.values.map((e) => e.themeName).toList();

  @override
  void initState() {
    // TODO: implement initState
    _verticalGroupValue = widget.themeMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Choose Theme',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          RadioGroup<String>.builder(
            groupValue: _verticalGroupValue,
            onChanged: (value) => setState(() {
              _verticalGroupValue = value!;
              onChangeTheme(value);
              Get.back();
            }),
            items: _status,
            textStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 40.sp),
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
          ),
        ],
      ),
    );
  }

  void onChangeTheme(String value) async {
    int index = _status.indexOf(value);
    if (index == 0) {
      ThemeResource().changeThemeMode(ThemeMode.dark);
    } else if (index == 1) {
      ThemeResource().changeThemeMode(ThemeMode.light);
    } else {
      ThemeResource().changeThemeMode(ThemeMode.system);
    }
  }
}
