//
//  ViewController.swift
//  LeagueOfStats
//
//  Created by DAM on 14/2/17.
//  Copyright © 2017 Sheila & Bilal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textoInvocador: UITextField!
    @IBOutlet weak var prueba: UILabel!
    var palabra = ""
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func entrar(_ sender: UIButton) {
        var invocador  = textoInvocador.text!.lowercased()
        var letras = Array(invocador.characters)
        var volcado = [Character]()
        for i in 0...letras.count-1 {
            if (letras[i] != " ") {
                volcado.append(letras[i])
            }
        }
        palabra = String(volcado)
        downloadPlayerId()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func downloadPlayerId(){
        let url = URL(string: "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/" + palabra + "?api_key=RGAPI-3a39327e-3d10-42c6-87b6-eb4ef96168a3")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200){
            do {
                let json = try JSONSerialization.jsonObject(with: data) as! [String:Any]
                let summoner = json[self.palabra] as! [String:Any]
                print(summoner)
                let getid = summoner["id"]!
                self.id = String(describing: getid)
                print(self.id)
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

