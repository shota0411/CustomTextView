//
//  ViewController.swift
//  CustomTextView
//
//  Created by 松田翔大 on 2018/04/28.
//  Copyright © 2018年 松田翔大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let placeHolder: CustomTextView = CustomTextView.init(frame: CGRect(x: 10, y: 200, width: 300, height: 100))
        placeHolder.placeHolder = "プレースホルダー付きUITextView"
        placeHolder.PlaceHolderColor = UIColor.blue
        placeHolder.layer.cornerRadius = 30
        
        self.view.addSubview(placeHolder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

