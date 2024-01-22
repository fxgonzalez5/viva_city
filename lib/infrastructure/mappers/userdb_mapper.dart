import 'package:viva_city/domain/entities/user_entity.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class UserDBMapper {
  static UserEntity userDBToEntity(UserDB userdb) => UserEntity(
    id: userdb.id,
    photo: userdb.photoUrl,
    name: userdb.name,
    email: userdb.email,
    phone: userdb.phone,
    birthdate: userdb.birthdate,
    city: userdb.city,
    province: userdb.province,
    country: userdb.country,
    interests: userdb.interests,
    eventNotification: userdb.eventNotification,
    promotionsNotification: userdb.promotionsNotification,
    emailNotification: userdb.emailNotification,
  );

  static UserDB userEntityToModel(UserEntity user) => UserDB(
    id: user.id,
    photoUrl: user.photo,
    name: user.name,
    email: user.email,
    phone: user.phone,
    birthdate: user.birthdate,
    city: user.city,
    province: user.province,
    country: user.country,
    interests: user.interests,
    eventNotification: user.eventNotification,
    promotionsNotification: user.promotionsNotification,
    emailNotification: user.emailNotification,
  );
}