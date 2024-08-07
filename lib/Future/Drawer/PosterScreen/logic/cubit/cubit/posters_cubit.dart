import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/function/AlertDialog.dart';
import '../../../../../../core/function/function_api/upload_image.dart';
import '../../../data/repo.dart';
import 'posters_state.dart';

class PostersCubit extends Cubit<PostersState> {
  PostersCubit(this._posterRepo) : super(const PostersState.initial());
  final PosterRepo _posterRepo;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  File? file;
  String? image;

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
      emit(PostersState.erorrview(erorr: error.messege ?? ''));
    });
  }

  ///:AddPoster
  addPoster(BuildContext context) async {
    if (file == null) {
      return showMyDialog(context, "erorr", "please choose image");
    }
    if (formstate.currentState!.validate()) {
      emit(const PostersState.loadingAdd());
      final response =
          await _posterRepo.AddPoster(title.text, body.text, file!);
      response.when(success: (data) {
        emit(const PostersState.successAdd());
      }, failure: (error) {
        emit(PostersState.erorrAdd(erorr: error.messege ?? ''));
      });
    }
  }
}
