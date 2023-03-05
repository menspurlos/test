//
//  TableViewController.swift
//  test
//
//  Created by macBook on 02.03.2023.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {

    private var docs: [Documents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndReloadView()
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

            cell.set(object: docs[indexPath.row])
            return cell
        
    }


    func getDataAndReloadView() {
        FuncForAPI.funcForAPI.GetData {[weak self] dataAPI in
            guard let self = self else { return }
            self.docs = dataAPI
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
 

    @IBAction func tapButtonCreateDoc(_ sender: UIBarButtonItem) {
        FuncForAPI.funcForAPI.PostData {[weak self] dataAPI in
            guard let self = self else { return }
            self.allertShow(number: dataAPI.first!.number)
            self.getDataAndReloadView()
        }
    }
    
    @IBAction func tapRefreshButton(_ sender: UIBarButtonItem) {
        self.getDataAndReloadView()
    }
}





