//
//  ViewController.swift
//  WineQualityApp
//
//  Created by Eric May on 6/15/17.
//  Copyright © 2017 ericmay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Defining Core ML models
    let redWine = redwine()
    let whiteWine = whitewine()
    
    //outlets
    @IBOutlet weak var wineType: UITextField!
    @IBOutlet weak var fixedAcidity: UITextField!
    @IBOutlet weak var volatileAcidity: UITextField!
    @IBOutlet weak var citricAcid: UITextField!
    @IBOutlet weak var residualSugar: UITextField!
    @IBOutlet weak var chlorides: UITextField!
    @IBOutlet weak var freeSulfurO2: UITextField! //O not 0
    @IBOutlet weak var totalSulfurO2: UITextField!
    @IBOutlet weak var density: UITextField!
    @IBOutlet weak var phLevel: UITextField!
    @IBOutlet weak var sulphateLevel: UITextField!
    @IBOutlet weak var alcoholPercentage: UITextField!
    @IBOutlet weak var wineQuality: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func calcWineQuality(_ sender: UIButton) {
        let wine = wineType.text
//        let fAcid = Double(fixedAcidity.text!)
//        let vAcid = Double(volatileAcidity.text!)
//        let citAcid = Double(citricAcid.text!)
//        let residSugar = Double(residualSugar.text!)
//        let chlor = Double(chlorides.text!)
//        let freS2 = Double(freeSulfurO2.text!)
//        let totS2 = Double(totalSulfurO2.text!)
//        let den = Double(density.text!)
//        let phL = Double(phLevel.text!)
//        let sulLevel = Double(sulphateLevel.text!)
//        let alcPer = Double(alcoholPercentage.text!)
        
        switch wine {
        case "red"?:
            guard let wineScore = try? self.redWine.prediction(fixedAcidity: Double(fixedAcidity.text!)!,volatileAcidity: Double(volatileAcidity.text!)!,citricAcid: Double(citricAcid.text!)!,residualSugar: Double(residualSugar.text!)!,chlorides: Double(chlorides.text!)!,freeSulfurO2: Double(freeSulfurO2.text!)!,totalSulfurO2: Double(totalSulfurO2.text!)!,density: Double(density.text!)!,pH: Double(phLevel.text!)!,sulphates: Double(sulphateLevel.text!)!,alcohol: Double(alcoholPercentage.text!)!) else {
                fatalError("Unexpected run time error during redwine.prediction")
                }
            let wineScoreNumber = wineScore.quality
            wineQuality.text = String(wineScoreNumber)
        case "white"?:
            guard let wineScore = try? whitewine.prediction(fixedAcidity: Double(fixedAcidity.text!)!,volatileAcidity: Double(volatileAcidity.text!)!,citricAcid: Double(citricAcid.text!)!,residualSugar: Double(residualSugar.text!)!,chlorides: Double(chlorides.text!)!,freeSulfurO2: Double(freeSulfurO2.text!)!,totalSulfurO2: Double(totalSulfurO2.text!)!,density: Double(density.text!)!,pH: Double(phLevel.text!)!,sulphates: Double(sulphateLevel.text!)!,alcohol: Double(alcoholPercentage.text!)!) else {
                fatalError("Unexpected run time error during whitewine.prediction")
            }
            let wineScoreNumber = wineScore.quality
            wineQuality.text = String(wineScoreNumber)
        default:
            wineQuality.text = "Wine not found"
        }
}
}
