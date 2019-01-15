//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Juliano Campos on 14/01/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadeDePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var buttonVoltarPraHome: UIButton!
    
    var pacoteComprado:PacoteViagem? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado{
            self.imagemPacoteViagem.image = UIImage(named:pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelDataPacoteViagem.text = pacote.dataViagem
//            self.labelQuantidadeDePessoas.text = pacote.viagem.quantidadeDeDias
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            
            self.buttonVoltarPraHome.layer.cornerRadius = 8
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonVoltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController{
            navigation.popToRootViewController(animated: true)
        }
    }
}
