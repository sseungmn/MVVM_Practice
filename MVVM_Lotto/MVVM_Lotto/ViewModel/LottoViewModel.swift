//
//  LottoViewModel.swift
//  MVVM_Lotto
//
//  Created by SEUNGMIN OH on 2021/12/28.
//

import Foundation
import UIKit

class LottoViewModel {
  var maxRound = 995
  
  var num1 = Observable<Int>(0)
  var num2 = Observable<Int>(0)
  var num3 = Observable<Int>(0)
  var num4 = Observable<Int>(0)
  var num5 = Observable<Int>(0)
  var num6 = Observable<Int>(0)
  var num7 = Observable<Int>(0)
  var date = Observable<String>("")
  var money = Observable<String>("")
  
  func fetchLottoInfo(_ round: Int) {
    APIService.requestLotto(round) { [weak self] lotto, error in
      guard error == nil else { return }
      guard let lotto = lotto else { return }
      
      DispatchQueue.main.async {
        self?.num1.value = lotto.drwtNo1
        self?.num2.value = lotto.drwtNo2
        self?.num3.value = lotto.drwtNo3
        self?.num4.value = lotto.drwtNo4
        self?.num5.value = lotto.drwtNo5
        self?.num6.value = lotto.drwtNo6
        self?.num7.value = lotto.bnusNo
        self?.money.value = self?.format(lotto.firstWinamnt) ?? ""
        self?.date.value = lotto.drwNoDate
      }
    }
  }
  
  func format(_ won: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(for: won)!
  }
}

// MARK: - Extension

// MARK: PickerView
extension LottoViewModel {
  func initPickerView(_ pickerView: UIPickerView) {
    pickerView.selectRow(pickerViewInitValue, inComponent: 0, animated: true)
    fetchLottoInfo(pickerView.selectedRow(inComponent: 0) + 1)
  }
  var pickerViewInitValue: Int {
    return maxRound - 1
  }
  func numberOfComponents() -> Int {
    return 1
  }
  func numberOfRowsInComponent() -> Int {
    return maxRound
  }
  
  func titleForRow(_ row: Int) -> String? {
    return "\(row + 1)"
  }
  
  func didSelectRow(_ row: Int) {
    print("\(row + 1)")
    fetchLottoInfo(row + 1)
  }
}
