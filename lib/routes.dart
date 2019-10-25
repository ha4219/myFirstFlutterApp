import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/pages/imageView.dart';

import 'package:my_first_flutter_app/pages/searachView.dart';

final routes = {
  '/' : (BuildContext) => SearchView(),
  '/search' : (BuildContext) => SearchView(),
  '/image' : (BuildContext) => ImageView(),
};