//
//  DiffableTableViewController.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/18/21.
//

import UIKit

class DiffableTableViewController: UITableViewController {
    
    enum Section : String{
        case main
    }
    
    lazy var dataSource : UITableViewDiffableDataSource<Section,NSObject> =
        {
            let dSource : UITableViewDiffableDataSource<Section,NSObject> =
                UITableViewDiffableDataSource(tableView: self.tableView) { tv, indexPath, item in
                    let cell = tv.dequeueReusableCell(withIdentifier: TextTableViewCell.identifier, for: indexPath) as! TextTableViewCell
                    return cell
                }
            return dSource
        }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI(){
        tableView.dataSource = self.dataSource
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80.0
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.identifier)
        self.applyInitialSnapshot()
    }
    
    @objc func refreshTable(){
        // Add code to fetch data
        self.tableView.refreshControl?.beginRefreshing()
    }
    
}
extension DiffableTableViewController{
    func applyInitialSnapshot(){
        var items : [NSObject] = [NSObject()]
        var snapshot = NSDiffableDataSourceSnapshot<Section,NSObject>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot,animatingDifferences: true)
    }
    
    func applyNewSnapshot(_ items : [NSObject]){
        var snapshot = NSDiffableDataSourceSnapshot<Section,NSObject>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot,animatingDifferences: true)
    }
    
}

extension DiffableTableViewController{
    
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

}
