main() {
  print("hello world");
  future_then();
  future_catchError();
}

//Future.then
future_then() {
  Future.delayed(new Duration(seconds: 2), () {
    return "hi world!";
  }).then((data) {
    print(data);
  });
}

//Future.catchError
future_catchError() {
  Future.delayed(new Duration(seconds: 2), () {
    //return "hi world!";
    throw AssertionError("Error");
  }).then((data) {
    //执行成功会走到这里
    print("success");
  }).catchError((e) {
    //执行失败会走到这里
    print(e);
  });

  Future.delayed(new Duration(seconds: 2), () {
    //return "hi world!";
    throw Exception("Error2");
  }).then((data) {
    print("success");
  }, onError: (e) {
    print(e);
  });

  Future.delayed(new Duration(seconds: 2), () {
    //return "hi world!";
    throw AssertionError("Error");
  }).then((data) {
    //执行成功会走到这里
    print(data);
  }).catchError((e) {
    //执行失败会走到这里
    print(e);
  }).whenComplete(() {
    //无论成功或失败都会走到这里
    print("whenComplete");
  });
}

//Future.wait
future_wait() {
  Future.wait([
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    })
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });
}
