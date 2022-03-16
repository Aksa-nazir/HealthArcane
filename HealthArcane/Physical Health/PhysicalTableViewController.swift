//
//  PhysicalTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 16/03/22.
//

import UIKit

class PhysicalTableViewController: UITableViewController {

    @IBOutlet weak var collectiobView: UICollectionView!
    
    @IBOutlet weak var underweight: UIButton!
    
    @IBOutlet weak var overweight: UIButton!
    
    @IBOutlet weak var clickhere: UIButton!
    
    var diseases = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson {
        self.collectiobView.reloadData()
        }
        
        underweight.layer.cornerRadius = 10
        overweight.layer.cornerRadius = 10
        clickhere.layer.cornerRadius = 10
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


extension PhysicalTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
                     return UICollectionViewCell()
                 }
        
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 12
        cell.name.text = diseases[indexPath.row].name
        return cell
    }
    
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return diseases.count
     }
     
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Pdetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PDetailTableViewController {
            destination.some2 = diseases[(collectiobView.indexPathsForSelectedItems?.last?.row)!]
           
        
            
        }
    }
    
    
    
    
}
