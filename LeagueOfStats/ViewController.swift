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


}

