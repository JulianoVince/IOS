//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Juliano Campos on 14/11/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {

    @IBOutlet weak var colecaoPacotesViagens: UICollectionView! //Para criar esse atributo da classe apenas necessario selecionar a tecla control e arrastar collectionView até o codigo.
     let listaComViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
     var listaViagens:Array<PacoteViagem> = []
    
    
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorDePacotes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComViagens
        colecaoPacotesViagens.dataSource = self // Atribuindo delegante UICollectionViewDataSource
        colecaoPacotesViagens.delegate = self //Atribuido delegate de UICollectionViewDelegateFlowLayout
        pesquisarViagens.delegate = self //UISearchBarDelegate
        // Do any additional setup after loading the view.
        self.labelContadorDePacotes.text = self.atualizaContadorLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        
        let pacoteAtual = listaViagens[indexPath.item]
        
        celulaPacote.styleCell(pacoteViagem: pacoteAtual)
        
        
        return celulaPacote
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let larguraDaCelula = collectionView.bounds.width / 2 //        configura a altura e largura da célula.
//
//        return CGSize(width:larguraDaCelula-15, height:160)
        //Verifica Se ipad ou iphone
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width:collectionView.bounds.width/2-20, height:160) :
            CGSize(width:collectionView.bounds.width/2-20, height:250)
        
    }
    
    //Metodo responsavel por abrir nova view(Tela) ao cliclar no item da lista, passando o objeto da lista selecionado.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Busca no StoryBoard a main
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController // Informa um identificador pra tela que está sendo direcionada, nesse caso detalhes.
        
        controller.pacoteViagemSelecionado = pacote
//        self.present(controller, animated: true, completion: nil) //Semelhante ao StartActivity
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    /*
     Para utilizar o NSPredicate para filtrar um array,
     precisamos fazer um Bridging através da keyword as para acessar a API da classe NSArray do Objective C.
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComViagens
        
        if searchText != ""{
            let filtroViagem = NSPredicate(format:"viagem.titulo contains[cd] %@",searchText)
            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroViagem) as! Array
            listaViagens = listaFiltrada
        }
        
        
        self.labelContadorDePacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagens.reloadData()
    }
    
    func atualizaContadorLabel() -> String{
        return listaViagens.count == 1 ? "1 Pacote Encontrado": "\(listaViagens.count) pacotes encontrados"
    }
}
