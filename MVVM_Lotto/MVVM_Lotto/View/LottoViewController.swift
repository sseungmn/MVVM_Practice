//
//  LottoViewController.swift
//  MVVM_Lotto
//
//  Created by SEUNGMIN OH on 2021/12/28.
//

import UIKit

class LottoViewController: UIViewController {
  
  let mainView = LottoView()
  let viewModel = LottoViewModel()

  override func loadView() {
    super.loadView()
    view = mainView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setConfiguration()
  }
  
  func setConfiguration() {
    bindView()
    
    mainView.roundPickerView.delegate = self
    mainView.roundPickerView.dataSource = self
    viewModel.initPickerView(mainView.roundPickerView)
  }
  
  func bindView() {
    viewModel.num1.bind { num in
      self.mainView.num1Label.text = "\(num)"
    }
    viewModel.num2.bind { num in
      self.mainView.num2Label.text = "\(num)"
    }
    viewModel.num3.bind { num in
      self.mainView.num3Label.text = "\(num)"
    }
    viewModel.num4.bind { num in
      self.mainView.num4Label.text = "\(num)"
    }
    viewModel.num5.bind { num in
      self.mainView.num5Label.text = "\(num)"
    }
    viewModel.num6.bind { num in
      self.mainView.num6Label.text = "\(num)"
    }
    viewModel.num7.bind { num in
      self.mainView.num7Label.text = "\(num)"
    }
    viewModel.date.bind { date in
      self.mainView.dateLabel.text = date
    }
    viewModel.money.bind { money in
      self.mainView.moneyLabel.text = money
    }
  }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return viewModel.numberOfComponents()
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return viewModel.numberOfRowsInComponent()
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return viewModel.titleForRow(row)
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    viewModel.didSelectRow(row)
  }
}
