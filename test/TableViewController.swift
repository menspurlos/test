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
    let ArrayStructOfDoc = [[Documents(type: "", number: "", date: "", status: true, delete: true, pred: "")],
                            CreateDoc(number: "")] as [Any]

    
    
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
        APIhttp.sharedAPI.APICall(method: .get) {[weak self] dataAPI in
            guard let self = self else { return }
            guard let dataAPI = dataAPI as? [Documents] else { return }
            self.docs = dataAPI
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
 

    @IBAction func tapButtonCreateDoc(_ sender: UIBarButtonItem) {
        APIhttp.sharedAPI.APICall(method: .post) {[weak self] dataAPI in
            guard let self = self else { return }
            guard let dataAPI = dataAPI as? [CreateDoc] else { return }
            self.allertShow(number: dataAPI[0].number)
            self.getDataAndReloadView()
        }
    }
    
    @IBAction func tapRefreshButton(_ sender: UIBarButtonItem) {
        self.getDataAndReloadView()
    }
}





