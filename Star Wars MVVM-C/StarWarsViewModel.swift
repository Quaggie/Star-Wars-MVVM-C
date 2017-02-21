//
//  StarWarsViewModel.swift
//  Star Wars MVVM-C
//
//  Created by Jonathan Bijos on 20/02/17.
//  Copyright © 2017 quaggie. All rights reserved.
//

import Foundation

class StarWarsViewModel {
    
    var isSearching = false
    var page: Int = 1
    var selectedType: StarWarsType = .person {
        didSet {
            delegate?.onTypeSelected(selectedType: selectedType)
        }
    }
    
    var data: Any? {
        didSet {
            guard let data = data else {
                return
            }
            if let data = data as? StarWarsObject<Person> {
                
            }
            if let data = data as? StarWarsObject<Film> {
                
            }
            if let data = data as? StarWarsObject<Starship> {
                
            }
            if let data = data as? StarWarsObject<Vehicle> {
                
            }
            if let data = data as? StarWarsObject<Specie> {
                
            }
            if let data = data as? StarWarsObject<Planet> {
                
            }
            
            delegate?.loadedData(data: data, finished: false)
        }
    }
    var delegate: StarWarsViewModelDelegate?
    
    init () {
        // Initialize the model?
        fetchFilms()
    }
    
    func fetchFilms () {
        Api.shared.fetchFilms { result in
            switch result {
            case .success(let starWarsObject):
                if let starWarsObject = starWarsObject {
                    print(starWarsObject)
                    self.data = starWarsObject
                }
                break
            case .failure(let error):
                // TODO: Show error
                print(error)
                break
            }
        }
    }
}











