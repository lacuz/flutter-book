# 05Dart简介

## Dart单线程模型


## 变量和常量
* var 声明变量，可赋予不同类型的值；未初始化时，默认值为 null ，var变量一旦赋值，类型便会确定，则不能再改变其类型。
* const和final 声明常量，区别就是const 变量是一个编译时常量，final变量在第一次使用时被初始化。

## Object 和 dynamic
Object 是Dart所有对象的根基类，也就是说所有类型都是Object的子类(包括Function和Null)，所以任何类型的数据都可以赋值给Object声明的对象. dynamic与var一样都是关键词,声明的变量可以赋值任意对象。 而dynamic与Object相同之处在于,他们声明的变量可以在后期改变赋值类型。

dynamic与Object不同的是,dynamic声明的对象编译器会提供所有可能的组合, 而Object声明的对象只能使用Object的属性与方法, 否则编译器会报错。如: