//
//  FirstViewController.swift
//  DeepLinkExample
//
//  Created by Egemen on 19.07.2020.
//  Copyright © 2020 Egemen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var parameters = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parameters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "parameter")!
        //        Hücrenin solda yer alan metinlerine dizimizdeki isimleri yerleştiriyoruz.
                cell.textLabel?.text = "kkey"
        //        Hücrenin sağda yer alan metinlerine dizimizdeki yaşları yerleştiriyoruz.
                cell.detailTextLabel?.text = "valll"
        //        Hücremiz hazır. Fonksiyona hücremizi çıktı olarak veriyoruz.
                return cell
    }
}

