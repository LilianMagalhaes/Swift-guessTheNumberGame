import Foundation

public class Play {
    var nbMin: Int
    var nbMax: Int
    var nbTries: Int
    var randomNumber: Int
    
    init(between nbMin: Int, and nbMax: Int, on nbTries: Int) {
        self.nbMin = nbMin
        self.nbMax = nbMax
        self.nbTries = nbTries
        self.randomNumber = Int.random(in:  nbMin...nbMax)
    }
    
    func guessTheNumber() {
        for index in 1...self.nbTries {
            print("Entrez un nombre:")
            let res = readLine() ?? ""
            if let nb = Int(res) {
                if nb == self.randomNumber {
                    print("Gagné dans le coup \(index) de \(self.nbTries).")
                    break
                } else if nb > self.randomNumber {
                    print("Le nombre à deviner est plus petit.")
                    if index < self.nbTries {
                        print("Essayez à nouveau!")
                    }  else if index == self.nbTries {
                        print("Perdu")
                    }
                } else {
                    print("Le nombre à deviner est plus grand.")
                    if index < self.nbTries {
                        print("Essayez à nouveau!")
                    } else if index == self.nbTries {
                        print("Perdu")
                    }
                }
            }
            print("coup \(index) de \(self.nbTries).")
        }
    }
}
