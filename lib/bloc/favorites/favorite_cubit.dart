import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(super.initialState);

  favoriEkle(
      {required int id,
      required String photo,
      required String ad,
      required int sayi,
      required double fiyat}) {
    var suankiSepet = state.sepet;

    if (suankiSepet.any((element) => element["id"] == id)) {
      suankiSepet.firstWhere((element) => element["id"] == id)["count"]++;
    } else {
      suankiSepet.add({
        "id": id,
        "photo": photo,
        "name": ad,
        "in-stock": true,
        "count": sayi,
        "price": fiyat,
      });
    }

    final yeniDurum = FavoriteState(
      sepet: suankiSepet,
    );
    emit(yeniDurum);
  }

  favoridenCikart({required int id}) {
    var suankiSepet = state.sepet;

    suankiSepet.removeWhere((element) => element["id"] == id);

    final yeniDurum = FavoriteState(
      sepet: suankiSepet,
    );
    emit(yeniDurum);
  }

  sifirla() {
    final yeniDurum = FavoriteState(
      sepet: [],
    );
    emit(yeniDurum);
  }
}
