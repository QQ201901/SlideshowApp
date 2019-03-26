//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by KUNI K on 2019/03/23.
//  Copyright © 2019 QQ201901. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
        let viewController = self.presentingViewController as! ViewController

        self.dismiss(animated: true) {
            viewController.scheduledTimer()
        }
 
    }
    
    @IBOutlet weak var imagez: UIImageView!
    
    var originalImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        imagez.image = originalImage
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
