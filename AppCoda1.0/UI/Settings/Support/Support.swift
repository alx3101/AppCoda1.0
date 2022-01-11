//
//  Support.swift
//  AppCoda1.0
//
//  Created by alex popa on 08/01/22.
//

import UIKit

class Support: UITableViewController {

    private var SDs = SD.createSDs()
    private let cellIdentifier: String = "tableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: Segue Method with informations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSettings",
            let indexPath = tableView?.indexPathForSelectedRow,
            let destinationViewController: DetailSettingsController = segue.destination as? DetailSettingsController {
            destinationViewController.SD = SDs[indexPath.row]
        }
    }
  
}


    extension Support {

        private func setupUI() {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
            navigationItem.title = "SDs"
            tableView.reloadData()
        }

    }

    // MARK: - UITableView DataSource

    extension Support {

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return SDs.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TableViewCell {
                cell.configurateTheCell(SDs[indexPath.row])
                return cell
            }
            return UITableViewCell()
        }

    }

    // MARK: - UITableView Delegate

   /* extension Support {

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                SDs.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .bottom)
            }
        } */


    // MARK: - Table view data source

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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


