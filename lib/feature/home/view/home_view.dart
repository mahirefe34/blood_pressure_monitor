/* import 'package:blood_pressure_monitor/feature/home/service/home_service.dart';
import 'package:blood_pressure_monitor/feature/search/view/search_view.dart';
import 'package:blood_pressure_monitor/product/cache/user_cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/user_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  List<UserModel>? _items;
  late final ICacheManager<UserModel> cacheManager;
  late final IHomeService _homeService;

  @override
  void initState() {
    super.initState();
    _homeService = HomeService(Dio(BaseOptions(baseUrl: _baseUrl)));
    cacheManager = UserCacheManager('userCacheNew');
    fetchDatas();
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    if (cacheManager.getValues()?.isNotEmpty ?? false) {
      _items = cacheManager.getValues();
    } else {
      _items = await _homeService.fetchUsers();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.navigateToPage(SearchView(model: cacheManager));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_items?.isNotEmpty ?? false) {
            await cacheManager.addItems(_items!);
            //final cacheItems = cacheManager.getValues();
          }
        },
        child: const Icon(Icons.download),
      ),
      body: (_items?.isNotEmpty ?? false)
          ? ListView.builder(
              itemCount: _items?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${_items?[index].name}'),
                  ),
                );
              },
            )
          : const CircularProgressIndicator(),
    );
  }
}
 */