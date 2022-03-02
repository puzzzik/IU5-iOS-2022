//
//  CaptureLists.swift
//  LABS
//
//  Created by Ilya Murashko on 26.02.2022.
//

import Foundation

// Вы пытаетесь переспорить Шелдона, чье любимое число круче.
// Сейчас, какое бы число вы не загадали, Шелдон вас переспорит.
// Ваша задача - внимательно посмотреть на код и грамотно модернизировать замыкание setValueInFavouriteNumber.

// Подсказка: используйте capture list

// Решение кратко обоснуйте в блоке | Обоснование решения |.
// Например: /* Я сделал …, т.к. это красиво */

/* Здесь тоже наблюдается strong reference cycle, тк замыкание setValueInFavouriteNumber
использует self. Для избежания утечки памяти было использовано capture list с unowned self.
 unowned потому что self никогда не будет nil.
 Также было захвачено число number для того, чтобы функция convertToSheldonsFavoriteNumberIfNeeded
 не поменяла первоначального значения number.
 */


final class CaptureLists {
    
    var favouriteNumber = 0
    
    func disputeWithSheldonCooper(myFavouriteNumber: Int) {
        var number = myFavouriteNumber
        
        let setValueInFavouriteNumber: () -> () = { [unowned self, number] in
            self.favouriteNumber = number
        }
        
        let convertToSheldonsFavoriteNumberIfNeeded: () -> () = {
            guard number == 73 else {
                number = 73
                return
            }
        }
        
        convertToSheldonsFavoriteNumberIfNeeded()
        setValueInFavouriteNumber()
    }
}
