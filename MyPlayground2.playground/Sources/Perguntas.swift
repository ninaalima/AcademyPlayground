import Foundation

import Foundation
import UIKit
import PlaygroundSupport

public class Questions{
    public let question: String
    
    public init(question: String){
        self.question = question
        
    }
    
    public static let shared =
    [
        Questions(question: "Qual seu estado de espírito hoje?" ),
        Questions(question: "Qual sua companhia?"),
        Questions(question: "Alguma ocasião especial?"),
        Questions(question: "E sobre o ambiente, em qual você se sentiria bem?"),
        Questions(question: "Qual a faixa de preço?"),
        Questions(question: "Procura um tipo específico de refeição?"),
        Questions(question: "O que procura em termos de sabor?"),

    ]
}

public class Cards {
    public let card1: String
    public let card2: String
    public let card3: String
    public let card4: String
    
    public init (card1: String, card2: String, card3: String, card4: String){
        self.card1 = card1
        self.card2 = card2
        self.card3 = card3
        self.card4 = card4
    }
    
    public static let shared =
    [
        Cards(card1: "Alegre", card2: "Calmo", card3: "Nada pra nada", card4: "Irritado"),
        Cards(card1: "Eu e eu mesmo", card2: "Um crush", card3: "A família", card4: "Alguns amigos"),
        Cards(card1: "Comemoração", card2: "Negócios", card3: "Date", card4: "Nada especial"),
        Cards(card1: "Em um espaço família", card2: "Em um lugar intimista", card3: "Em um lugar bem animado", card4: "Não tenho preferência"),
        Cards(card1: "$", card2: "$$", card3: "$$$", card4: "$$$$"),
        Cards(card1: "Almoço/Janta", card2: "Café da manhã/Brunch", card3: "Petiscos", card4: "Lanches"),
        Cards(card1: "Sabores do dia-a-dia", card2: "Sabores regionais", card3: "Sabores internacionais", card4: "Me surpreenda!"),
    ]
}


