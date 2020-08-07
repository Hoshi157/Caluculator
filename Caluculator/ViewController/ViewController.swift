//
//  ViewController.swift
//  Caluculator
//
//  Created by 福山帆士 on 2020/08/06.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return label
    }()
    
    private let oneButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("1", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let twoButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("2", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let threeButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("3", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let fourButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("4", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let fiveButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("5", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let sixButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("6", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let sevenButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("7", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let eightButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("8", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let nineButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("9", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("+", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.8495727075, blue: 0.7504967889, alpha: 1)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("-", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6973881149, green: 0.9396796238, blue: 0.9764705896, alpha: 1)
        return button
    }()
    
    private let equalButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("=", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.980531322, green: 0.7862268936, blue: 1, alpha: 1)
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("AC", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    private let screen = UIScreen.main.bounds
    
    private let dispose = DisposeBag()
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        setupLabelObservable()
        
        setupButtonObservable()
    }
    
    func setupUI() {
        
        let buttonSize = (screen.width / 3)
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myLabel)
        let myLabelConstraints = [
            myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            myLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            myLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            myLabel.heightAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(myLabelConstraints)
        
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(oneButton)
        let oneButtonConstaraints = [
            oneButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 50),
            oneButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            oneButton.heightAnchor.constraint(equalToConstant: buttonSize),
            oneButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(oneButtonConstaraints)
        
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twoButton)
        let twoButtonConstraints = [
            twoButton.topAnchor.constraint(equalTo: oneButton.topAnchor),
            twoButton.leftAnchor.constraint(equalTo: oneButton.rightAnchor),
            twoButton.heightAnchor.constraint(equalToConstant: buttonSize),
            twoButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(twoButtonConstraints)
        
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(threeButton)
        let threeButtonConstraints = [
            threeButton.topAnchor.constraint(equalTo: oneButton.topAnchor),
            threeButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            threeButton.heightAnchor.constraint(equalToConstant: buttonSize),
            threeButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(threeButtonConstraints)
        
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fourButton)
        let fourButtonConstraints = [
            fourButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor),
            fourButton.leftAnchor.constraint(equalTo: oneButton.leftAnchor),
            fourButton.heightAnchor.constraint(equalToConstant: buttonSize),
            fourButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(fourButtonConstraints)
        
        fiveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fiveButton)
        let fiveButtonConstraints = [
            fiveButton.topAnchor.constraint(equalTo: fourButton.topAnchor),
            fiveButton.leftAnchor.constraint(equalTo: twoButton.leftAnchor),
            fiveButton.heightAnchor.constraint(equalToConstant: buttonSize),
            fiveButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(fiveButtonConstraints)
        
        sixButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sixButton)
        let sixButtonConstraints = [
            sixButton.rightAnchor.constraint(equalTo: threeButton.rightAnchor),
            sixButton.topAnchor.constraint(equalTo: fourButton.topAnchor),
            sixButton.heightAnchor.constraint(equalToConstant: buttonSize),
            sixButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(sixButtonConstraints)
        
        sevenButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sevenButton)
        let sevenButtonConstraints = [
            sevenButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor),
            sevenButton.leftAnchor.constraint(equalTo: oneButton.leftAnchor),
            sevenButton.heightAnchor.constraint(equalToConstant: buttonSize),
            sevenButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(sevenButtonConstraints)
        
        eightButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eightButton)
        let eightButtonConstraints = [
            eightButton.topAnchor.constraint(equalTo: sevenButton.topAnchor),
            eightButton.leftAnchor.constraint(equalTo: twoButton.leftAnchor),
            eightButton.heightAnchor.constraint(equalToConstant: buttonSize),
            eightButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(eightButtonConstraints)
        
        nineButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nineButton)
        let nineButtonConstraints = [
            nineButton.topAnchor.constraint(equalTo: sevenButton.topAnchor),
            nineButton.rightAnchor.constraint(equalTo: threeButton.rightAnchor),
            nineButton.heightAnchor.constraint(equalToConstant: buttonSize),
            nineButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(nineButtonConstraints)
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButton)
        let plusButtonConstraints = [
            plusButton.leftAnchor.constraint(equalTo: oneButton.leftAnchor),
            plusButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: buttonSize),
            plusButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(plusButtonConstraints)
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minusButton)
        let minusButtonConstraints = [
            minusButton.topAnchor.constraint(equalTo: plusButton.topAnchor),
            minusButton.leftAnchor.constraint(equalTo: twoButton.leftAnchor),
            minusButton.heightAnchor.constraint(equalToConstant: buttonSize),
            minusButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(minusButtonConstraints)
        
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(equalButton)
        let equalButtonConstraints = [
            equalButton.rightAnchor.constraint(equalTo: threeButton.rightAnchor),
            equalButton.topAnchor.constraint(equalTo: plusButton.topAnchor),
            equalButton.heightAnchor.constraint(equalToConstant: buttonSize),
            equalButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ]
        NSLayoutConstraint.activate(equalButtonConstraints)
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clearButton)
        let clearButtonConstraints = [
            clearButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            clearButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            clearButton.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(clearButtonConstraints)
    }
    
    func setupLabelObservable() {
        viewModel.relayNum.asObservable().bind(to: myLabel.rx.text).disposed(by: dispose)
    }
    
    func setupButtonObservable() {
        oneButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: String(1))
        }).disposed(by: dispose)
        
        twoButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "2")
        }).disposed(by: dispose)
        
        threeButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "3")
        }).disposed(by: dispose)
        
        fourButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "4")
        }).disposed(by: dispose)
        
        fiveButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "5")
        }).disposed(by: dispose)
        
        sixButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "6")
        }).disposed(by: dispose)
        
        sevenButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "7")
        }).disposed(by: dispose)
        
        eightButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "8")
        }).disposed(by: dispose)
        
        nineButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.ButtonPressed(inputNumSt: "9")
        }).disposed(by: dispose)
        
        clearButton.rx.tap.subscribe(onNext: { [unowned self] _ in
            self.viewModel.clearLabel()
        }).disposed(by: dispose)
        
        plusButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.plusButtonPressed()
            }).disposed(by: dispose)
        
        minusButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.minusButtonPressed()
            }).disposed(by: dispose)
        
        equalButton.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.viewModel.equalButtonPressed()
            }).disposed(by: dispose)
    }
    
    
}

