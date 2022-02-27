//
//  ArrayToString.swift
//  LABS
//
//  Created by Yury Bogdanov on 20.02.2022.
//

import Foundation

// ‼️ Все вычисления производить внутри функций ‼️

final class ArrayToStringConverter {
    // Функция получает на вход отсортированный массив, например [1,2,3,5,6,7,9,10,15]
    // Необходимо вернуть строку, сворачивая рядом стоящие элементы в блоки вида 1-3. Если элементов подряд нет, то элемент просто добавляется в строку.
    // Гарантируется, что:
    //  - в массиве нет отрицательных чисел
    //
    // Если в массиве нет элементов, то вернуть пустую строку ""
    // Пример:
    // на вход подаем: [1,2,3,5,6,7,9,10,15]
    // на выходе получаем: "1-3,5-7,9-10,15"
    // ================================
    // на вход подаем: [1,2,3,4,5,10,14,15,16,17,20]
    // на выходе получаем: "1-5,10,14-17,20"

    static func convertToString(array: [Int]) -> String {
        guard !array.isEmpty else {
            return ""
        }
        guard array.count > 1 else {
            return "\(array[0])"
        }

        var finalString = ""
        var firstNumberIndex: Int = .max
        var tempString = ""
        for i in 0..<array.count {
            if i < array.count - 1, array[i] + 1 == array[i + 1] {
                firstNumberIndex = min(firstNumberIndex, i)
                tempString = "\(array[firstNumberIndex])"
                continue
            }
            
            if i > 1, array[i] == array[i - 1] + 1 {
                tempString += "-\(array[i])"
            }
            else {
                tempString = "\(array[i])"
            }
            if i < array.count - 1 {
                tempString += ","
            }
            finalString += tempString
            tempString = ""
            firstNumberIndex = .max
        }
        return finalString
    }
}
