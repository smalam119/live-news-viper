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

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewToPresenterProtocol?
    var news = [LiveNewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        presenter?.updateView()
        
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "LiveNewsTableViewCell", bundle: .main), forCellReuseIdentifier: "LiveNewsTableViewCell")
    }
}

extension LiveNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveNewsTableViewCell", for: indexPath) as? LiveNewsTableViewCell
        let row = indexPath.row
        let news = self.news[row]
        guard let title = news.title, let author = news.author, let description = news.description else {
            return cell ?? UITableViewCell()
        }
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UITableViewCell()
    }
}

extension LiveNewsViewController: UITableViewDelegate {
}

extension LiveNewsViewController: PresenterToViewProtocol {

	func showNews(news: [LiveNewsModel]) {
        self.news = news
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
