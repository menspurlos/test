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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return docs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell


            cell.set(object: docs[indexPath.row])
            return cell
        
    }


    func getDataAndReloadView() {
        APIhttp.sharedAPI.GetDocs {[weak self] dataAPI in
            guard let self = self else { return }
            self.docs = dataAPI
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    func allertShow(number: String) {
        
        let alertController = UIAlertController(title: "Create Doc",
                                                message: "document was created, number  \(number)",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
 

    @IBAction func tapButtonCreateDoc(_ sender: UIBarButtonItem) {
        APIhttp.sharedAPI.create { dataAPI in
            self.allertShow(number: dataAPI[0].number)
            self.getDataAndReloadView()
        }
    }
    
    @IBAction func tapRefreshButton(_ sender: UIBarButtonItem) {
        self.getDataAndReloadView()
    }
}





