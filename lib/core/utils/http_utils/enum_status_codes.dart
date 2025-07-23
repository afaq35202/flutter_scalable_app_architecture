enum HttpStatusCode {
  success(200),
  accepted(202),
  unauthorized(401),
  notFound(404),
  internalServerError(500);

  final int code;
  const HttpStatusCode(this.code);
}