//
//  ResultsViewController.swift
//  ProjectManagmentProcesses
//
//  Created by Hector Andres Perez Villatoro on 2018-08-15.
//  Copyright © 2018 Hector Andres Perez Villatoro. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift // persistence

//ojo - cuando agregamos los resultados
//a REALM?

//adopt the protocols
class ResultsViewController: UIViewController{

    
    let realm = try! Realm()

    //passed on from question view so we can store stuff in realm.
    var testArea : String = ""
    var testProcess : String = ""
    
    var score : Float = 0.0  //passed from the question view controller.
    
    //only missing thing is the date of the test.
    
    //link the IBOUTLETS
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreLabel.text = String(format: "%.2f %%", score) //should we add a percent at the end?
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*@IBAction func logOutPressed(_ sender: UIButton) {
        
        do{
            try Auth.auth().signOut()
            
            //navigate back to the root view controller
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch{
            print("error, problem signign out")
        }
        
        
        
        
    }*/
    
    
    //so once the test is ended, an instance of TestData is saved to
    //realm.
    
    @IBAction func endTestPressed(_ sender: Any) {
        
        //persist the test details to realm using our TestData Class.
        //problems - changed the schema for the TestData Class
        //and that might bite me in the butt.
        
        do{
            try realm.write { // can throw. mark with try.
                let testData = TestData()  // no idea wtf
                testData.date = Date().description
                testData.testArea =  testArea
                testData.testProcess =  testProcess
                testData.testScore = score
                realm.add(testData)
                print("saved testData from Results Screen : date: \(testData.date) , area:\(testData.testArea),process:\(testData.testProcess), score: \(testData.testScore)")
            }
            
        }catch{
            print("Error creating (C) into realm")
        }
        
    }
    
    @IBAction func tryAgainPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
        //takes us to the login screen
        
        // what should happen
        // go to question screen again,
        // and have the question be the 1st one
        // of the set used then
        // e.g. all along the way
        //
        // probably store the test data somewhere
        // like - what area / process
        
    }
    
    @IBAction func backToMenuPressed(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
        
            //this actually takes us to the login screen.
            //problem... haahah.
       
    }
    
    
}
