import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:viva_city/config/theme/app_theme.dart';
import 'package:viva_city/domain/entities/user_entity.dart';

class ProfileProvider extends ChangeNotifier {
  UserEntity? user;
  List<int> expanded = [];
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  String? photoUrl;
  File? newPictureFile;
  String? name;
  String? phone;
  final dateConversion = DateFormat('dd-MM-yyyy');
  late final birthdateController = TextEditingController(text: user!.birthdate != null ? dateConversion.format(user!.birthdate!) : '');
  DateTime? _birthdate;
  String? country;
  String? province;
  String? city;
  final interestController = TextEditingController();
  final focusInterest = FocusNode();
  late List<String> interests = user!.interests;
  late bool _eventNotification = user!.eventNotification;
  late bool _promotionsNotification = user!.promotionsNotification;
  late bool _emailNotification = user!.emailNotification;
  bool _isValidNumber = false;
  List<dynamic> favorites = [];

  void addExpanded(int value) {
    expanded.add(value);
    notifyListeners();
  }

  void removeExpanded(int value) {
    expanded.remove(value);
    notifyListeners();
  }
  
  void clearExpanded() {
    expanded.clear();
    notifyListeners();
  }

  bool isValidForm() {
    return editFormKey.currentState?.validate() ?? false;
  }

  bool get isValidNumber => _isValidNumber;
  set isValidNumber(bool value) {
    _isValidNumber = value;
    notifyListeners();
  }

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<void> cropImage(File imageFile) async {
    CroppedFile? newImageFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Recortar Imagen',
          toolbarColor: AppTheme.primary,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: AppTheme.secondary,
          initAspectRatio: CropAspectRatioPreset.square,
          hideBottomControls: true,
          lockAspectRatio: true
        ),
      ],
    );
    
    if (newImageFile == null) return;

    newPictureFile = File(newImageFile.path);
    notifyListeners();
  }

  DateTime? get birthdate => _birthdate;
  set birthdate(DateTime? value) {
    _birthdate = value;
    notifyListeners();
  }

  void addInterest(String value) {
    interests.add(value);
    notifyListeners();
  }

  void removeInterest(String value) {
    interests.remove(value);
    notifyListeners();
  }

  bool get eventNotification => _eventNotification;
  set eventNotification(bool value) {
    _eventNotification = value;
    notifyListeners();
  }
  
  bool get promotionsNotification => _promotionsNotification;
  set promotionsNotification(bool value) {
    _promotionsNotification = value;
    notifyListeners();
  }
  
  bool get emailNotification => _emailNotification;
  set emailNotification(bool value) {
    _emailNotification = value;
    notifyListeners();
  }
}