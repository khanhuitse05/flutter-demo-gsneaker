import 'package:app/model/shoes.dart';
import 'package:app/repositories/user_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(data: UserPrefs.instance.getShoesList()));

  void saveData(List<Shoes> values) {
    emit(state.copyWith(data: values));
    UserPrefs.instance.setShoesList(values);
  }

  void updateProduct(Shoes item, int count) {
    final values = [...state.data];
    // if remove
    if (count <= 0) {
      values.removeWhere((e) => e.id == item.id);
      return saveData(values);
    }

    // if already content
    for (final e in values) {
      if (e.id == item.id) {
        e.count = count;
        return saveData(values);
      }
    }

    // if new item
    item.count = count;
    values.add(item);
    return saveData(values);
  }
}
