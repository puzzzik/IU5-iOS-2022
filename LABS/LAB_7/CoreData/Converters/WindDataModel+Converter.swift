//
//  WindDataModel+Converter.swift
//  LABS
//
//  Created by Иван Тазенков on 09.04.2022.
//

import CoreData

extension WindDataModel {
    static func convert(dto: WindData, into context: NSManagedObjectContext) -> WindDataModel {
        let model = WindDataModel(context: context)
        model.degree = dto.degree
        model.speed = dto.speed

        return model
    }

    func convertToDTO() -> WindData {
        WindData(speed: speed, degree: degree)
    }
}
