import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SvgUtils {
  static Future<String> loadAndManipulateSvg(
      String assetPath,
      String targetColor,
      String replacementColor,
      String strokeColor,
      String replaceStrokeColor) async {
    final String svgString = await rootBundle.loadString(assetPath);
    final String manipulatedSvgString = svgString
        .replaceAll(targetColor, replacementColor)
        .replaceAll(strokeColor, replaceStrokeColor);
    return manipulatedSvgString;
  }
}

class AppSvgWidget extends HookWidget {
  final String svgPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? strokeColor;
  final String? mainColor;

  const AppSvgWidget({
    super.key,
    required this.svgPath,
    this.width,
    this.height,
    this.fit,
    this.strokeColor,
    this.mainColor
  });

  @override
  Widget build(BuildContext context) {
    final svgContent = useState<String?>(null);

    useEffect(() {
      Future<void> loadAndManipulateSvg() async {
        final String manipulatedSvgString = await SvgUtils.loadAndManipulateSvg(
          "assets/svg/icons/$svgPath",
          'currentColor',
          mainColor ?? "#fff",
          "var(--theme-color-svg-stroke-color)",
          strokeColor ?? '#999999',
        );
        try {
          svgContent.value = manipulatedSvgString;
        } catch(e) {
          
        }
      }

      loadAndManipulateSvg();

      return null;
    }, [svgPath]);

    if (svgContent.value == null) {
      return SizedBox();
      // return Center(child: CircularProgressIndicator());
    }

    return SvgPicture.string(
      svgContent.value!,
      key: GlobalKey(),
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
















// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sport_app_flu/app/app_service.dart';

// class SvgUtils {
//   static Future<String> loadAndManipulateSvg(
//       String assetPath,
//       String targetColor,
//       String replacementColor,
//       String strokeColor,
//       String replaceStrokeColor) async {
//     final String svgString = await rootBundle.loadString(assetPath);
//     final String manipulatedSvgString = svgString
//         .replaceAll(targetColor, replacementColor)
//         .replaceAll(strokeColor, replaceStrokeColor);
//     return manipulatedSvgString;
//   }
// }

// class AppSvgWidget extends StatefulWidget {
//   AppSvgWidget(
//       {super.key,
//       required this.svgPath,
//       this.width,
//       this.height,
//       this.fit,
//       this.color});
//   String svgPath;
//   double? width;
//   double? height;
//   BoxFit? fit;
//   String? color;

//   @override
//   _MySvgWidgetState createState() => _MySvgWidgetState();
// }

// class _MySvgWidgetState extends State<AppSvgWidget> {
//   String? svgContent;

//   @override
//   void initState() {
//     _loadAndManipulateSvg();
//     super.initState();
//   }

//   Future<void> _loadAndManipulateSvg() async {
//     final String manipulatedSvgString = await SvgUtils.loadAndManipulateSvg(
//         "assets/svg/icons/${widget.svgPath}",
//         'var(--theme-color)',
//         Get.find<AppService>().appSkinColorString.value,
//         "var(--theme-color-svg-stroke-color)",
//         widget.color ?? '#999999');
//     if (mounted) {
//       setState(() {
//         svgContent = manipulatedSvgString;
//       });
//     }
//   }

//   @override
//   void didUpdateWidget(covariant AppSvgWidget oldWidget) {
//     setState(() {});
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (svgContent == null) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return SvgPicture.string(
//       svgContent!,
//       key: GlobalKey(),
//       width: widget.width,
//       height: widget.height,
//       fit: widget.fit == null ? BoxFit.contain : widget.fit!,
//     );
//   }
// }
