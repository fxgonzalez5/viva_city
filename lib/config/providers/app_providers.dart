import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:viva_city/infrastructure/datasources/django_datasource.dart';
import 'package:viva_city/infrastructure/repositories/tourism_repository_impl.dart';
import 'package:viva_city/presentation/providers/providers.dart';

final tourismRepository = TourismRepositoryImpl(DjangoDatasource());

final List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (_) => SlidesProvider()),
  ChangeNotifierProvider(create: (_) => LoginProvider()),
  ChangeNotifierProvider(create: (_) => SignupProvider()),
  ChangeNotifierProvider(create: (_) => ProfileProvider()),
  ChangeNotifierProvider(create: (_) => SlidingProvider()),
  ChangeNotifierProvider(create: (_) => NavegationProvider()),
  ChangeNotifierProvider(create: (_) => HomeProvider()),
  ChangeNotifierProvider(create: (_) => CategoryProvider(tourismRepository: tourismRepository), lazy: false),
];