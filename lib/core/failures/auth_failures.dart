abstract class AuthFailure {}

class ServerFailure extends AuthFailure {}

class EmailAlreadyInUseFailure extends AuthFailure {}

class InvalidEmailAndPasswordCombinationFailure extends AuthFailure {}

class CancelledByUserFailure extends AuthFailure {}

class AccountExistsWithDifferentCredentialFailure extends AuthFailure {}

class InvalidCredentialFailure extends AuthFailure {}
