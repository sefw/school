//
//  ViewController.swift
//  NavigationDemo
//
//  Created by gdcp on 2018/3/28.
//  Copyright © 2018年 gdcp. All rights reserved.
//

import UIKit

var i = 1

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //编码方式实现多控制器的管理
        //1、设置当前视图控制的属性
        self.view.backgroundColor = UIColor.white
        self.title = "第\(i)个视图控制器"
        i += 1
        //2、在视图中添加一个按钮，单击按钮可以生成一个新的视图控制器
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 100, height: 44)
        btn.setTitle("push", for: .normal)
        
        btn.addTarget(self, action: #selector(push), for: .touchUpInside)
        
        self.view.addSubview(btn)
        //添加pop按钮
        let btn2 = UIButton(type: .system)
        btn2.frame = CGRect(x: 200, y: 100, width: 100, height: 44)
        btn2.setTitle("pop", for: .normal)
        
        btn2.addTarget(self, action: #selector(pop), for: .touchUpInside)
        
        self.view.addSubview(btn2)
    }
    
    //将新的视图控制器压入到栈中
    func push(){
        //创建新的视图控制器实例
        //注意：实例化ViewController类，目的是使创建的新的视图控制器有白色背景、按钮，单击按钮后又可以压栈
        let controller = ViewController()
        //将创建好的视图控制器压入到导航控制器中
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //出栈
    func pop(){
        //出栈，切换到上一层的视图控制器
        //self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }

    //当实例被销毁的时候自动调用析构函数
    deinit {
        i -= 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

