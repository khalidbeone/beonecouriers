import 'package:get_storage/get_storage.dart';


GetStorage box = GetStorage();


bool authingFunction (authKey) {
    box.write('authKey', authKey);
    return true;
}

bool isAuthed (){
  if (box.read('authKey') != ''){
    return true;
  }
  return false;
}

bool removeAuth(){
  if (box.read('authKey') !='' ){
    box.erase();
    return true;
  }
  return false;
}