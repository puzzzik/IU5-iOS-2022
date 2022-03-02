//
//  ReferenceCycleResolver.swift
//  LABS
//
//  Created by Ilya Murashko on 25.02.2022.
//

import Foundation

// В реализации классов Student и University есть ошибка, приводящая к утечке памяти, найдите ее и исправьте.

// Решение кратко обоснуйте в блоке | Обоснование решения |.
// Например: /* Я сделал …, т.к. это красиво */

/*Так как здесь присутствует retain cycle, у одного из классов должна быть слабая ссылка
 вместо сильной. Здесь нет разницы, в каком именно классе делать ссылку слабой, пуст будет в University*/

final class Student {
    let name: String
    
    var university: University?
    
    init(name: String) {
        self.name = name
    }
}



final class University {
    let universityName: String
    
    weak var student: Student?
    
    init(universityName: String) {
        self.universityName = universityName
    }
}

final class ReferenceCycleResolver {
    static func universityAdmission(student: Student, to university: University) {
        student.university = university
        university.student = student
    }
}

