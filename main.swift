//
//  main.swift
//  DEOl_22962906_Labo2_Etape2
//
//  Created by Lilian MAGALHAES on 2023-02-03.
//

import Foundation

//MARK: Menu
let str = "Bienvenue au jeu 'Deviner le Nombre !'"
let msgChoice = """

Choisissez votre type the partie a jouer:
1. Partie classique (Entre 1 et 100 en 10 coups);
2. Partie rapide (Entre 21 et 42 en 3 coups);
3. Entrer une partie manuellement.
"""
print("""
    \(str)
    \(msgChoice)
    """)

let res = readLine() ?? ""
if let choice = Int(res) {
    switch (choice) {
    case 1:
        let playStandard = Play(between: 1, and: 100, on: 10)
        playStandard.guessTheNumber()
    case 2:
        let playFast = Play(between: 21, and: 43, on: 3)
        playFast.guessTheNumber()
    case 3:
        let customParameters = chooseCustom()
        let playCustom = Play(between: customParameters.0, and: customParameters.1, on: customParameters.2 )
        playCustom.guessTheNumber()
    default:
        print("Entrée non valide.")
    }
} else {
    print("Entrée non valide.")
}


func chooseCustom() -> (Int, Int, Int) {
    print("Entrez un nombre min:")
    let min = readLine() ?? ""
    print("Entrez un nombre max:")
    let max = readLine() ?? ""
    print("Entrez un nombre max de coups:")
    let tries = readLine() ?? ""
    guard let nbMin = Int(min), let nbMax = Int(max), let nbTries = Int(tries) else {
        print("Les entrées doivent être des nombres entiers.")
        return (0, 0, 0)
    }
    if nbMin > nbMax {
        print( "le nombre min \(nbMin) doit etre plus petit que le nombre max \(nbMax)")
        return (0, 0, 0)
    }
    return (nbMin, nbMax, nbTries)
}
