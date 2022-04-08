class Apis{
  //Base Url
  static const baseUrl ="http://platform.api.simpe.io/";

  //// Authentication Endpoints ////

  static const register = "v1/auth/register";
  static const regUsername = "v1/auth/register/username";
  static const configs = "v1/auth/register/configurations";

  //Account Access
  static const login = "v1/auth/login";
  static const loginValidate = "v1/auth/login/validate";

  //Recover Access
  static const recover = "v1/auth/recover";
  static const pin = "v1/auth/recover/pin";

  //Validate Access
  static const validate = "v1/auth/validate";

  //// Platform Endpoints ////

  //Users Endpoints
  static const users = "v1/users/";

  //Withdraw
  static const withdraw = "v1/withdraw";

  //Transactions
  static const transactions = "v1/transactions";

}