import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/routes.dart';
import 'get-categories.store.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final store = GetCategoriesStore(GetIt.I());

  @override
  void initState() {
    super.initState();
    store.getCategories();
  }

  void action([String? uid]) async {
    await Navigator.of(context).pushNamed(Routes.category, arguments: uid);
    store.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: store.state.length,
            itemBuilder: (context, index) {
              final category = store.state.elementAt(index);
              return ListTile(
                title: Text(category.name),
                subtitle: Text(category.description),
                onTap: () => action(category.uid),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: action,
        child: const Icon(Icons.add),
      ),
    );
  }
}
