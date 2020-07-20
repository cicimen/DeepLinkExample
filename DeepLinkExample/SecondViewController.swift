//
//  SecondViewController.swift
//  DeepLinkExample
//
//  Created by Egemen on 19.07.2020.
//  Copyright © 2020 Egemen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var parameters = [String:String]()
    
    @IBOutlet weak var linkField: UITextField!
    
    @IBAction func goToLink(_ sender: Any) {
        if let urlString = linkField.text {
            Helper.openUrl(scheme: urlString)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parameters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = Array(parameters)[indexPath.item].key
        let value = parameters[key]
        let cell = tableView.dequeueReusableCell(withIdentifier: "parameter")!
        cell.textLabel?.text = key
        cell.detailTextLabel?.text = value
        return cell
    }
}
