import 'package:flutter/material.dart';
import 'package:shopping_car/domain/products/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.accentColor,
      child: InkWell(
        onTap: () {
          // ExtendedNavigator.of(context).pushNoteFormPage(editedNote: note);
        },
        onLongPress: () {
          // final noteActorBloc = context.bloc<NoteActorBloc>();
          // _showDeletionDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.name.getOrCrash(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

}
