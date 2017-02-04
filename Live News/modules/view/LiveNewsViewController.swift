//
//  LiveNewsViewController.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import UIKit
import Alamofire

class LiveNewsViewController: UIViewController, PresenterToViewProtocol {

    var presenter: ViewToPresenterProtocol?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    @IBOutlet weak var newsViewBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
//        if let unwrappedPresenter = presenter {
//            print("presenter not nil");
//            unwrappedPresenter.updateView();
//        } else {
//            print("presenter nil");
//        }
        
        presenter?.updateView();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    func showNewsHeadLine(news: String) {
        newsViewBox.text = news;
        print(news);
    }
    
    func showError() {
    }

}
