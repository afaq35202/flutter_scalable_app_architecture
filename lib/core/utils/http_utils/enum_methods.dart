enum HttpMethod { get, post, put, delete, patch, head }

String methodToString(HttpMethod method) {
  switch (method) {
    case HttpMethod.get:
      return 'GET';
    case HttpMethod.post:
      return 'POST';
    case HttpMethod.put:
      return 'PUT';
    case HttpMethod.delete:
      return 'DELETE';
    case HttpMethod.patch:
      return 'PATCH';
    case HttpMethod.head:
      return 'HEAD';
  }
}
