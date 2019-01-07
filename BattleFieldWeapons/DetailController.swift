//
//  DetailController.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/5.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit

class DetailController: UITableViewController {

    @IBOutlet weak var headerImageView: UIImageView!
    var weapon : Weapon!
    var headerView : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerImageView.image = UIImage(named: weapon.image)
        navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor(named: "theme")
        
        // 重新定义table header
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
    }

//    // 设置状态栏字体颜色为白色
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    // 实现图片视差动画
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        headerView.frame = CGRect(x: 0, y: offsetY, width: scrollView.bounds.width, height: -offsetY )
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = String(describing: DetailCell.self )
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailCell

        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = weapon.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = weapon.type
        case 2:
            cell.fieldLabel.text = "Origin"
            cell.valueLabel.text = weapon.origin
        case 3:
            cell.fieldLabel.text = "Bullet"
            cell.valueLabel.text = weapon.bullet.description
        case 4:
            cell.fieldLabel.text = "Muzzle Velocity"
            cell.valueLabel.text = weapon.mv.description
        default:
            cell.fieldLabel.isHidden = true
            cell.valueLabel.text = weapon.text
        }
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBAction func backToDetail(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            weapon.rating = rating
            ratingBtn.setTitle("打分：\(rating)星", for: .normal)
        }
    }

}
