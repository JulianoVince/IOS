//
//  PacoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Juliano Campos on 14/11/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func styleCell(pacoteViagem:PacoteViagem){
        labelTitulo.text = pacoteViagem.viagem.titulo
        
        labelQuantidadeDeDias.text = "\(pacoteViagem.viagem.quantidadeDeDias) dias"
        
        labelPreco.text = "R$ \(pacoteViagem.viagem.preco)"
        
        imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
        
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.layer.masksToBounds = true
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255, green: 85.0/255, blue: 85.0/255, alpha: 1).cgColor
        layer.cornerRadius = 5
    }
}
