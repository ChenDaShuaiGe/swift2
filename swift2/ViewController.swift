//
//  ViewController.swift
//  swift2
//
//  Created by ssf-2 on 15-4-27.
//  Copyright (c) 2015年 CH. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,tabBarDelegate{
    
    var ctb :CustomTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ctb = CustomTabBar(frame: CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49))
        ctb.titleArr = ["a","b","c"]
        
        var firstVC : FirstViewController = FirstViewController()
        var secVC : SecViewController = SecViewController()
        var thirdVC : ThirdViewController = ThirdViewController()
        var fourthVC : FourthViewController = FourthViewController()
        
        ctb.viewControllers = [firstVC,secVC,thirdVC,fourthVC]
        
        ctb.clickBlock = changeVC//回调
        ctb.defaultVC = firstVC
        self.view.addSubview(ctb)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //回调方法实现
    func changeVC(nextVC: UIViewController) {
        self.view.addSubview(nextVC.view)
        self.view.bringSubviewToFront(ctb)
    }
    
    func initUI(){
        
        let tabBar = UITabBarController()
        let vc1    = FirstViewController()
        let vc2    = SecViewController()
        let vc3    = ThirdViewController()
        let vc4    = FourthViewController()
        let arr    = NSArray(objects: vc1,vc2,vc3,vc4)
        tabBar.setViewControllers(arr, animated:true)
        
        var str1 : NSString
        let str2 = NSString()
        
        
    }
    
    func getName(){
        let pi = 3.141592653 //声明常量
        var x = 0.0 //声明变量
        
        let oneMillion1 = 1_000_000
        let oneMillion2 = 0001000000
        var 程序员 :NSString = "bigGroup"
        let  ほん = "ほん"
        println(程序员+" in "+ほん)
        
        //断言
        let age0 = 2
//        assert(age0 >= 18, "不开心")
        
        let num1 = 3
        let num2 = 0.14
//        let sum = num1 +num2 //会报错
        let sum = Double(num1)+num2
        
        let hand = 2
        let age = 25
        let str = "我今年\(age)岁，有\(hand)只手"
        println(str)
        
        //元组
        var position = (10,20)
        var person :(Int ,String) = (20,"Jack")
        
        let (_,name) = person
        println(name)
        
        //解包  选择绑定
        if let num = "123".toInt(){
            println(num)
        }else{
            println("no number")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

