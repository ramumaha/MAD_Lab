class Logins{
  late final String username;
  late final String password;

  Logins({
    required this.username,
    required this.password
  });
  Logins.fromMap(Map<String,dynamic>result)
      :username= result['username'],
        password=result['password'];
  Map<String,Object>toMap(){
    return {
      'username':username,
      'password':password
    };
  }
}