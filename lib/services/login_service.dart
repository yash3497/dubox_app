import '../utils/keys.dart';
import 'local_storage.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    String userId = DateTime.now().millisecondsSinceEpoch.toString();

    await LocalStorage.save(DbKeys.userId, userId);
    await LocalStorage.save(DbKeys.email, username);
    await LocalStorage.save(DbKeys.password, password);
    return true;
  }
}
