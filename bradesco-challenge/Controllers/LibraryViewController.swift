//
//  ViewController.swift
//  bradesco-challenge
//
//  Created by Nykolas Mayko on 15/09/19.
//  Copyright © 2019 Nykolas Mayko. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIVisualEffectView!
    
    
    var data: Array<Library> = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData(withLanguage: "swift", sort: "stars")
    }
    
    fileprivate func setupTableView(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lib-cell", for: indexPath) as! LibraryTableViewCell
        let lib = data[indexPath.row]
        
        cell.config(for: lib)
        
        return cell
            
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    fileprivate func getData(withLanguage language: String, sort: String){
        let libraryResource = LiraryResource(language: language, sort: sort)
        let libraryRequest = ApiRequest(resource: libraryResource)
        
        showActivity()
        libraryRequest.load { (libraries) in
            guard let libraries = libraries else{
                return
            }
            DispatchQueue.main.async {
                self.hideActivity()
                self.data = libraries
            }
        }
    }
    
    fileprivate func showActivity(){
        activityView.isHidden = false
    }
    
    fileprivate func hideActivity(){
        activityView.isHidden = true
    }


}

