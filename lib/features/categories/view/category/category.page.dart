import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'stores/create_category.store.dart';
import 'stores/get_category.store.dart';
import 'stores/update_category.store.dart';

class CategoryPage extends StatefulWidget {
  final String? uid;
  const CategoryPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final createCategoryStore = CreateCategoryStore(GetIt.I());
  final getCategoryStore = GetCategoryStore(GetIt.I());
  final updateCategoryStore = UpdateCategoryStore(GetIt.I());

  bool get isNewCategory => widget.uid == null;
  bool get isLoading =>
      createCategoryStore.isLoading || updateCategoryStore.isLoading;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!isNewCategory) {
        await getCategoryStore.getCategory(widget.uid!);
        updateCategoryStore.setState(
          uid: getCategoryStore.state.uid,
          name: getCategoryStore.state.name,
          description: getCategoryStore.state.description,
        );
      }
    });
  }

  void action() async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final result = isNewCategory
        ? await createCategoryStore.createCategory()
        : await updateCategoryStore.updateCategory();

    if (result) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Sucesso')),
      );

      navigator.pop();
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            createCategoryStore.failure?.message ?? 'Erro ao criar',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewCategory ? 'Novo' : 'Editar'),
      ),
      body: Observer(
        builder: (context) {
          if (getCategoryStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextFormField(
                  initialValue: getCategoryStore.state.name,
                  decoration: const InputDecoration(
                    label: Text(
                      'Nome',
                    ),
                  ),
                  onChanged: (text) {
                    isNewCategory
                        ? createCategoryStore.setState(name: text)
                        : updateCategoryStore.setState(name: text);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: getCategoryStore.state.description,
                  decoration: const InputDecoration(
                    label: Text(
                      'Descrição',
                    ),
                  ),
                  onChanged: (text) {
                    isNewCategory
                        ? createCategoryStore.setState(description: text)
                        : updateCategoryStore.setState(description: text);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : action,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            isNewCategory ? 'Criar' : 'Salvar',
                          ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
