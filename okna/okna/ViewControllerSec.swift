//
//  ViewControllerSec.swift
//  okna
//
//  Created by Михаил Ионов on 23.12.2022.
//

import UIKit

class ViewControllerSec: UIViewController {
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "экран второй"
        view.addSubview(button)
        button.setTitle("еще экран", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 52)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    @objc private func didTapButton(){
        let vc = ViewControllerBill()
    
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


