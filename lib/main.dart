import 'package:cat_breeds/breeds/presentation/screens/cat_breeds_list_screen.dart';
import 'package:cat_breeds/breeds/providers/bloc/cat_breeds_overview_bloc.dart';
import 'package:cat_breeds_repository/cat_breeds_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cat_api/the_cat_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat breeds',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const CatBreedsOverviewProvider(),
    );
  }
}

class CatBreedsOverviewProvider extends StatefulWidget {
  const CatBreedsOverviewProvider({
    super.key,
  });

  @override
  State<CatBreedsOverviewProvider> createState() =>
      _CatBreedsOverviewProviderState();
}

class _CatBreedsOverviewProviderState extends State<CatBreedsOverviewProvider> {
  late CatBreedsRepository _repository;
  @override
  void initState() {
    _repository = CatBreedsRepository(api: TheCatApi.build());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CatBreedsOverviewBloc(_repository)..add(const CatBreedsGetData()),
      child: const CatBreedsListScreen(),
    );
  }
}
