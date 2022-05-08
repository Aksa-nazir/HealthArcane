//
//  aaTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 17/04/22.
//

import UIKit

class MentalTableViewController: UITableViewController {
    var diseases = [HeroStats]()
    
    let devCousesImages = [UIImage(named: "overweight"), UIImage(named: "a2"), UIImage(named: "a3"), UIImage(named: "a4"), UIImage(named: "a5"),UIImage(named: "a1"),UIImage(named: "a2"),UIImage(named: "a3"),UIImage(named: "a4"),UIImage(named: "a5")]
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson {
            self.tableView.reloadData()
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mentalTableViewCell
        let Images = self.devCousesImages[indexPath.row]
        cell.img.image = Images

        cell.textLabel?.text = diseases[indexPath.row].name
        
        
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.systemCyan.cgColor
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 14
        cell.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailss", sender: self)
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
//                    print("tuk")
                }
                catch {
                    print("json error")
                }
            }
        }.resume()
    }
}

   
