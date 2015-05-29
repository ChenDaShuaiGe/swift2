//
//  CustomTabBar.swift
//  swift2
//
//  Created by ssf-2 on 15-4-28.
//  Copyright (c) 2015年 CH. All rights reserved.
//

import UIKit

protocol tabBarDelegate{
    func changeVC(nextVC : UIViewController)
}

class CustomTabBar: UIView {
    
    
    var titleArr : NSArray{
        //改变前do
        willSet{
            
        }
        //改变后do
        didSet {
            for var i = 0; i<titleArr.count; i++ {
                var btn: AnyObject = btnMArr[i]
                btn.setTitle(titleArr[i] as NSString, forState: UIControlState.Normal)
            }
        }
    }//标题
    
    var imageArr : NSArray{
        didSet{
            for var i = 0; i<imageArr.count; i++ {
                var btn: AnyObject = btnMArr[i]
                btn.setImage(UIImage(named: imageArr[i] as NSString), forState: UIControlState.Normal)
            }
        }
    }//图片
    
    var backgroundImageArr : NSArray{
        didSet{
            for var i = 0; i<backgroundImageArr.count; i++ {
                var btn: AnyObject = btnMArr[i]
                btn.setBackgroundImage(UIImage(named: backgroundImageArr[i] as NSString), forState: UIControlState.Normal)
            }
        }
    }//背景图片
    
    var viewControllers : NSArray//
    var clickBlock : ((UIViewController)->Void)!//点击事件
    var defaultVC : UIViewController! {
        didSet{
            clickBlock(defaultVC)
        }
    }//默认VC
    
    private var btnMArr : NSMutableArray!
    private var lastTag : Int!
    
    enum BtnTag{
        case FirstTag(Int)
    }
    
    override init(frame: CGRect) {
        
        self.titleArr = NSArray()
        self.imageArr = NSArray()
        self.btnMArr = NSMutableArray()
        self.backgroundImageArr = NSArray()
        self.viewControllers = NSArray()
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blackColor()
        
        
        for var i = 0; i<4; i++ {
            
            let width : CGFloat = frame.size.width/4.0
            var xPosition : CGFloat = CGFloat(i)*width
            let btn = UIButton(frame: CGRectMake(xPosition, 0, width, frame.size.height))
            btn.setTitle(String(i+1), forState: UIControlState.Normal)
            btn.tag = i+10
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.setBackgroundImage(createImage(UIColor.redColor(), size: btn.frame.size), forState: UIControlState.Normal)
            btn.setBackgroundImage(createImage(UIColor.orangeColor(), size: btn.frame.size), forState: UIControlState.Selected)
            btn.addTarget(self, action: "click:", forControlEvents: UIControlEvents.TouchUpInside)
            addSubview(btn)
            if i == 0 {
                self.lastTag = btn.tag
                btn.selected = true
                
            }
            
            btnMArr.addObject(btn)
        }
    }
    
    //创建纯色图片
    func createImage(color:UIColor,size:CGSize) ->UIImage{
        let rect :CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context : CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    //buttonAction
    func click(btn : UIButton){
        if btn.tag != lastTag {
            (viewWithTag(lastTag) as UIButton).selected = false
            btn.selected = true
            lastTag = btn.tag
            
            let nextVC : UIViewController = self.viewControllers.objectAtIndex(btn.tag-10) as UIViewController
            println(nextVC)
            clickBlock(nextVC)
        }
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    //绘图
    override func drawRect(rect: CGRect) {
        // Drawing code
         let context :CGContextRef = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, rect.size.width, 0)
        CGContextSetStrokeColorWithColor(context, UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor)
        CGContextStrokePath(context)
        
    }
    

}
