import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texasgrill_app/blocs/categories/categories_bloc.dart';
import 'package:texasgrill_app/models/product_menu.dart';
import 'package:texasgrill_app/pages/menu/product_item_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  CategoriesBloc categoriesBloc = CategoriesBloc();
  int _itemSelected = 0;
  List<ProductMenu> productos = [];

  @override
  void initState() {
    super.initState();
    categoriesBloc.add(LoadCategoriesEvent());

    for (int c = 0; c <= 20; c++) {
      productos.add(ProductMenu());
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _itemSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc,
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedCategoriesState) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: Column(
                children: [
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 11, right: 8, bottom: 30, top: 20),
                            child: InkWell(
                              onTap: () {
                                _onItemTapped(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == _itemSelected
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.surface,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Center(
                                  child: Text(
                                    state.categories[index].nombre!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: index == _itemSelected
                                          ? Theme.of(context)
                                              .colorScheme
                                              .tertiary
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: productos.length,
                        itemBuilder: (context, index) {
                          int firstIndex =
                              index * 2; // Primer producto en la fila
                          int secondIndex =
                              firstIndex + 1; // Segundo producto en la fila

                          return Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ProductWidget(
                                      product: productos[firstIndex]),
                                ),
                                secondIndex < productos.length
                                    ? Expanded(
                                        child: ProductWidget(
                                            product: productos[secondIndex]),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Algo ha ocurrido"),
            );
          }
        });
  }
}
