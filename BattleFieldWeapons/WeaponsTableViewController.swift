//
//  WeaponsTableViewController.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/3.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit

class WeaponsTableViewController: UITableViewController {
    
    var weapons: [Weapon] = []
    
    func loadJson() {
        let coder = JSONDecoder()
        
        do {
            let url = Bundle.main.url(forResource: "weapons", withExtension: "json")!
            let data = try Data(contentsOf: url)
            weapons = try coder.decode([Weapon].self, from: data)
        } catch {
            print("Decode error: ", error)
        }
    }
    
    @IBAction func favBtnTap(_ sender: UIButton) {
        let btnPos = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = tableView.indexPathForRow(at: btnPos)!
        self.weapons[indexPath.row].favorite = !self.weapons[indexPath.row].favorite
        
        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        cell.favourite = self.weapons[indexPath.row].favorite
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(named: "theme")!
        ]
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(named: "theme")!
        ]
        
        loadJson()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favAction = UIContextualAction(style: .normal, title: "Like") { (_, _, completion) in
            
            self.weapons[indexPath.row].favorite = !self.weapons[indexPath.row].favorite
            
            let cell = tableView.cellForRow(at: indexPath) as! CardCell
            cell.favourite = self.weapons[indexPath.row].favorite
            
            completion(true)
        }
        favAction.backgroundColor = UIColor.purple
        favAction.image = UIImage(named: "fav")
        
        let config = UISwipeActionsConfiguration(actions: [favAction])
        return config
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completion) in
            
            self.weapons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // 收起滑动侧边栏
            completion(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (_, _, completion) in
            
            let text = "这是绝地求生中的\(self.weapons[indexPath.row].name)"
            let image = UIImage(named: self.weapons[indexPath.row].image)!
            
            let ac = UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
            
            // share for iPad
            if let pc = ac.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    pc.sourceView = cell
                    pc.sourceRect = cell.bounds
                }
            }
            
            self.present(ac, animated: true)
            
            completion(true)
        }
        shareAction.backgroundColor = UIColor.orange
        
        let config = UISwipeActionsConfiguration(actions: [delAction, shareAction])
        return config

    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weapons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = String(describing: CardCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CardCell
        
        cell.typeLabel.text = weapons[indexPath.row].type
        cell.weaponLabel.text = weapons[indexPath.row].name
        cell.originLabel.text = weapons[indexPath.row].origin
        cell.bkImgView.image = UIImage(named: weapons[indexPath.row].image)
        cell.favourite = weapons[indexPath.row].favorite

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showWeaponDetail" {
            let row = tableView.indexPathForSelectedRow!.row
            let destination = segue.destination as! DetailController
            destination.weapon = weapons[row]
        }
    }
    
    @IBAction func backToHome(segue: UIStoryboardSegue) {
        
    }

}
