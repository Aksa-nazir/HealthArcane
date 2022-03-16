//
//  AViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 12/03/22.
//

import UIKit

class AViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var diseases = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJson {
            self.tableView.reloadData()
        }
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = diseases[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TableViewController {
            destination.some =  diseases[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func downloadJson(completed: @escaping () -> ()){
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/health-arcane.appspot.com/o/MentalHealth.json?alt=media&token=2fc83e2f-fa7a-444f-b360-9daa37d197cc")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                    self.diseases = try JSONDecoder().decode([HeroStats].self, from: data!)
                
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("json error")
                }
            }
        }.resume()
        
    }
   

}
