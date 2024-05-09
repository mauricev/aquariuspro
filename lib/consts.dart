const String kProgramName = 'Aquarius Pro';

const String kServerAddress = 'http://127.0.0.1:8090';

// problem what if there is more than one user?
// we would need an array of tokens
// and we would need to know how many tokens there are
// if user1 logs in, we get token1
// if user6 logs in, we get token6
// problem is we could have multiple valid tokens
// and we pick the first one
// but pretty much every web program assumes only one saved user
const String kAuthenticationInfo = "aquariusPro_authenticationInfo";

const String kUserName = 'username';
const String kPassword = 'password';
const String kLoginBtn = 'Login';
const String kBadLogin = "Login failed. Might you have entered the wrong credentials?";
const String kLogoutBtn = "Logout";