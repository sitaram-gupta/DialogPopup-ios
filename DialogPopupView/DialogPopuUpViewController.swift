//
//  DialogPopuUpViewController.swift
//  DialogPopupView
//
//  Created by Sitaram Gupta on 8/14/21.
//

import UIKit

class DialogPopuUpViewController: UIViewController {
    
    @IBOutlet weak var imageViewBanner: UIImageView!
    @IBOutlet weak var dialogView: UIView!
    @IBAction func CancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("Clicked")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//        view.isOpaque = false
//        view.layer.cornerRadius = 20
//        view.clipsToBounds = true
        
        self.dialogView.layer.cornerRadius = 20
        self.dialogView.clipsToBounds = true
        
        self.imageViewBanner.layer.cornerRadius = 20
        self.imageViewBanner.clipsToBounds = true
        // Do any additional setup after loading the view.
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
