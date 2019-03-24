//
//  ViewController.swift
//  SlideshowApp
//
//  Created by KUNI K on 2019/03/21.
//  Copyright © 2019 QQ201901. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var img1 = UIImage(named:"Image1")!
    var img2 = UIImage(named:"Image2")!
    var img3 = UIImage(named:"Image3")!
    
    var imageView: UIImage?
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var play: UIButton!
 

    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = [
        "Image1",
        "Image2",
        "Image3",
        ]
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
    
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        // 範囲より上を指している場合、最初の画像を表示
        else if dispImageNo > 2 {
            dispImageNo = 0
        }
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let imageView = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        image1.image = imageView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @objc func updateTimer(_ timer: Timer) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
   }
    
    @IBAction func Next(_ sender: Any) {
        //カウンターに1足して次の画像を表示させる
        dispImageNo = dispImageNo + 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()

    }
  
    @IBAction func Back(_ sender: Any) {
        //カウンターに1引いて次の画像を表示させる
        dispImageNo = dispImageNo - 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        if sender.titleLabel?.text == "再生"{
            sender.setTitle("停止", for: .normal)
        }
        else if sender.titleLabel?.text == "停止"{
            sender.setTitle("再生", for: .normal)
        }
    }
        
    @IBAction func Autoplay(_ sender: Any) {
        if self.timer == nil, play.titleLabel?.text == "再生" {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            Next.isEnabled = false
            Back.isEnabled = false
        }
        
        else if self.timer != nil, play.titleLabel?.text == "停止"  {
            self.timer?.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            Next.isEnabled = true
            Back.isEnabled = true
            }
        
    }

    @IBAction func TapAction(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController

        zoomViewController.originalImage = self.image1.image
    
        }
    
}
