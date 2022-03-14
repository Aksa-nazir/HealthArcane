//
//  MentalViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 23/02/22.
//
//https://firebasestorage.googleapis.com/v0/b/health-arcane.appspot.com/o/locations%202.json?alt=media&token=bd974171-5950-4db7-9448-ec891a37b3a1
import UIKit

class MentalViewController: UIViewController {

    @IBOutlet weak var collectionView1: UICollectionView!
    
    
    
    var mentalArray =
    ["Anxiety Disorders","bipolar affective","Depression","Eating Disorders","Obsessive Compulsive Disorders","Paranoia","Psychosis","Shizophrenia","Post-traumatic Stress Order","Dissociation & Dissociative Disorders","Behavioural and Emotional disorders in childerns"]
  
    
    var descriptionArray = ["Anxiety disorders are a group of mental health problems. They include generalised anxiety disorders, social phobias, specific phobias (for example, agoraphobia and claustrophobia), and panic disorders. Depression is often related to anxiety disorders.Anxiety disorders are common mental health problems that affect many people. Approximately 25% of the population have an anxiety disorder that warrants treatment at some time in their life and up to another 25% have less severe anxieties such as fears of spider and snakes. Not all anxiety is a disorderEveryone experiences anxiety and fear at times – these are normal and helpful human emotions that help us deal with danger. However, some people experience excessive and irrational anxiety and worries that become ongoing and distressing, and that interfere with their daily lives. This may indicate an anxiety disorder. Often there appears to be no obvious or logical reason for the way the person feels. This may make an anxiety disorder even more worrying to the sufferer."]
    
    var symptomArray = ["Panic or anxiety attacks or a fear of these attacks Physical anxiety reactions – for example trembling, sweating, faintness, rapid heartbeat, difficulties breathing or nausea Avoidance behaviour – a person may go to extreme lengths to avoid a situation that they think could bring on anxiety or panic."]
    
  
    
    var typeDescriptionArray = ["Generalised anxiety disorder Social phobias – fear of social situations Specific phobias – for example a fear of open spaces (agoraphobia) or enclosed spaces (claustrophobia) Panic disorders – frequent and debilitating panic attacks."]
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
       
        // Do any additional setup after loading the view.
    }
    
    
 
    
    
    

}
extension MentalViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mentalArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Mental", for: indexPath) as? MentalCollectionViewCell
        cell?.MentalLabel.text = mentalArray[indexPath.row]
//        cell?.layer.borderWidth = 2
        cell?.layer.cornerRadius = 15
//        cell?.layer.borderColor = UIColor.systemBlue.cgColor
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedMentalTableViewController") as? DetailedMentalTableViewController
        
        vc?.name = mentalArray[indexPath.row]
        vc?.detail = descriptionArray[indexPath.row]
        vc?.symptom = symptomArray[indexPath.row]
        vc?.typeDescription = typeDescriptionArray[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
extension MentalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
        let bounds = collectionView1.bounds
        return CGSize(width: bounds.width/2 - 30, height: bounds.height / 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
