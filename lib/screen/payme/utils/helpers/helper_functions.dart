import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aviraldotfun/screen/payme/utils/constants/colors.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/sizes.dart';
import 'package:aviraldotfun/screen/payme/utils/constants/text_styles.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:iconsax/iconsax.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class PayMeHelperFunctions {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static void showMaterialSnakBarError(
      String title, String description, BuildContext context) {
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
              color: PayMeColors.white,
              fontWeight: FontWeight.w600,
              fontSize: PayMeSizes.figmaRatioWidth(context, 16),
            ),
          ),
          Text(
            description,
            style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
              color: PayMeColors.white,
              fontWeight: FontWeight.w500,
              fontSize: PayMeSizes.figmaRatioWidth(context, 12),
            ),
          ),
        ],
      ),
      backgroundColor: PayMeColors.error,
      duration: const Duration(seconds: 2),
      // show from top
      behavior: SnackBarBehavior.floating,
      actionOverflowThreshold: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static void showMaterialSnakBarSuccess(
      String title, String description, BuildContext context) {
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
              color: PayMeColors.white,
              fontWeight: FontWeight.w600,
              fontSize: PayMeSizes.figmaRatioWidth(context, 16),
            ),
          ),
          Text(
            description,
            style: PayMeTextStyles.defaultPrimaryStyle.copyWith(
              color: PayMeColors.white,
              fontWeight: FontWeight.w500,
              fontSize: PayMeSizes.figmaRatioWidth(context, 12),
            ),
          ),
        ],
      ),
      backgroundColor: PayMeColors.success,
      duration: const Duration(seconds: 2),
      // show from top
      behavior: SnackBarBehavior.floating,
      actionOverflowThreshold: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static Future<File> assetToFile(String assetPath) async {
    // Load the asset as a byte array
    final byteData = await rootBundle.load(assetPath);

    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;

    // Create a file in the temporary directory
    final file = File('$tempPath/${DateTime.now().millisecondsSinceEpoch}.png');

    // Write the byte array to the file
    await file.writeAsBytes(byteData.buffer.asUint8List());

    return file;
  }

  static Future<String> fileToBase64(File file) async {
    final bytes = await file.readAsBytes();
    // reduce the size of the file

    // File compressedFile = await compressImageFile(file);

    // Convert the file to a base64 string
    return base64Encode(bytes);
  }

  static Future<File> base64ToFile(String base64String) async {
    final Directory extdir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extdir.path}/images';
    await Directory(dirPath).create(recursive: true);
    final String filePath =
        '$dirPath/${DateTime.now().millisecondsSinceEpoch}.png';
    final File file = File(filePath);

    // Convert base64 string to List<int> bytes
    final List<int> bytes = base64Decode(base64String);

    await file.writeAsBytes(
      bytes,
      mode: FileMode.write,
    );
    return file;
  }

  // static Future<File> compressImageFile(File file, {int quality = 70}) async {
  //   // Read the image file as bytes
  //   final Uint8List bytes = await file.readAsBytes();

  //   // Decode the image
  //   img.Image? image = img.decodeImage(bytes);

  //   if (image == null) {
  //     throw Exception("Failed to decode image");
  //   }

  //   // Compress the image
  //   final List<int> compressedBytes = img.encodeJpg(image, quality: quality);

  //   // Get the temporary directory
  //   final tempDir = await getTemporaryDirectory();
  //   final tempPath = tempDir.path;

  //   // Create a compressed file in the temporary directory
  //   final compressedFile = File(
  //       '$tempPath/${DateTime.now().millisecondsSinceEpoch}_compressed.jpg');

  //   // Write the compressed bytes to the file
  //   await compressedFile.writeAsBytes(compressedBytes);

  //   return compressedFile;
  // }

  static String getDateDifference(DateTime date) {
    final Duration difference = DateTime.now().difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  static String getDayDifference(DateTime date) {
    final Duration difference = DateTime.now().difference(date);
    if (difference.inDays == 0) {
      return "Today";
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      return PayMeHelperFunctions.formateDateTime(date, "d MMM yyyy");
    }
  }

  static Future<PermissionStatus> requestPhotoPermission() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Permission permissionToRequest;

    if (defaultTargetPlatform == TargetPlatform.android &&
        androidInfo.version.sdkInt <= 32) {
      permissionToRequest = Permission.storage;
    } else {
      permissionToRequest = Permission.photos;
    }

    if (await permissionToRequest.status.isDenied) {
      return await permissionToRequest.request();
    }
    log('Storage permission denied');
    return permissionToRequest.status;
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static hideBottomBlackStrip() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );
  }

  static void showMaterialSnakBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  static String formateDateTime(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static DateTime getDateTimeFromFormatedString(
      String dateTime, String format) {
    return DateFormat(format).parse(dateTime);
  }

  static Future<File?> startImageCrop(
      XFile imageFile, BuildContext context) async {
    File imageTemporary = File(imageFile.path);
    final Directory extdir = await getApplicationDocumentsDirectory();
    String duplicateFilePath = extdir.path;
    final fileName = path.basename(imageTemporary.path);
    final saveto = '$duplicateFilePath/$fileName';
    final File newImage = await imageTemporary.copy(saveto);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: newImage.path,
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],
      uiSettings: [
        AndroidUiSettings(
          cropStyle: CropStyle.circle,
          toolbarColor: PayMeColors.homeScreenScanQRButton,
          toolbarWidgetColor: PayMeColors.darkBackground,
          statusBarColor: PayMeColors.homeScreenScanQRButton,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          cropFrameColor: PayMeColors.homeScreenScanQRButton,
          activeControlsWidgetColor: PayMeColors.homeScreenScanQRButton,
          showCropGrid: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        // ignore: use_build_context_synchronously
        WebUiSettings(
          context: context,
        ),
      ],
    );
    return File(croppedFile!.path);
  }

  static Future<XFile?> pickImage({bool fromCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Permission permissionToRequest;
    if (fromCamera) {
      // get camera permission if not granted
      PermissionStatus status = await Permission.camera.request();
      if (!status.isGranted) {
        Get.snackbar("Error", "Please grant camera permission");
        return null;
      }

      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) return null;
      return image;
    } else {
      // get storage permission if not granted
      requestPhotoPermission();
      if (defaultTargetPlatform == TargetPlatform.android &&
          androidInfo.version.sdkInt <= 32) {
        permissionToRequest = Permission.storage;
      } else {
        permissionToRequest = Permission.photos;
      }
      if (await permissionToRequest.status.isDenied) {
        Get.snackbar("Error", "Please grant storage permission");
        return null;
      }

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      return image;
    }
  }

  static Future<File?> pickImageWithCrop(
      BuildContext context, bool isCamera) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Permission permissionToRequest;
    if (defaultTargetPlatform == TargetPlatform.android &&
        androidInfo.version.sdkInt <= 32) {
      permissionToRequest = Permission.storage;
    } else {
      permissionToRequest = Permission.photos;
    }
    final status = await permissionToRequest.request();
    log('Storage permission status: $status');
    if (status.isDenied) {
      Get.snackbar(
        "Storage Permission not provided",
        "Please grant storage permission",
        backgroundColor: PayMeColors.primary,
        backgroundGradient: LinearGradient(
          colors: [
            PayMeColors.primary,
            PayMeColors.primary,
            Colors.blue.shade900,
          ],
        ),
      );
      return null;
    }

    XFile? image = await PayMeHelperFunctions.pickImage(fromCamera: isCamera);
    if (image == null) {
      showErrorMessageGet(
        title: "Error",
        message: "No image selected",
      );
      return null;
    }
    File? croppedImage =
        await PayMeHelperFunctions.startImageCrop(image, context);
    if (croppedImage == null) return File(image.path);
    return croppedImage;
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void copyToClipBoard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    showSuccessMessageGet(title: "Copied", message: "Text copied to clipboard");
  }

  static bool validateEmail(String email) {
    final emailPattern = RegExp(
        r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$',
        caseSensitive: false);
    return emailPattern.hasMatch(email);
  }

  static void showErrorMessageGet({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: PayMeColors.error,
      colorText: PayMeColors.white,
      barBlur: 20,
      overlayBlur: 4,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(18),
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1400),
      icon: const Icon(
        Iconsax.info_circle,
        color: PayMeColors.white,
        size: 32,
      ),
    );
  }

  static String formatePhone(String phone) {
    String filteredString = phone
        .replaceAll("+", "")
        .replaceAll(" ", "")
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
    if (filteredString.length == 10) {
      filteredString = "91$filteredString";
    }
    return filteredString;
  }

  static void showSuccessMessageGet({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: PayMeColors.success,
      colorText: PayMeColors.white,
      barBlur: 20,
      overlayBlur: 4,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(18),
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1400),
      icon: const Icon(
        Icons.check_circle_rounded,
        color: PayMeColors.white,
        size: 32,
      ),
    );
  }

  static void showWarningMessageGet({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: PayMeColors.warning,
      colorText: PayMeColors.white,
      barBlur: 20,
      overlayBlur: 4,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(18),
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1400),
      icon: const Icon(
        Icons.warning_rounded,
        color: PayMeColors.white,
        size: 32,
      ),
    );
  }

  static void showInfoMessageGet({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: PayMeColors.info,
      colorText: PayMeColors.white,
      barBlur: 20,
      overlayBlur: 4,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(18),
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 1400),
      icon: const Icon(
        Icons.error,
        color: PayMeColors.white,
        size: 32,
      ),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String AESEncription(String text) {
    final key = encrypt.Key.fromUtf8(getKey());
    final iv = encrypt.IV.fromUtf8(getIVKey());
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    final encryptedString = encrypted.base64;
    log('Encrypted: $encryptedString');
    return encryptedString;
  }

  static String AESDecription(String text) {
    final key = encrypt.Key.fromUtf8(getKey());
    final iv = encrypt.IV.fromUtf8(getIVKey());
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(text, iv: iv);
    // log('Decrypted: $decrypted');
    return decrypted;
  }

  static String encryptAES(String text, String key) {
    return text;
  }

  static String testAES(String text) {
    final key = encrypt.Key.fromUtf8(getKey());
    final iv = encrypt.IV.fromUtf8(getIVKey());
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    final encryptedString = encrypted.base64;
    log('Encrypted: $encryptedString');
    return encryptedString;
  }

  // show date time dialog box and return date and time in DateTime format
  static Future<DateTime?> showDateTimeDialog(BuildContext context) async {
    DateTime? selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDate = picked;
    }
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      selectedTime = pickedTime;
    }
    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
  }

  static String getKey() {
    // random key of 128 bits

    // log('Key: $result');
    return '12345678901234567890123456789012';

    // return 'd30aaa1758d4-0aaa1758d4-0aa0aaav-a1758d4-0a10aaav30aaa1758d4-i400a1758d4-0a60a758d4-0aaaar-ab7b7l-10aaa8f5c0300a1758d4-0aaaae90e';
  }

  static String getIVKey() {
    // random key of 128 bits

    // log('IV: $result');
    return '1234567890123456';
    // return 'd30aaa1758d4-0aaa1758d4-0aa0aaav-a1758d4-0a10aaav30aaa1758d4-i400a1758d4-0a60a758d4-0aaaar-ab7b7l-10aaa8f5c0300a1758d4-0aaaae90e';
  }
}
