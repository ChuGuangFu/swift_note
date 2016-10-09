//
//  main.swift
//  Swift_note
//
//  Created by 梁羽 on 16/9/27.
//  Copyright © 2016年 梁羽. All rights reserved.
//

import Foundation

//MARK: 常量，变量

//打印函数 print会自动换行
print("Hello, World!")
print("welcome to qianfeng")

//变量和常量
//符号：在代码文件里面用一些单词或由各种字符组成的字符串：abc love you _123a _abc 来表示一些符号，有事也叫标识符
//标识符：可以当变量名，函数名，类型名。。。
//变量：在代码中用标识符来表示一个数据，在程序运行时的内存空间中会有一个实体和这个表示服映射，这个表示服叫变量名，内存中的实体是变量的实体，一个变量名也叫一个实体的引用

var i :Int = 88 //定义一个int类型的变量 i

//常量：和变量的区别就是在定义之后不能再修改

let x : Int = 99

i = 111
//x = 111 报错 x是常量,不能被修改

//MARK: 数据长度
print(sizeof(Int)) //int的最大值为 2^63-1
print(Int.max) //int的最大值
print(Int.min) //int的最小值

//其他各种长度的整形
//Int8 8位有符号 做大7个1 -128~127
//UInt8 8位无符号 最大8个1 0-255
//Int16 16位有符号 最大15个1
//UInt16 16位无符号 最大16个1
//Int32 32位有符号 最大31个1
//UInt32 32位无符号 最大32个1
//Int64 64位有符号 最大63个1
//UInt64 64位无符号 最大64个1

//swift对数据类型会做越界检查
//var ix:Int8 = 128 //报错，溢出
var ix : Int8 = 127 //不报错
print(ix)
print("ix=\(ix)")

//MARK: 浮点型，字符型

//浮点类型
var f:Float = 1.23456789 //5位
print("f=\(f)")

var df:Double = 1.234567898765434555 //14位
print("df=\(df)")

//字符类型
var c:Character = "a"
//var c1:Character = "ab" //报错 “ab”包含两个字符  已经为字符串

var c1:Character = "你"
//var c2:Character = "你好" //"你好为两个字符"

print(c)
print("c1=\(c1)")

//MARK: unicode 编码 万国码

//unicode编码的范围 0x00000000 - 0x0010ffff
//unicode存储的缺点：浪费存储空间  优点：断字明确 可以每4个字节一断 没有用unicode存放在磁盘中的可能


/*
 swift中，字符串中的每个字符存放在内存中的实体其实就是该字符的unicode标量，字符串是多个字符的有序集合
 */

var c2:Character = "A"
//先创建一个 uncode标量 类型的数据
var uc:UnicodeScalar = UnicodeScalar(0x41);
//用一个unicode标量类型的数据uc
var c3:Character = Character(uc);

print("c2=\(c2)")
print("c3=\(c3)")

// \u{十六进制unicode值} 表示一个UnicodeScalar(uncode标量)类型的字面常量

//字符串：多个字符的有序集合
var s1:String = "ABC" //用字面常量赋值
var s2:String = "\u{41}\u{42}\u{43}"
print("s1=\(s1),s2=\(s2)")

var uc2:UnicodeScalar = "\u{41}"
print(uc2)
var c4:Character = "\u{41}"
print(c4)


//MARK:字符串
var s:String = "abc" //字符串变量
//抽象数据类型
//一种数据类型和基于此数据类型可做的操作

//操作集
// 1.遍历 对集合中的每个元素都访问且只访问一次， 字符串是字符的有序集合,要用循环来遍历
// 2.添加（插入、追加，合并）
// 3.删除（一个或多个字符）
// 4.查询字符串（有序子集）

//添加:
var s_2:String = "asdf"
s_2.append(Character("你"))
print("添加一个字符后：s_2:\(s_2)")
s_2.append(UnicodeScalar(0x41))
print("添加一个unicode标量后：s_2:\(s_2)")

//求字符串的字符个数(求字符集合中的元素数量)
let count:Int = s_2.characters.count
print("count=\(count)")

//删除
s_2.removeAtIndex(s_2.startIndex) //删除首个字符
print("删除首个字符后s_2=\(s_2)")
let footer = (s_2 as NSString).substringToIndex(3)
print("footer=\(footer)")

//布尔类型：(逻辑值类型) 真和假
// true false
var bl:Bool = true
var bl2:Bool = false
print("bl=\(bl),bl2=\(bl2)")

var bl3:Bool = s_2.containsString("你")
print("bl3=\(bl3)")

//合并两个字符串
var s3:String = "abc"
var s4:String = "def"
var s5:String = s3 + s4
print("s3和s4合并的结果：\(s5)")

//字符串复杂的操作得用循环语法
/*
 预习：
     1.运算符、表达式
     2.控制流（if，switch，for-in，while，repeat-while）
     3.补充字符串的一些复杂操作(遍历，插入，删除，求子串...,求范围)
 */


//MARK:类型推到、强转、可选类型

/*
 编译器的类型推导机制
   1.在定义变量时不写类型标注，由初始化的值来推导变量的类型  右推左
   2.字面常量赋给变量时，根据变量标注的类型来推导  左推右
   3.整形字面常量给无类型标注变量赋值时会执行默认推导（即为Int）
   4.浮点字面常量给无类型标注变量赋值时会执行默认推导（即为Double）
   5.推导的机制发生在编译时，而不是运行时 
      解释：即原来我们需要写类型标注再编译有了推导，程序员可以省略类型标注，由编译器在编译时加上类型标注
 */

var i1:Int = 8
var j = i1 //j被推导为Int类型

var k = 8 //8是一个整形字面常量，默认被推导为Int类型的常量，继而 k 也被推导为Int类型
var m:Int8 = 8 //8被推导为Int8类型


var f1 = 1.5 //(默认推导为Double)

/*
 字面常量
    整形字面常量  8
    浮点字面常量  1.5
    字符字面常量  “d”
    字符串字面常量  “asd”
 */

/*
 类型别名：给现有类型取别名的语法：
    typealias 新类型名 = 现有类型名
 */

typealias newType = Int
var x2:newType = 88  //newTppe是一个新的类型名，本质还是代表Int类型

/*
 类型强转：
    Int8 -> Int16 -> Int32 -> Int64 -> Int
    Int -> Float ->Double
 */
var i8:Int8 = 8
var i16:Int16 = Int16(i8) //理解为类型强转
//  c中 short i16 = (short)i8;
//  c++中 short i16 = short(i8);

/*
 数据类型的可空机制（可选机制）
 如果某个变量可能为空，即没有实体映射，这个变量必须定义为可空类型
 var wife:Girl = 美女实体
 这个wife不能简单定义为Girl类型，必须为可空的Girl类型：Optional<Girl>，可简写为：Girl？
 */

var ni:Int? = 5 //ni有一个实体映射
print("ni=\(ni)")
print("解析ni=\(ni!)")
ni = nil  //nil表示空，即没有实体
print("附空后ni=\(ni)")

//报错  ni是 Int？类型 3是Int类型  两个类型不匹配，不能做加法
//var r:Int = ni+3

//可空类型的理解：
//原来的类型为Int 但是Int必须有值
//而Int？可以理解为一个包装盒，盒子里可能有Int 可能没Int（为空）
//对可选类型做解析才能得到实体且有可能失败，因为可选类型可能为nil

//此处会导致程序崩溃，因为解析可选失败
//print("ni=\(ni!)")  // ！ 表示解析可选





















