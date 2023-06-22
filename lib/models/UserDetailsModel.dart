/// login : "towfiqulislam"
/// id : 23715132
/// node_id : "MDQ6VXNlcjIzNzE1MTMy"
/// avatar_url : "https://avatars.githubusercontent.com/u/23715132?v=4"
/// gravatar_id : ""
/// url : "https://api.github.com/users/towfiqulislam"
/// html_url : "https://github.com/towfiqulislam"
/// followers_url : "https://api.github.com/users/towfiqulislam/followers"
/// following_url : "https://api.github.com/users/towfiqulislam/following{/other_user}"
/// gists_url : "https://api.github.com/users/towfiqulislam/gists{/gist_id}"
/// starred_url : "https://api.github.com/users/towfiqulislam/starred{/owner}{/repo}"
/// subscriptions_url : "https://api.github.com/users/towfiqulislam/subscriptions"
/// organizations_url : "https://api.github.com/users/towfiqulislam/orgs"
/// repos_url : "https://api.github.com/users/towfiqulislam/repos"
/// events_url : "https://api.github.com/users/towfiqulislam/events{/privacy}"
/// received_events_url : "https://api.github.com/users/towfiqulislam/received_events"
/// type : "User"
/// site_admin : false
/// name : "MD TOWFQUL ISLAM"
/// company : null
/// blog : "https://www.linkedin.com/in/md-towfiqul-islam/"
/// location : "Tetoltala Road, Uttar badda, Dhaka"
/// email : null
/// hireable : true
/// bio : "Professional Android developer (Native & Cross Platform(Flutter))  Using Java, Kotlin & \r\nDart Language"
/// twitter_username : null
/// public_repos : 62
/// public_gists : 0
/// followers : 7
/// following : 0
/// created_at : "2016-11-24T06:54:20Z"
/// updated_at : "2023-06-16T17:33:47Z"

class UserDetailsModel {
  UserDetailsModel({
      String? login, 
      num? id, 
      String? nodeId, 
      String? avatarUrl, 
      String? gravatarId, 
      String? url, 
      String? htmlUrl, 
      String? followersUrl, 
      String? followingUrl, 
      String? gistsUrl, 
      String? starredUrl, 
      String? subscriptionsUrl, 
      String? organizationsUrl, 
      String? reposUrl, 
      String? eventsUrl, 
      String? receivedEventsUrl, 
      String? type, 
      bool? siteAdmin, 
      String? name, 
      dynamic company, 
      String? blog, 
      String? location, 
      dynamic email, 
      bool? hireable, 
      String? bio, 
      dynamic twitterUsername, 
      num? publicRepos, 
      num? publicGists, 
      num? followers, 
      num? following, 
      String? createdAt, 
      String? updatedAt,}){
    _login = login;
    _id = id;
    _nodeId = nodeId;
    _avatarUrl = avatarUrl;
    _gravatarId = gravatarId;
    _url = url;
    _htmlUrl = htmlUrl;
    _followersUrl = followersUrl;
    _followingUrl = followingUrl;
    _gistsUrl = gistsUrl;
    _starredUrl = starredUrl;
    _subscriptionsUrl = subscriptionsUrl;
    _organizationsUrl = organizationsUrl;
    _reposUrl = reposUrl;
    _eventsUrl = eventsUrl;
    _receivedEventsUrl = receivedEventsUrl;
    _type = type;
    _siteAdmin = siteAdmin;
    _name = name;
    _company = company;
    _blog = blog;
    _location = location;
    _email = email;
    _hireable = hireable;
    _bio = bio;
    _twitterUsername = twitterUsername;
    _publicRepos = publicRepos;
    _publicGists = publicGists;
    _followers = followers;
    _following = following;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserDetailsModel.fromJson(dynamic json) {
    _login = json['login'];
    _id = json['id'];
    _nodeId = json['node_id'];
    _avatarUrl = json['avatar_url'];
    _gravatarId = json['gravatar_id'];
    _url = json['url'];
    _htmlUrl = json['html_url'];
    _followersUrl = json['followers_url'];
    _followingUrl = json['following_url'];
    _gistsUrl = json['gists_url'];
    _starredUrl = json['starred_url'];
    _subscriptionsUrl = json['subscriptions_url'];
    _organizationsUrl = json['organizations_url'];
    _reposUrl = json['repos_url'];
    _eventsUrl = json['events_url'];
    _receivedEventsUrl = json['received_events_url'];
    _type = json['type'];
    _siteAdmin = json['site_admin'];
    _name = json['name'];
    _company = json['company'];
    _blog = json['blog'];
    _location = json['location'];
    _email = json['email'];
    _hireable = json['hireable'];
    _bio = json['bio'];
    _twitterUsername = json['twitter_username'];
    _publicRepos = json['public_repos'];
    _publicGists = json['public_gists'];
    _followers = json['followers'];
    _following = json['following'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _login;
  num? _id;
  String? _nodeId;
  String? _avatarUrl;
  String? _gravatarId;
  String? _url;
  String? _htmlUrl;
  String? _followersUrl;
  String? _followingUrl;
  String? _gistsUrl;
  String? _starredUrl;
  String? _subscriptionsUrl;
  String? _organizationsUrl;
  String? _reposUrl;
  String? _eventsUrl;
  String? _receivedEventsUrl;
  String? _type;
  bool? _siteAdmin;
  String? _name;
  dynamic _company;
  String? _blog;
  String? _location;
  dynamic _email;
  bool? _hireable;
  String? _bio;
  dynamic _twitterUsername;
  num? _publicRepos;
  num? _publicGists;
  num? _followers;
  num? _following;
  String? _createdAt;
  String? _updatedAt;
UserDetailsModel copyWith({  String? login,
  num? id,
  String? nodeId,
  String? avatarUrl,
  String? gravatarId,
  String? url,
  String? htmlUrl,
  String? followersUrl,
  String? followingUrl,
  String? gistsUrl,
  String? starredUrl,
  String? subscriptionsUrl,
  String? organizationsUrl,
  String? reposUrl,
  String? eventsUrl,
  String? receivedEventsUrl,
  String? type,
  bool? siteAdmin,
  String? name,
  dynamic company,
  String? blog,
  String? location,
  dynamic email,
  bool? hireable,
  String? bio,
  dynamic twitterUsername,
  num? publicRepos,
  num? publicGists,
  num? followers,
  num? following,
  String? createdAt,
  String? updatedAt,
}) => UserDetailsModel(  login: login ?? _login,
  id: id ?? _id,
  nodeId: nodeId ?? _nodeId,
  avatarUrl: avatarUrl ?? _avatarUrl,
  gravatarId: gravatarId ?? _gravatarId,
  url: url ?? _url,
  htmlUrl: htmlUrl ?? _htmlUrl,
  followersUrl: followersUrl ?? _followersUrl,
  followingUrl: followingUrl ?? _followingUrl,
  gistsUrl: gistsUrl ?? _gistsUrl,
  starredUrl: starredUrl ?? _starredUrl,
  subscriptionsUrl: subscriptionsUrl ?? _subscriptionsUrl,
  organizationsUrl: organizationsUrl ?? _organizationsUrl,
  reposUrl: reposUrl ?? _reposUrl,
  eventsUrl: eventsUrl ?? _eventsUrl,
  receivedEventsUrl: receivedEventsUrl ?? _receivedEventsUrl,
  type: type ?? _type,
  siteAdmin: siteAdmin ?? _siteAdmin,
  name: name ?? _name,
  company: company ?? _company,
  blog: blog ?? _blog,
  location: location ?? _location,
  email: email ?? _email,
  hireable: hireable ?? _hireable,
  bio: bio ?? _bio,
  twitterUsername: twitterUsername ?? _twitterUsername,
  publicRepos: publicRepos ?? _publicRepos,
  publicGists: publicGists ?? _publicGists,
  followers: followers ?? _followers,
  following: following ?? _following,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get login => _login;
  num? get id => _id;
  String? get nodeId => _nodeId;
  String? get avatarUrl => _avatarUrl;
  String? get gravatarId => _gravatarId;
  String? get url => _url;
  String? get htmlUrl => _htmlUrl;
  String? get followersUrl => _followersUrl;
  String? get followingUrl => _followingUrl;
  String? get gistsUrl => _gistsUrl;
  String? get starredUrl => _starredUrl;
  String? get subscriptionsUrl => _subscriptionsUrl;
  String? get organizationsUrl => _organizationsUrl;
  String? get reposUrl => _reposUrl;
  String? get eventsUrl => _eventsUrl;
  String? get receivedEventsUrl => _receivedEventsUrl;
  String? get type => _type;
  bool? get siteAdmin => _siteAdmin;
  String? get name => _name;
  dynamic get company => _company;
  String? get blog => _blog;
  String? get location => _location;
  dynamic get email => _email;
  bool? get hireable => _hireable;
  String? get bio => _bio;
  dynamic get twitterUsername => _twitterUsername;
  num? get publicRepos => _publicRepos;
  num? get publicGists => _publicGists;
  num? get followers => _followers;
  num? get following => _following;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['id'] = _id;
    map['node_id'] = _nodeId;
    map['avatar_url'] = _avatarUrl;
    map['gravatar_id'] = _gravatarId;
    map['url'] = _url;
    map['html_url'] = _htmlUrl;
    map['followers_url'] = _followersUrl;
    map['following_url'] = _followingUrl;
    map['gists_url'] = _gistsUrl;
    map['starred_url'] = _starredUrl;
    map['subscriptions_url'] = _subscriptionsUrl;
    map['organizations_url'] = _organizationsUrl;
    map['repos_url'] = _reposUrl;
    map['events_url'] = _eventsUrl;
    map['received_events_url'] = _receivedEventsUrl;
    map['type'] = _type;
    map['site_admin'] = _siteAdmin;
    map['name'] = _name;
    map['company'] = _company;
    map['blog'] = _blog;
    map['location'] = _location;
    map['email'] = _email;
    map['hireable'] = _hireable;
    map['bio'] = _bio;
    map['twitter_username'] = _twitterUsername;
    map['public_repos'] = _publicRepos;
    map['public_gists'] = _publicGists;
    map['followers'] = _followers;
    map['following'] = _following;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}