//
//  WelcomeView.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 22/10/24.
//

import UIKit

final class WelcomeView: UIView {
    
    var backgroundImage = UIImageView()
    var logoImage = UIImageView()
    let appName = UILabel()
    let appDescription = UILabel()
    let welcomeButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WelcomeView {
    private func addBackgroundImage() {
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = CFImage.bgwelcome
        backgroundImage.contentMode =  .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
    }
    
    private func addlogoImage() {
        addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode =  .scaleAspectFit
        logoImage.image = CFImage.logo
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func addAppName() {
        addSubview(appName)
        appName.translatesAutoresizingMaskIntoConstraints = false
        appName.text = "CineFlow"
        appName.font = .systemFont(ofSize: 24, weight: .semibold)
        appName.textColor = .white
        
        NSLayoutConstraint.activate([
            appName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func addAppDescription() {
        addSubview(appDescription)
        appDescription.translatesAutoresizingMaskIntoConstraints = false
        appDescription.text = "Cadastre todos os seus filmes e séries já assistidas, com comentários, notas e muito mais... Vamos lá?"
        appDescription.font = .systemFont(ofSize: 14, weight: .regular)
        appDescription.textColor = .white
        appDescription.numberOfLines = 0
        appDescription.textAlignment = .center
        
        NSLayoutConstraint.activate([
            appDescription.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 20),
            appDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            appDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        ])
    }
    
    private func addWelcomeButton() {
        addSubview(welcomeButton)
        welcomeButton.translatesAutoresizingMaskIntoConstraints = false
        welcomeButton.setTitle("Vamos lá!", for: .normal)
        welcomeButton.setTitleColor(.white, for: .normal)
        welcomeButton.backgroundColor = CFColor.redE50914
        welcomeButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            welcomeButton.topAnchor.constraint(equalTo: appDescription.bottomAnchor, constant: 50),
            welcomeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            welcomeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            welcomeButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            welcomeButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension WelcomeView {
    private func addLayout() {
        addBackgroundImage()
        addlogoImage()
        addAppName()
        addAppDescription()
        addWelcomeButton()
    }
}
