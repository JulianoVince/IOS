//
//  DetalhesViagensViewController.swift
//  Alura Viagens
//
//  Created by Juliano Campos on 17/12/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    
   
    
    var pacoteViagemSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll(notification:)), name:.UIKeyboardWillShow, object: nil)
        if let pacote = pacoteViagemSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoViagem.text = pacote.viagem.preco
        }else{
            print("Erro ao receber pacote!")
        }
    }
    
    func aumentaScroll(notification:Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
//        self.dismiss(animated:true,completion:nil)
        if let navigation = navigationController{
            navigation.popViewController(animated:true)
        }
    }
    
    func exibeDataTextField(sender:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy"
        self.textFieldData.text = formatter.string(from: sender.date)
    }

    
    @IBAction func TextFieldEntrouEmFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func finalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        let controller = storyboard.instantiateViewController(withIdentifier:"ConfirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteViagemSelecionado
//        self.present(controller, animated: true,completion:  nil)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
