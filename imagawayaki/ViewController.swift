//
//  ViewController.swift
//  imagawayaki
//
//  Created by User on 2015/09/09.
//  Copyright (c) 2015年 mikan-laboratories. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    var cnt : Int = 0
    //Twitter投稿
    var myComposeView : SLComposeViewController!
    //不可ラベル
    @IBOutlet var cntLabel : UILabel!
    //画像
    @IBOutlet var imageView: UIImageView!
    var imageArray: [UIImage]! = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像設定
        imageArray.append(UIImage(named:"first.png")!)
        imageArray.append(UIImage(named:"second.png")!)
        imageArray.append(UIImage(named:"third.png")!)
        imageArray.append(UIImage(named:"forth.png")!)
        
        //背景設定
        self.view.backgroundColor = UIColor.blackColor()
        
    }
    
    @IBAction func resetBtnPressed(sender : AnyObject){
        cnt = 0
        cntLabel.text = String("不可\(cnt)個")
        imageChange()
    }
    
    @IBAction func saboru(){
        cnt += 1
        cntLabel.text = String("不可\(cnt)個")
        imageChange()
    }
    
    @IBAction func study(){
        cnt -= 1
        if cnt <= 0 {
            cnt = 0
        }
        cntLabel.text = String("不可\(cnt)個")
        imageChange()
    }
    
    private func imageChange(){
        if cnt < 5{
            imageView.image = imageArray[0]
        }
        else if cnt >= 5 && cnt < 15{
            imageView.image = imageArray[1]
        }
        else if cnt >= 15 && cnt < 50{
            imageView.image = imageArray[2]
        }
        else if cnt >= 50 {
            imageView.image = imageArray[3]
        }
    }

    @IBAction func onPostToTwitter(sender : AnyObject) {
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        myComposeView.setInitialText("今学期の不可は\(cnt)個\n#ふかうんと")
        let screenshot = ScreenCaptureUtil.take();
        myComposeView.addImage(screenshot)
        self.presentViewController(myComposeView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
