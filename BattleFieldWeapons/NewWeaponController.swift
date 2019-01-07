//
//  NewWeaponController.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/7.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit
import AVKit

class NewWeaponController: UITableViewController {
    
    @IBOutlet weak var textFieldMv: UITextField!
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        textFieldMv.text = Int(exactly: sender.value)!.description
    }
    
    var origin = [Origin]()
    var specs : WeaponSpecs!
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    var videoUrl: URL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        loadJson()
    }
    
    func loadJson() {
        let coder = JSONDecoder()
        
        do {
            let originUrl = Bundle.main.url(forResource: "origin", withExtension: "json")!
            let weaponSpecsUrl = Bundle.main.url(forResource: "weaponSpecs", withExtension: "json")!
            
            let originData = try Data(contentsOf: originUrl)
            let weaponSpecsData = try Data(contentsOf: weaponSpecsUrl)
            
            origin = try coder.decode([Origin].self, from: originData)
            specs = try coder.decode(WeaponSpecs.self, from: weaponSpecsData)
        } catch {
            print("Decode error: ", error)
        }
    }
    
    
    @IBAction func playVideo(_ sender: Any) {
        
        let playerVC = AVPlayerViewController()
        playerVC.player = AVPlayer(url: videoUrl)
        
        self.present(playerVC, animated: true) {
            playerVC.player?.play()
        }
    }
    
    
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

}
