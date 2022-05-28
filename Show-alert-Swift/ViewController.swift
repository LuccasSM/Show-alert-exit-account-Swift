//
//  ViewController.swift
//  Show-alert-Swift
//
//  Created by Luccas Santana Marinho on 28/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Toque", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Deseja sair da sua conta?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: {action in
            let navVC = UINavigationController(rootViewController: ViewTwo())
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .flipHorizontal
            self.present(navVC, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default))
        
        present(alert, animated: true)
    }
}
