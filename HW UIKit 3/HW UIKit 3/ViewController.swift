
//  ViewController.swift
//  HW UIKit 3
//
//  Created by Михаил Ионов on 14.12.2022.
//

import UIKit
class ViewController: UIViewController {
    //MARK: переменные и константы
    let otstupLeft = 20
    let otstuoRight = 20
    let heigtButt = 20
    let heigtLable = 20
    lazy var nameLabel: UILabel = {
        let namelabel = UILabel ()
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.text = "Добрый день"
        return namelabel
   }()
    lazy var interNameButton: UIButton = {
        let button = UIButton (type: .contactAdd)
        button.setTitle("Ввод имени", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self , action: #selector(interName), for: .touchUpInside)
        return button
    }()
    lazy var buttonSumm :UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Подсчитать сумму 2 чисел", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.addTarget(self , action: #selector(showButton), for: .touchUpInside)
        return button
    }()
    lazy var summLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Результат"
        return label
    }()
    lazy var gameResultLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = nil
        return label
    }()
   
    //MARK:
    override func loadView() {
        super.loadView()
        view.addSubview(nameLabel)
        view.addSubview(interNameButton)
        setupButtonNameLabel()
        setupNameLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(buttonSumm)
        view.addSubview(summLabel)
        setupButtonSumm()// - вызываю определение места кнопки
        setupSummLabel()
    }
    //MARK: function
    func setupNameLabel (){
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(otstupLeft)).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat(otstuoRight)).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: CGFloat(heigtLable)).isActive = true
        nameLabel.backgroundColor = .blue
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
    }
    func setupButtonNameLabel (){
        interNameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(otstupLeft)).isActive = true
        interNameButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat(otstuoRight)).isActive = true
        interNameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        interNameButton.heightAnchor.constraint(equalToConstant: CGFloat(heigtButt)).isActive = true
        interNameButton.backgroundColor = .blue

    }
    func setupSummLabel (){ // определение местоположение надписи результата сложения
        summLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(otstupLeft)).isActive = true
        summLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat(otstuoRight)).isActive = true
        summLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        summLabel.heightAnchor.constraint(equalToConstant: CGFloat(heigtLable)).isActive = true
        summLabel.backgroundColor = .blue
        summLabel.textColor = .white
        summLabel.textAlignment = .center
    }
    func setupButtonSumm (){ // - определение местоположения кнопки
        buttonSumm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(otstupLeft)).isActive = true
        buttonSumm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -CGFloat(otstuoRight)).isActive = true
        buttonSumm.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        buttonSumm.heightAnchor.constraint(equalToConstant: CGFloat(heigtButt)).isActive = true
        buttonSumm.tintColor = .white
    }
    @IBAction func interName (){
        let name = UIAlertController(title: "ВВедите имя", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){(action) in
            let name = name.textFields?.first?.text
            self.nameLabel.text! = "рад вас видеть \(String(describing: name!))"
        }
        name.addTextField(){(text) in
            text.keyboardType = .default
        }
        name.addAction(action)
        self.present(name, animated: true)
        interNameButton.removeFromSuperview()
    }
   @IBAction func showButton (){ // - контроллер ввода числа
        let alertContrioller = UIAlertController(title: "ВВедите число", message: "число", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){ (action) in
            let numberOne = Int(alertContrioller.textFields?.first?.text ?? "0")
            let numberToo = Int(alertContrioller.textFields?.last?.text ?? "0")
            if numberOne != nil, numberToo != nil {
                self.summLabel.text = "Сумма 2 чисел = \(String(numberOne!+numberToo!))"
            }
            else {
                self.summLabel.text = "Введите числовые значения"
            }
        }
       alertContrioller.addTextField(){(TextField) in
           TextField.keyboardType = .numberPad
       }
       alertContrioller.addTextField(){(textField) in
           textField.keyboardType = .numberPad
       }
        alertContrioller.addAction(action)
        self.present(alertContrioller, animated: true)
    }
}


