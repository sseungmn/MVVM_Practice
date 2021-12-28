//
//  LottoViewController.swift
//  MVVM_Lotto
//
//  Created by SEUNGMIN OH on 2021/12/28.
//

import UIKit

class LottoViewController: UIViewController {
  
  let mainView = LottoView()

  override func loadView() {
    super.loadView()
    view = mainView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    APIService.requestLotto(854) { lotto, error in
      guard error == nil else { return }
      guard let lotto = lotto else { return }
      DispatchQueue.main.async {
        self.mainView.num1Label.text = "\(lotto.drwtNo1)"
        self.mainView.num2Label.text = "\(lotto.drwtNo2)"
        self.mainView.num3Label.text = "\(lotto.drwtNo3)"
        self.mainView.num4Label.text = "\(lotto.drwtNo4)"
        self.mainView.num5Label.text = "\(lotto.drwtNo5)"
        self.mainView.num6Label.text = "\(lotto.drwtNo6)"
        self.mainView.num7Label.text = "\(lotto.bnusNo)"
        self.mainView.moneyLabel.text = "\(lotto.firstWinamnt)원"
        self.mainView.dateLabel.text = lotto.drwNoDate
      }
    }
  }
}

