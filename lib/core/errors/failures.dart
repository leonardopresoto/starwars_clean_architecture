abstract class Failure {}

// General failures
class InvalidTextError extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
