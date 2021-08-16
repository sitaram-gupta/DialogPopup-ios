//
//  ViewController.swift
//  DialogPopupView
//
//  Created by Sitaram Gupta on 8/14/21.
//

import UIKit
import BLTNBoard

class ViewController: UIViewController {
    
    @IBOutlet weak var showView: UIButton!
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraints: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    
    private lazy var boardManager : BLTNItemManager = {
        let item = BLTNPageItem(title: "Push Notifications")
        item.image = UIImage(named: "black")
        item.actionButtonTitle = "Continue"
        item.alternativeButtonTitle = "Maybe Later"
        item.descriptionText = "Would you like to stay in the loog abd get notifications?"
        item.actionHandler = {_ in
            ViewController.didTapBoardCountinue()
        }
        item.alternativeHandler = {_ in
            ViewController.didTapBoardSkip()
        }
        
        
        item.appearance.actionButtonColor = .systemGreen
        item.appearance.alternativeButtonTitleColor = .gray
        
        return BLTNItemManager(rootItem: item)
    }()
    
    @IBOutlet var myButton: UIButton!
    
    @IBAction func PopupView(_ sender: Any) {
        //        let vc = storyboard?.instantiateViewController(identifier: "dialog_vc") as! DialogPopuUpViewController
        
        guard let vc = storyboard?.instantiateViewController(identifier: "dialog_vc") as? DialogPopuUpViewController else {
            return
        }
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.bottomView.layer.cornerRadius = 20
        self.bottomView.clipsToBounds = true
        
        self.showView.layer.cornerRadius = 20
        self.showView.clipsToBounds = true
    }
    
    @IBAction func didTapButton(){
        boardManager.showBulletin(above: self)
    }
    
    static func didTapBoardCountinue(){
        print("tap to conitnue")
    }
    
    
    static func didTapBoardSkip(){
        print("tap to skip")
    }
    
    private var isBottomSheetShown  = false
    
    @IBAction func clickedOnShowView(_ sender: Any) {
        if(isBottomSheetShown){
            self.showView.setTitle("Show View", for: .normal)
            UIView.animate(withDuration: 0.3, animations: {
                self.heightConstraints.constant = 0
                self.view.layoutIfNeeded()
            }){
                (status) in
                //Complettion Code
                self.isBottomSheetShown =  false
            }
        }else{
            self.showView.setTitle("Hide View", for: .normal)
            UIView.animate(withDuration: 0.3, animations: {
                self.heightConstraints.constant = 200
                self.view.layoutIfNeeded()
            }){
                (status) in
                //Complettion Code
                self.isBottomSheetShown = true
            }
        }
    }
}

