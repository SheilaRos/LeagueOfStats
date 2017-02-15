//
//  ViewController.swift
//  LeagueOfStats
//
//  Created by DAM on 14/2/17.
//  Copyright © 2017 Sheila & Bilal. All rights reserved.
//

import UIKit
var invocador = ""
class ViewController: UIViewController {
    @IBOutlet weak var textoInvocador: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func entrar(_ sender: UIButton) {
        invocador = textoInvocador.text!
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //dffg
    func downloadPlayerInfo(){
        let url = URL(string: "https://euw.api.pvp.net/api/lol/euw/v1.3/game/by-summoner/35968635/recent?api_key=RGAPI-3a39327e-3d10-42c6-87b6-eb4ef96168a3")
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: url!)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                
                
            }
        }
    }


}

