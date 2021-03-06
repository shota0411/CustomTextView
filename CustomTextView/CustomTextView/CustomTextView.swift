//
//  CustomTextView.swift
//  CustomTextView
//
//  Created by 松田翔大 on 2018/04/28.
//  Copyright © 2018年 松田翔大. All rights reserved.
//

import UIKit

public class CustomTextView: UITextView {
    
    // placeholder用のLabel
    public var placeholderLabel: UILabel?
    // placeholderの文言
    public var placeholder: String?
    // placeholderの色
    public var placeholderColor: UIColor?
    
    public init(frame:CGRect) {
        super.init(frame: frame, textContainer: nil)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func initialize() {
        NotificationCenter.default.addObserver(self, selector: #selector(TextChanged(noti:)), name: NSNotification.Name.UITextViewTextDidChange, object: nil)

        placeholderLabel = UILabel(frame: CGRect(x: 8, y: 8, width: self.bounds.size.width - 16, height: 0))
        placeholderLabel?.numberOfLines = 0
        placeholderLabel?.font = UIFont.systemFont(ofSize: 14)
        placeholderLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        // デフォルト設定
        self.placeholder = "プレースホルダー"
        self.placeholderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        // 枠線をつける
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.gray.cgColor
        
        //////////UIToolBarの設定////////////////////
        //キードードを閉じるボタンを作るためにツールバーを生成
        let toolBar = UIToolbar()
        
        //toolBarのサイズを設定
        toolBar.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        
        //画面幅に合わせるように設定
        toolBar.sizeToFit()
        
        //Doneボタンを右に配置するためのスペース
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        //textViewにツールバーを設定
        self.inputAccessoryView = toolBar
        
        //Doneボタン
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneButton))
        
        //ツールバーにボタンを設定
        toolBar.items = [space,doneButton]
        self.addSubview(placeholderLabel!)
    }
    
    public var PlaceHolderColor: UIColor? {
        get {
            return placeholderColor
        }
        set {
            placeholderColor = newValue
            if nil == placeholderColor {
                placeholderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
            }
            placeholderLabel?.textColor = placeholderColor
        }
    }
    
    public var placeHolder: String? {
        get {
            return placeholder
        }
        set {
            placeholder = newValue
            if nil == placeholder {
                placeholder = ""
            }
            // frameをリセットする
            placeholderLabel?.frame = CGRect(x: 8, y: 8, width: self.bounds.size.width - 16, height: 0)
            
            placeholderLabel?.text = placeholder
            placeholderLabel?.sizeToFit()
        }
    }
    
    // テキストが変更された際に呼ばれる
    @objc func TextChanged(noti:Notification) {
        if 0 == self.text.count {
            placeholderLabel?.isHidden = false
        }
        else {
            placeholderLabel?.isHidden = true
        }
    }
    
    //doneボタンを押した時の処理
    @objc func doneButton(){
        //キーボードを閉じる
        self.endEditing(true)
    }
    
}
