//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//adicionar uma fonte
        let cfURL = Bundle.main.url(forResource: "Raleway-Bold", withExtension: "ttf")! as CFURL
        let cfURL2 = Bundle.main.url(forResource: "Raleway-SemiBold", withExtension: "ttf")! as CFURL
        let cfURL3 = Bundle.main.url(forResource: "Raleway-Medium", withExtension: "ttf")! as CFURL

        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)
        CTFontManagerRegisterFontsForURL(cfURL3, CTFontManagerScope.process, nil)




class MyViewController : UIViewController {
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
//    }
    override func loadView() {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        view.backgroundColor = UIColor(patternImage: UIImage(named:"Background3.png")!)
        navigationController?.navigationBar.isHidden = true

        
        
    
        //labels
        let FraseHomelabel = UILabel()
        FraseHomelabel.frame = CGRect(x: 75, y: 270, width: 250, height: 24)
        FraseHomelabel.text = "Onde devo comer hoje?"
        FraseHomelabel.textColor = .white
        FraseHomelabel.font = UIFont(name: "Raleway-SemiBold", size:  20.0)
        
        let Brandinglabel = UILabel()
        Brandinglabel.frame = CGRect(x: 115, y: 100, width: 250, height: 24)
        Brandinglabel.text = "f l a v o r e s"
        Brandinglabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Brandinglabel.font = UIFont(name: "Raleway-Bold", size:  26.0)
    
        
        //buttons
        
        let Homebutton = UIButton()
        let HomeImage = UIImage(named: "Home.png")
        Homebutton.frame = CGRect (x: 59, y: 600, width: 25, height: 25)
        Homebutton.setBackgroundImage(HomeImage, for: .normal)
        
        let Savedbutton = UIButton()
        let SavedImage = UIImage(named: "Saved.png")
        Savedbutton.frame = CGRect (x: 179, y: 600, width: 19, height: 25)
        Savedbutton.setBackgroundImage(SavedImage, for: .normal)
        
        let Listbutton = UIButton()
        let ListImage = UIImage(named: "List.png")
        Listbutton.frame = CGRect (x: 293, y: 600, width: 20, height: 25)
        Listbutton.setBackgroundImage(ListImage, for: .normal)
        
        let Playbutton = UIButton()
        let PlayImage = UIImage(named: "Play.png")
        Playbutton.frame = CGRect (x: 175, y: 310, width: 33, height: 37)
        Playbutton.setBackgroundImage(PlayImage, for: .normal)
        Playbutton.addTarget(nil, action: #selector(touchedButton), for: .touchUpInside)
        
        
        view.addSubview(FraseHomelabel)
        view.addSubview(Homebutton)
        view.addSubview(Savedbutton)
        view.addSubview(Listbutton)
        view.addSubview(Playbutton)
        view.addSubview(Brandinglabel)
        
        
        self.view = view
        
         }
    
    @objc func touchedButton() {
        //print ("oi")
        navigationController?.pushViewController(questionsView, animated: true)
        //navigationController?.navigationBar.isHidden = false
        //show(questionsView, sender: nil)
        //present(questionsView, animated: false, completion: nil)
        
    }

    
}
  



class QuestionsViewController : UIViewController {
    
    let dadosperguntas: [Questions] = Questions.shared
    var dadosrespostas: [String] = []
    let dadoscards: [Cards] = Cards.shared
    var posicao = 0
    let Questionlabel = UILabel()
    let Card1 = UIButton()
    let Card2 = UIButton()
    let Card3 = UIButton()
    let Card4 = UIButton()
    let Backbutton =  UIButton()
        
    
    override public func loadView() {
        let questionsPage = UIView()
        questionsPage.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        questionsPage.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7882352941, blue: 0.8117647059, alpha: 1)
        
        
        //labels
        let Brandinglabel = UILabel()
        Brandinglabel.frame = CGRect(x: 117, y: 80, width: 250, height: 24)
        Brandinglabel.text = "f l a v o r e s"
        Brandinglabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Brandinglabel.font = UIFont(name: "Raleway-Bold", size:  26.0)
        
        
        Questionlabel.frame = CGRect(x: 48, y: 183, width: 290, height: 48)
        Questionlabel.text = dadosperguntas[0].question
        Questionlabel.textColor = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        Questionlabel.lineBreakMode = .byWordWrapping
        Questionlabel.numberOfLines = 2
        Questionlabel.textAlignment = .center
        Questionlabel.font = UIFont(name: "Raleway-SemiBold", size:  18.0)
        
        
        //images
        let imageboard = UIImage(named:"board.png")
        let Boardimage = UIImageView(image: imageboard)
        Boardimage.frame = CGRect(x: 0, y: 145, width: 376, height: 649)
        
        
        //buttons
        
        Backbutton.frame = CGRect (x: 140, y: 555, width: 86, height: 28)
        Backbutton.setTitle("< Anterior", for: .normal)
        Backbutton.titleLabel?.font = UIFont(name: "Raleway-Medium", size:  14.0)
        Backbutton.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1), for: .normal)
        Backbutton.setTitleColor(#colorLiteral(red: 0.3504138887, green: 0.6596341133, blue: 0.7256318927, alpha: 1), for: .highlighted)
        Backbutton.isHidden = true
        Backbutton.addTarget(nil, action: #selector(anterior), for: .touchUpInside)
        
        
        
        let Homebuttonblack = UIButton()
        let HomeImage = UIImage(named: "homeblack.png")
        Homebuttonblack.frame = CGRect (x: 59, y: 608, width: 25, height: 25)
        Homebuttonblack.setBackgroundImage(HomeImage, for: .normal)
        Homebuttonblack.addTarget(nil, action: #selector(inicio), for: .touchUpInside)
        
        let Savedbuttonblack = UIButton()
        let SavedImage = UIImage(named: "savedblack.png")
        Savedbuttonblack.frame = CGRect (x: 179, y: 608, width: 19, height: 25)
        Savedbuttonblack.setBackgroundImage(SavedImage, for: .normal)
        
        let Listbuttonblack = UIButton()
        let ListImage = UIImage(named: "listblack.png")
        Listbuttonblack.frame = CGRect (x: 293, y: 608, width: 20, height: 25)
        Listbuttonblack.setBackgroundImage(ListImage, for: .normal)
        
        
        //cards
        
        let SelectCardImage = UIImage(named: "cardselect.png")
        
        
        let CardImage1 = UIImage(named: "card.png")
        Card1.frame = CGRect (x: 36, y: 240, width: 135, height: 129)
        Card1.setBackgroundImage(CardImage1, for: .normal)
        Card1.setBackgroundImage(SelectCardImage, for: .highlighted)
        Card1.setTitle(dadoscards[0].card1, for: .normal)
        Card1.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1), for: .normal)
        Card1.titleLabel?.font = UIFont(name: "Raleway-Medium", size:  16.0)
        Card1.titleLabel?.lineBreakMode = .byWordWrapping
        Card1.titleLabel?.numberOfLines = 2
        Card1.titleLabel?.textAlignment = .center
        Card1.addTarget(nil, action: #selector(proximo), for: .touchUpInside)
        Card1.addTarget(nil, action: #selector(respostaA), for: .touchUpInside)
        
        
        let CardImage2 = UIImage(named: "card2.png")
        Card2.frame = CGRect (x: 205, y: 240, width: 135, height: 129)
        Card2.setBackgroundImage(CardImage2, for: .normal)
        Card2.setBackgroundImage(SelectCardImage, for: .highlighted)
        Card2.setTitle(dadoscards[0].card2, for: .normal)
        Card2.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1), for: .normal)
        Card2.titleLabel?.font = UIFont(name: "Raleway-Medium", size:  16.0)
        Card2.titleLabel?.lineBreakMode = .byWordWrapping
        Card2.titleLabel?.numberOfLines = 2
        Card2.titleLabel?.textAlignment = .center
        Card2.addTarget(nil, action: #selector(proximo), for: .touchUpInside)
        Card2.addTarget(nil, action: #selector(respostaB), for: .touchUpInside)
        
        
        
        let CardImage3 = UIImage(named: "card3.png")
        Card3.frame = CGRect (x: 36, y: 400, width: 135, height: 129)
        Card3.setBackgroundImage(CardImage3, for: .normal)
        Card3.setBackgroundImage(SelectCardImage, for: .highlighted)
        Card3.setTitle(dadoscards[0].card3, for: .normal)
        Card3.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1), for: .normal)
        Card3.titleLabel?.font = UIFont(name: "Raleway-Medium", size:  16.0)
        Card3.titleLabel?.lineBreakMode = .byWordWrapping
        Card3.titleLabel?.numberOfLines = 2
        Card3.titleLabel?.textAlignment = .center
        Card3.addTarget(nil, action: #selector(proximo), for: .touchUpInside)
        Card3.addTarget(nil, action: #selector(respostaC), for: .touchUpInside)
        
        
        let CardImage4 = UIImage(named: "card4.png")
        Card4.frame = CGRect (x: 205, y: 400, width: 135, height: 129)
        Card4.setBackgroundImage(CardImage4, for: .normal)
        Card4.setBackgroundImage(SelectCardImage, for: .highlighted)
        Card4.setTitle(dadoscards[0].card4, for: .normal)
        Card4.setTitleColor(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1), for: .normal)
        Card4.titleLabel?.font = UIFont(name: "Raleway-Medium", size:  16.0)
        Card4.titleLabel?.lineBreakMode = .byWordWrapping
        Card4.titleLabel?.numberOfLines = 2
        Card4.titleLabel?.textAlignment = .center
        Card4.addTarget(nil, action: #selector(proximo), for: .touchUpInside)
        Card4.addTarget(nil, action: #selector(respostaD), for: .touchUpInside)
        
            
        
        questionsPage.addSubview(Boardimage)
        questionsPage.addSubview(Questionlabel)
        questionsPage.addSubview(Brandinglabel)
        questionsPage.addSubview(Homebuttonblack)
        questionsPage.addSubview(Savedbuttonblack)
        questionsPage.addSubview(Listbuttonblack)
        questionsPage.addSubview(Backbutton)
        questionsPage.addSubview(Card1)
        questionsPage.addSubview(Card2)
        questionsPage.addSubview(Card3)
        questionsPage.addSubview(Card4)
        
        self.view = questionsPage
        }
    
    @objc func inicio() {
        let myViewController = MyViewController()
        show(myViewController, sender: nil)

    }
    
    @objc func proximo(){
            posicao = posicao + 1
            if posicao <= 6 {
                Questionlabel.text = dadosperguntas[posicao].question
                Card1.setTitle(dadoscards[posicao].card1, for: .normal)
                Card2.setTitle(dadoscards[posicao].card2, for: .normal)
                Card3.setTitle(dadoscards[posicao].card3, for: .normal)
                Card4.setTitle(dadoscards[posicao].card4, for: .normal)
                Backbutton.isHidden = false
                
                

           }

            else {
                
                let resultView = ResultViewController()
               navigationController?.pushViewController(resultView, animated: true)
                //print(dadosrespostas)
           }
    }
    
    @objc func respostaA(){
        dadosrespostas.append("A")
        //print("foiA")
    }
    
    @objc func respostaB(){
        dadosrespostas.append("B")
        //print("foiB")
    }
    
    @objc func respostaC(){
        dadosrespostas.append("C")
        //print("foiC")
    }
    
    @objc func respostaD(){
        dadosrespostas.append("D")
        //print("foiD")
    }
    
    @objc func anterior(){
        posicao = posicao - 1
        if posicao == 0 {
            Questionlabel.text = dadosperguntas[posicao].question
            Card1.setTitle(dadoscards[posicao].card1, for: .normal)
            Card2.setTitle(dadoscards[posicao].card2, for: .normal)
            Card3.setTitle(dadoscards[posicao].card3, for: .normal)
            Card4.setTitle(dadoscards[posicao].card4, for: .normal)
            Backbutton.isHidden = true
    }
        else {
            Questionlabel.text = dadosperguntas[posicao].question
            Card1.setTitle(dadoscards[posicao].card1, for: .normal)
            Card2.setTitle(dadoscards[posicao].card2, for: .normal)
            Card3.setTitle(dadoscards[posicao].card3, for: .normal)
            Card4.setTitle(dadoscards[posicao].card4, for: .normal)
            Backbutton.isHidden = false
            
        }
    }
    
        
    
}

class ResultViewController: UIViewController{
    override func loadView() {
        let resultPage = UIView()
        resultPage.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        resultPage.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7882352941, blue: 0.8117647059, alpha: 1)
        
        
        //labels
        let Brandinglabel = UILabel()
        Brandinglabel.frame = CGRect(x: 117, y: 80, width: 250, height: 24)
        Brandinglabel.text = "f l a v o r e s"
        Brandinglabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        Brandinglabel.font = UIFont(name: "Raleway-Bold", size:  26.0)
        
        let resultlabel = UILabel()
        resultlabel.frame = CGRect(x: 48, y: 183, width: 290, height: 48)
        resultlabel.text = "Aconselhamos visitar"
        resultlabel.textColor = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1607843137, alpha: 1)
        resultlabel.lineBreakMode = .byWordWrapping
        resultlabel.numberOfLines = 2
        resultlabel.textAlignment = .center
        resultlabel.font = UIFont(name: "Raleway-SemiBold", size:  18.0)
        
        let imageboard = UIImage(named:"board.png")
        let Boardimage = UIImageView(image: imageboard)
        Boardimage.frame = CGRect(x: 0, y: 145, width: 376, height: 649)
        
        //buttons

        let Homebuttonblack = UIButton()
        let HomeImage = UIImage(named: "homeblack.png")
        Homebuttonblack.frame = CGRect (x: 59, y: 608, width: 25, height: 25)
        Homebuttonblack.setBackgroundImage(HomeImage, for: .normal)
        Homebuttonblack.addTarget(nil, action: #selector(inicio), for: .touchUpInside)
        
        let Savedbuttonblack = UIButton()
        let SavedImage = UIImage(named: "savedblack.png")
        Savedbuttonblack.frame = CGRect (x: 179, y: 608, width: 19, height: 25)
        Savedbuttonblack.setBackgroundImage(SavedImage, for: .normal)
        
        let Listbuttonblack = UIButton()
        let ListImage = UIImage(named: "listblack.png")
        Listbuttonblack.frame = CGRect (x: 293, y: 608, width: 20, height: 25)
        Listbuttonblack.setBackgroundImage(ListImage, for: .normal)
        
        
        resultPage.addSubview(Boardimage)
        resultPage.addSubview(Brandinglabel)
        resultPage.addSubview(resultlabel)
        resultPage.addSubview(Homebuttonblack)
        resultPage.addSubview(Savedbuttonblack)
        resultPage.addSubview(Listbuttonblack)
        
               
        self.view = resultPage
    }
    
    @objc func inicio() {
    let myViewController = MyViewController()
        show(myViewController, sender: nil)}
}



let questionsView = QuestionsViewController()

let resultView = ResultViewController()

let myViewController = MyViewController()


//questionsView.modalPresentationStyle = .fullScreen

let navigations = UINavigationController(rootViewController: MyViewController())

//navigations.pushViewController(myView, animated: true)


    
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigations
