// 比如现在有个需求场景是用户先登录，登录成功后会获得用户ID，
// 然后通过用户ID，再去请求用户个人信息，获取到用户个人信息后，
// 为了使用方便，我们需要将其缓存在本地文件系统，代码如下：
//先分别定义各个异步任务

Future<String> login(String userName, String pwd) {
  //用户登录
  // return Future.value("id:1234");
  throw AssertionError("登录失败");
}

Future<String> getUserInfo(String id) {
  //获取用户信息
  return Future.value("userInfo:张三李四");
}

Future saveUserInfo(String userInfo) {
  // 保存用户信息

  return Future.value(userInfo);
}
/**
//回调地狱
可以感受一下，如果业务逻辑中有大量异步依赖的情况，
将会出现上面这种在回调里面套回调的情况，
过多的嵌套会导致的代码可读性下降以及出错率提高，
并且非常难维护，这个问题被形象的称为回调地狱（Callback Hell）。
回调地狱问题在之前JavaScript中非常突出，也是JavaScript被吐槽最多的点，
但随着ECMAScript6和ECMAScript7标准发布后，这个问题得到了非常好的解决，
而解决回调地狱的两大神器正是ECMAScript6引入了Promise，
以及ECMAScript7中引入的async/await。 
而在Dart中几乎是完全平移了JavaScript中的这两者：Future相当于Promise，
而async/await连名字都没改。接下来我们看看通过Future和async/await如何消除上面示例中的嵌套问题。
 */

callback_hell() {
  login("alice", "******").then((id) {
    //登录成功后通过，id获取用户信息
    getUserInfo(id).then((userInfo) {
      //获取用户信息后保存
      saveUserInfo(userInfo).then((userInfo) {
        //保存用户信息，接下来执行其它操作
        print(userInfo);
      });
    });
  });
}

//future妙用
future_run() {
  login("alice", "******").then((id) {
    return getUserInfo(id);
  }).then((userInfo) {
    return saveUserInfo(userInfo);
  }).then((userInfo) {
    //执行接下来的操作
    print(userInfo);
  }).catchError((e) {
    //错误处理
    print(e);
  });
}

asyn_wait_run() async {
    try {
      String id = await login("alice", "******");
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
      //执行接下来的操作
    } catch (e) {
      //错误处理
      print(e);
    }
  }
main() {
  asyn_wait_run();
}
