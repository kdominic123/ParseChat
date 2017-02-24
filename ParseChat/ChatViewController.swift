//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Kenan Dominic on 2/23/17.
//  Copyright © 2017 Kenan Dominic. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        
        cell.messageLabel.text = message["text"] as! String
        cell.usernameLabel.text = message["username"] as! String?
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    
    @IBAction func sendMessage(_ sender: Any) {
        
        let message = PFObject(className: "Message")
        let messageText = messageField.text
        message["text"] = messageText
        message["username"] = PFUser.current()!.username
        
        message.saveInBackground { (success: Bool, error: Error?) in
            
            if (success) {
                
                print(messageText!)
                self.messageField.text = ""
            }
            
            else {
                
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription as! String?, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                }
            }
        }
    }
    
    func onTimer() {
        // Add code to be run periodically
        
        let query = PFQuery(className:"Message")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    
                    self.messages = objects
                    
                }
            }
            
            else {
                
            }
        }
        self.tableView.reloadData()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
