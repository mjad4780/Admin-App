import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/function/upload_image.dart';
import '../../../data/repo.dart';
import 'posters_state.dart';

class PostersCubit extends Cubit<PostersState> {
  PostersCubit(this._posterRepo) : super(PostersState.initial());
  PosterRepo _posterRepo;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  File? file;

  ///:chooseimagegaler
  chooseimagegaler() async {
    file = await imageuploadgallery();
    emit(const PostersState.galer());
  }

  ///:ViewPoster
  viewPoster() async {
    emit(const PostersState.loadingview());
    final response = await _posterRepo.ViewPoster();
    response.when(success: (dataPoster) {
      emit(PostersState.successview(dataPoster.data ?? []));
    }, failure: (error) {
      emit(PostersState.erorrview(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:AddPoster
  AddPoster(int count) async {
    emit(const PostersState.loadingAdd());
    final response = await _posterRepo.AddPoster(title.text, body.text, file!);
    response.when(success: (data) {
      emit(const PostersState.successAdd());
    }, failure: (error) {
      emit(PostersState.erorrAdd(erorr: error.apiErrorModel.messege ?? ''));
    });
  }
}
