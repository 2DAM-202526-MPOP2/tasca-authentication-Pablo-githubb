// lib/presentation/viewmodels/sentence_vm.dart
import 'dart:collection';

import 'package:flutter/material.dart';

import '../../data/models/sentence.dart';
import '../../data/repositories/sentence_repository.dart';

class SentenceVM extends ChangeNotifier {
  final ISentenceRepository _sentenceRepository;

  SentenceVM({required ISentenceRepository sentenceRepository})
    : _sentenceRepository = sentenceRepository {
    _initCurrent();
  }
  bool isLoading = false;
  // Internal State
  late Sentence _current;

  Sentence? _lastCreatedSentence;

  Future<void> _initCurrent() async {
    isLoading = true;
    _current = await _sentenceRepository.current;
    isLoading = false;
    notifyListeners();
  }

  // Getters
  Sentence get current => _current;
  UnmodifiableListView<Sentence> get history =>
      UnmodifiableListView(_sentenceRepository.history);
  UnmodifiableListView<Sentence> get favorites =>
      UnmodifiableListView(_sentenceRepository.favorites);
  Sentence? get lastCreatedSentence => _lastCreatedSentence;

  Future<void> next() async {
    _current = await _sentenceRepository.getNext();
    notifyListeners();
  }

  void toggleFavorite(Sentence sentence) {
    _sentenceRepository.toggleFavorite(sentence);
    notifyListeners();
  }

  bool isFavorite(Sentence pair) {
    return _sentenceRepository.isFavorite(pair);
  }

  void toggleCurrentFavorite() {
    toggleFavorite(_current);
  }

  Future<Sentence> createNewSentence(String text) async {
    isLoading = true;
    notifyListeners();
    Sentence newSentence = await _sentenceRepository.createSentence(text);

    _lastCreatedSentence = newSentence;

    isLoading = false;
    notifyListeners();

    return newSentence;
  }
}
