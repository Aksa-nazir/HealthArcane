//
//  OverWeightTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 04/04/22.
//

import UIKit

class OverWeightTableViewController: UITableViewController {
    @IBOutlet weak var DkeyFacts: UILabel!
    @IBOutlet weak var DwhatIsObesity: UILabel!

    @IBOutlet weak var DCause: UILabel!
        @IBOutlet weak var DConsequences: UILabel!
    @IBOutlet weak var Dreduced: UILabel!
//

    
    @IBOutlet var tabView: UITableView!
    var DetailObesityy = [Overweight]()
    var Detail: Overweight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        
      
    
        
        
    }
            
    func downloadJson()
    {
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/health-arcane.appspot.com/o/OverWeight.json?alt=media&token=2b1ea26c-17c5-4a20-af02-5448839d546a")

        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil else
            {
                print("error occured")
                return
            }
            print(data)
            var overWeightObject: Overweight?
            do {
                
                overWeightObject = try JSONDecoder().decode(Overweight.self, from: data)
                
                
            }
            catch
            {
                print("Error\(error)")
            }
            guard let sData = overWeightObject else
            {
                return
            }
            print("recieved data \(sData)")
            
            DispatchQueue.main.async {
                self.DkeyFacts.text = "\(overWeightObject!.Keyfacts)"
                self.DwhatIsObesity.text = "\(overWeightObject!.Whatareobesityandoverweight)"
                self.DCause.text = "\(overWeightObject!.Whatcausesobesityandoverweight)"
                self.DConsequences.text = "\(overWeightObject!.Whatarecommonhealthconsequencesofoverweightandobesity)"
                self.Dreduced.text = "\(overWeightObject!.Howcanoverweightandobesitybereduced)"
            }
            
            
            
            
            
            
            
        })
        task.resume()
        
            }
        }
    
    
    
    
    
    
    



