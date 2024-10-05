class MyDataRequest {
  MyDataRequest({
    this.id,
    this.page,
    this.slug,
    this.skip,
    this.except,
    this.pageSize,
  });

  String? id;
  int? page;
  String? slug;
  String? skip;
  String? except;
  int? pageSize;

  @override
  String toString() {
    return 'MyDataRequest{id: $id, page: $page, slug: $slug, skip: $skip, except: $except, pageSize: $pageSize}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'page': page,
      'slug': slug,
      'skip': skip,
      'except': except,
      'page_size': pageSize,
    };
  }

  factory MyDataRequest.fromMap(Map<String, dynamic> map) {
    return MyDataRequest(
      id: map['id'],
      page: map['page'],
      slug: map['slug'],
      skip: map['skip'],
      except: map['except'],
      pageSize: map['page_size'],
    );
  }
}

queryParams(MyDataRequest request) {
  Map<String, dynamic> queryParams = {};

  if (request.id != null) {
    queryParams.putIfAbsent('id', () => request.id);
  }
  if (request.page != null) {
    queryParams.putIfAbsent('page', () => request.page);
  }
  if (request.slug != null) {
    queryParams.putIfAbsent('slug', () => request.slug);
  }
  if (request.skip != null) {
    queryParams.putIfAbsent('skip', () => request.skip);
  }
  if (request.except != null) {
    queryParams.putIfAbsent('except', () => request.except);
  }
  if (request.pageSize != null) {
    queryParams.putIfAbsent('page_size', () => request.pageSize);
  }
  return queryParams;
}
