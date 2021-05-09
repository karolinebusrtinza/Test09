//
//  ViewModelPokemon.swift
//  test9
//
//  Created by mbtec22 on 5/9/21.
//  Copyright © 2021 Tecsup.com. All rights reserved.
//

import Foundation

class ViewModelPokemon {
    var refreshData = {
        () -> () in
    }
    var dataArrayPokemonList:[ListPokemon] = [] {
        didSet {
            refreshData()
        }
    }
    func getListPokemon(){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/%22)") else { return }
            URLSession.shared.dataTask(with: url){
            (data,response,error) in
            guard let data = data else { return }
            
            do{
            let resultApi = try JSONDecoder().decode(Pokedex.self, from: data)
            for pokemon in resultApi.results{
            self.dataArrayPokemonList.append(pokemon)
            }
            } catch let error as NSError{
            print(error.localizedDescription)
            }
            }.resume()
    }
}
