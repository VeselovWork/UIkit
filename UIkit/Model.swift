//
//  Model.swift
//  UIkit
//
//  Created by Andrey on 13.12.2022.
//

import Foundation

struct Marka {
    var id   : Int
    var name : String
}

struct Model {
    var id      : Int
    var markaId : Int
    var name    : String
}

class ModelData{
    
    var marks = [Marka]()
    var model = [Model]()
    var modelsByMark = [Model]()
    
    init (){
        setupData()
    }
    
    func setupData(){
        
        let marka1 = Marka(id: 1, name: "VAZ")
        let marka2 = Marka(id: 2, name: "Opel")
        let marka3 = Marka(id: 3, name: "Volvo")
        
        marks.append(marka1)
        marks.append(marka2)
        marks.append(marka3)
        
        let model1 = Model(id: 1, markaId: 1, name: "Priora")
        let model2 = Model(id: 2, markaId: 1, name: "Kalina")
        let model3 = Model(id: 3, markaId: 1, name: "Vesta")
        
        model.append(model1)
        model.append(model2)
        model.append(model3)
        
        let model21 = Model(id: 4, markaId: 2, name: "Astra")
        let model22 = Model(id: 5, markaId: 2, name: "Vektraa")
        let model23 = Model(id: 6, markaId: 2, name: "Zafira")
        
        model.append(model21)
        model.append(model22)
        model.append(model23)
                            
        let model31 = Model(id: 4, markaId: 3, name: "90")
        let model32 = Model(id: 5, markaId: 3, name: "60")
        let model33 = Model(id: 6, markaId: 3, name: "120")
                            
        model.append(model31)
        model.append(model32)
        model.append(model33)
        
        self.modelsByMark = getModels(markaId: marks.first!.id)
                            
    }
    
    func getModels(markaId: Int) -> [Model]{
        let models = self.model.filter { (m) -> Bool in
            m.markaId == markaId
        }
        return models
    }
}
