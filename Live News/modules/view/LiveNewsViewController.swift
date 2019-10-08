//
//  LiveNewsViewController.swift
//  Live News
//
//  Created by MacBook Pro 13" on 1/28/17.
//  Copyright © 2017 pseudo0. All rights reserved.
//

import UIKit
import Alamofire

class LiveNewsViewController: UIViewController {

    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        presenter?.updateView();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}

extension LiveNewsViewController: PresenterToViewProtocol {

	func showNews(news: LiveNewsModel) {
        authorLabel.text = news.author;
        titleLabel.text = news.title;
        descriptionLabel.text = news.description;
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
