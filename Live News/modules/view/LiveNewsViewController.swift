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
        
//        Alamofire.request(Constants.URL).responseJSON { response in
////            print(response.request)  // original URL request
////            print(response.response) // HTTP URL response
////            print(response.data)     // server data
////            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
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
