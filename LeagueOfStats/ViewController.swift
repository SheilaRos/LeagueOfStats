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
    @IBOutlet weak var prueba: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func entrar(_ sender: UIButton) {
        invocador  = textoInvocador.text!.lowercased()
        var letras = [invocador.characters] as [String]
        var volcado =[String]()
        var cont = 0
        for i in 0...letras.count-1 {
            if (letras[i] != " ") {
                volcado[cont] = letras[i]
                cont += 1
            }
        }
        downloadPlayerId()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func downloadPlayerId(){
        let url = URL(string: "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/" + invocador + "?api_key=RGAPI-3a39327e-3d10-42c6-87b6-eb4ef96168a3")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200){
            do {
                let json = try JSONSerialization.jsonObject(with: data) as! [String:Any]
                let summoner = json[invocador] as! [String:Any]
                print(summoner)
                let id = summoner["id"]!
                print(id)
                self.prueba.text = "funca"
                
            } catch let error as NSError {
                print(error)
            }
            }else if(statusCode == 404){
                print("No existe el usuario")
            }else{
                print("Error desconocido")
            }
        }).resume()
        
    }

}

