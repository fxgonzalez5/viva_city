class UserEntity {
  final String id;
  final String? photo;
  final String name;
  final String email;
  final String phone;
  final DateTime? birthdate;
  final String? city;
  final String? province;
  final String? country;
  final List<String> interests;
  final bool eventNotification;
  final bool promotionsNotification;
  final bool emailNotification;

  UserEntity({
    required this.id,
    this.photo,
    required this.name,
    required this.email,
    required this.phone,
    this.birthdate,
    this.city,
    this.province,
    this.country,
    this.interests = const [],
    this.eventNotification = false,
    this.promotionsNotification = false,
    this.emailNotification = false,
  });

  UserEntity copyWith({
    String? id,
    String? photo,
    String? name,
    String? email,
    String? phone,
    DateTime? birthdate,
    String? city,
    String? province,
    String? country,
    List<String>? interests,
    bool? eventNotification,
    bool? promotionsNotification,
    bool? emailNotification,
  }) => UserEntity(
    id: id ?? this.id,
    photo: photo ?? this.photo,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    birthdate: birthdate ?? this.birthdate,
    city: city ?? this.city,
    province: province ?? this.province,
    country: country ?? this.country,
    interests: interests ?? this.interests,
    eventNotification: eventNotification ?? this.eventNotification,
    promotionsNotification: promotionsNotification ?? this.promotionsNotification,
    emailNotification: emailNotification ?? this.emailNotification,
  );

  bool equals(UserEntity newUser) {
    return id == newUser.id &&
      photo == newUser.photo &&
      name == newUser.name &&
      email == newUser.email &&
      phone == newUser.phone &&
      birthdate == newUser.birthdate &&
      city == newUser.city &&
      province == newUser.province &&
      country == newUser.country &&
      interests == newUser.interests &&
      eventNotification == newUser.eventNotification &&
      promotionsNotification == newUser.promotionsNotification &&
      emailNotification == newUser.emailNotification;
  }
}