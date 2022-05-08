//
//  UnderWeightTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 12/04/22.
//

import UIKit

class UnderWeightTableViewController: UITableViewController {
    @IBOutlet weak var underweight: UILabel!
    @IBOutlet weak var whenis: UILabel!
    @IBOutlet weak var Risks: UILabel!
    @IBOutlet weak var Cause: UILabel!
    @IBOutlet weak var Treatment: UILabel!
    
//    var DetailunderWeight = [un]()
        var Detailed: Underweight?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()

    }

    func downloadJson()
    {
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/health-arcane.appspot.com/o/UnderWeight%202.json?alt=media&token=9b1209e7-8ab1-413c-b661-6b55374b0c87")

        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil else
            {
                print("error occured")
                return
            }
            print(data)
            var underWeightObject: Underweight?
            do {
                
                underWeightObject = try JSONDecoder().decode(Underweight.self, from: data)
                
                
            }
            catch
            {
                print("Error\(error)")
            }
            guard let sData = underWeightObject else
            {
                return
            }
            print("recieved data \(sData)")
            
            DispatchQueue.main.async {
                self.underweight.text = "\(underWeightObject!.underweight)"
                self.whenis.text = "\(underWeightObject!.when)"
                self.Risks.text = "\(underWeightObject!.risks)"
                self.Cause.text = "\(underWeightObject!.causes)"
                self.Treatment.text = "\(underWeightObject!.treatment)"
            }
            
            
            
            
            
            
            
        })
        task.resume()
        
            }
        }
    
    
    
    
    
    
    




    
    
    
    

