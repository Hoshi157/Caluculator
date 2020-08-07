//
//  ViewModel.swift
//  Caluculator
//
//  Created by 福山帆士 on 2020/08/06.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    var relayNum = BehaviorRelay(value: "")
    
    private var plusIntArray: [Int] = []
    private var minusintArray: [Int] = []
    
    func ButtonPressed(inputNumSt: String) {
        let newNmSt = relayNum.value + inputNumSt
        relayNum.accept(newNmSt)
    }
    
    func clearLabel() {
        plusIntArray = []
        minusintArray = []
        relayNum.accept("")
    }
    
    func plusButtonPressed() {
        let currentNumSt = relayNum.value
        guard let currentNum = Int(currentNumSt) else {
            print("return")
            return
            
        }
        plusIntArray.append(currentNum)
        
        relayNum.accept("")
    }
    
    func minusButtonPressed() {
        let currentNumSt = relayNum.value
        guard let currentNum = Int(currentNumSt) else { return }
        minusintArray.append(currentNum)
        
        relayNum.accept("")
        
    }
    
    func equalButtonPressed() {
        if !plusIntArray.isEmpty {
            let plusResult = self.plusIntArray.reduce(0, +)
            let currentNumSt = relayNum.value
            guard let currentNum = Int(currentNumSt) else { return }
            
            let totalNum = plusResult + currentNum
            let plusResultSt = String(totalNum)
            relayNum.accept(plusResultSt)
            
            plusIntArray = []
        }
        
        if !minusintArray.isEmpty {
            let minusResult = minusintArray.reduce(0, -)
            print(minusResult, "minusResult")
            let currentNumSt = relayNum.value
            guard let currentNum = Int(currentNumSt) else { return }
            
            let totalNum = minusResult + currentNum
            let minusResultSt = String(totalNum)
            relayNum.accept(minusResultSt)
            
            minusintArray = []
        }
    }
    
}
