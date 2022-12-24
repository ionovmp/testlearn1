//
//  ViewController.swift
//  okna
//
//  Created by Михаил Ионов on 23.12.2022.
//

import UIKit

class ViewController: UIViewController {
    let otstupLeft = 20

    var secondButton :UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Вход", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.sizeToFit()
        button.center = self.view.center
        button.addTarget(self , action: #selector(showButton(target:)), for: .touchUpInside)
        return button}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Начальный экран" // почему не отображает
        view.backgroundColor = .white
        view.addSubview(secondButton)
    
    
    }
    @objc private func showButton (target: UIButton) {
        let secondVC = ViewControllerSec()
        let navVC = UINavigationController(rootViewController: secondVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    }


