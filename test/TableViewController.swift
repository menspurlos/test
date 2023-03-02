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
        
        al()
     
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

        print (self.docs)
        cell.label.text = docs[indexPath.row].pred

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



func create() {
    
    
    let url = "http://5.130.157.177/CBBudzhet/hs/http"
    let dataPeredach: [String : Any] = ["ss": "2", "dd" : true]
    
    print (dataPeredach)
    
    AF.request(url,
               method: .post,
               parameters: dataPeredach,
               encoding: URLEncoding.default ,
               headers: nil,
               interceptor: nil
    ).validate().response { responce in

    
        switch responce.result {
        case .success(let data):
            do {
                let jsonData = try JSONDecoder().decode([CreateDoc].self, from: data!)
                print (jsonData[0].number)
                
            } catch {
                print (error.localizedDescription)
            }
        case.failure(let error): print (error.localizedDescription)
        }
    }
    
}

    func al ()  {
        
        // http://5.130.157.177/CBBudzhet/hs/http
        
        let url = "http://5.130.157.177/CBBudzhet/hs/http"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default ,
                   headers: nil,
                   interceptor: nil
        ).validate().response { responce in
            
            
            switch responce.result {
            case .success(let data):
                do {
                    self.docs = try JSONDecoder().decode([Documents].self, from: data!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print (error.localizedDescription)
                }
            case.failure(let error): print (error.localizedDescription)
            }
        }
    }

}


struct Documents: Codable {
    let type: String
    let number: String
    let date: String
    let status: Bool
    let delete: Bool
    let pred: String
    
}

struct CreateDoc: Codable {
    let number: String
}


