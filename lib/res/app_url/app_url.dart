

class AppUrl {

  static const String baseUrl = 'https://reqres.in' ;
  static const String loginApi = '$baseUrl/api/login' ;

  static const String userListApi = 'https://reqres.in/api/users?page=2' ;

  static const String moviesListApi = "https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/movies_list";

  static String searchUserApi(String userName){
    return "https://api.github.com/users/$userName";
  }

  static String gitUserRepoApi(String userName){
    return "https://api.github.com/users/$userName/repos";
  }

  static String sortedGitUserRepoApi(String userName,String sortOption,){
    return "https://api.github.com/users/$userName/repos?sort=$sortOption";
  }
}