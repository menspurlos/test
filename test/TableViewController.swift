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
        FuncForAPI.funcForAPI.GetData {[weak self] dataAPI, error in
            guard let self = self else { return }
            if let dataAPI = dataAPI {
                self.docs = dataAPI
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            if error != nil {
                self.allertShow(text: "Отсутствует подключение к серверу или на сервере неккоректные данные", title: "Error")
            }
        }
    }

    @IBAction func tapButtonCreateDoc(_ sender: UIBarButtonItem) {
        FuncForAPI.funcForAPI.PostData {[weak self] dataAPI, error in
            guard let self = self else { return }
            if let dataAPI = dataAPI {
                self.allertShow(text: "document was created, number  \(dataAPI.first!.number)", title: "Create Doc")
                self.getDataAndReloadView()
            }
            if error != nil {
                self.allertShow(text: "Отсутствует подключение к серверу или на сервере неккоректные данные", title: "Error")
            }
        }
    }
    
    @IBAction func tapRefreshButton(_ sender: UIBarButtonItem) {
        self.getDataAndReloadView()
    }
}





