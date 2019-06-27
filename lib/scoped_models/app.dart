import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:gatrabali/models/feed.dart';
import 'package:gatrabali/models/user.dart';

class AppModel extends Model {
  List<Feed> feeds = <Feed>[];
  User currentUser;
  int selectedTabIndex;
  String whatIsChanged;
  Map<int, String> categories = {
    2: 'Badung',
    3: 'Bangli',
    4: 'Buleleng',
    5: 'Denpasar',
    6: 'Gianyar',
    7: 'Jembrana',
    8: 'Karangasem',
    9: 'Klungkung',
    10: 'Tabanan',
  };

  void setFeeds(List<Feed> feeds) {
    this.feeds = feeds;
    this.whatIsChanged = 'feeds';
    notifyListeners();
  }

  void setSelectedTabIndex(int index) {
    this.selectedTabIndex = index;
    this.whatIsChanged = 'selectedTabIndex';
    notifyListeners();
  }

  void setUser(User user) {
    this.currentUser = user;
    this.whatIsChanged = 'currentUser';
    print("currentUser SET: $user");
    notifyListeners();
  }

  static AppModel of(BuildContext ctx) =>
      ScopedModel.of<AppModel>(ctx, rebuildOnChange: false);
}