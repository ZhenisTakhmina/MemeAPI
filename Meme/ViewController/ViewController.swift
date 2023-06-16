//
//  ViewController.swift
//  Meme
//
//  Created by Tami on 07.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    var memesVC = [Memes] ()
    var network = Networking()
    
    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //request network
        network.fetchData { MemeResponseModel in
            
            //success callback
            print("Meme response data \(MemeResponseModel)")
            //add success reponse to our memesVC
            self.memesVC.append(contentsOf: MemeResponseModel.data.memes)
            //posle uspeshnogo append, podgotovka tableView
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = 44
            self.tableView.reloadData()
            //register cell
            self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        } onFailure: { String in
            //faliure callback
            print("Error \(String)")
        }
        
    }

    
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count=\(memesVC.count)")
        return memesVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.meme = self.memesVC[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
}



