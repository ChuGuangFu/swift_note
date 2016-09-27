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

