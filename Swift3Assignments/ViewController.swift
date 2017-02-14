//
//  ViewController.swift
//  Swift3Assignments
//
//  Created by Fatin Wasta on 12/01/17.
//  Copyright © 2017 Fatin Wasta. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    var tasks : [Tasks]  = []
    
    override func viewDidLoad() {
        @IBOutlet weak var imgView: UIImageView!
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //get data from core data
        getData()
        
        //reload tableview
        listTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if(task.isImportant){
            
            cell.textLabel?.text = "😯\(task.name!)"

        }
        else{
            
            cell.textLabel?.text = task.name!

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if(editingStyle == .delete){
        
            let task = tasks[indexPath.row]
            context.delete(task)
            
            getData()
            
            listTableView.reloadData()
        }
    
    }
    func getData(){
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        do{
            tasks = try context.fetch(Tasks.fetchRequest())
        }
        catch{
            print("Fetching Failed.")
        }
    }
    
    
    
}

