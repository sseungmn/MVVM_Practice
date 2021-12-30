//
//  LottoView.swift
//  MVVM_Lotto
//
//  Created by SEUNGMIN OH on 2021/12/28.
//

import UIKit
import SnapKit

class LottoView: UIView {
  
  let roundPickerView = UIPickerView()
  
  let num1Label = UILabel()
  let num2Label = UILabel()
  let num3Label = UILabel()
  let num4Label = UILabel()
  let num5Label = UILabel()
  let num6Label = UILabel()
  let num7Label = UILabel()
  let dateLabel = UILabel()
  let moneyLabel = UILabel()
  
  let stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .horizontal
    view.spacing = 8
    view.backgroundColor = nil
    view.distribution = .fillEqually
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setConfig()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setConfig() {
    [num1Label, num2Label, num3Label, num4Label,
     num5Label, num6Label, num7Label, dateLabel, moneyLabel].forEach { label in
      label.backgroundColor = .lightGray
      label.textAlignment = .center
      label.textColor = .black
    }
  }
  
  func setConstraints() {
    addSubview(roundPickerView)
        roundPickerView.snp.makeConstraints { make in
          make.leading.trailing.equalToSuperview()
          make.top.equalToSuperview().inset(100)
          make.height.equalTo(200)
        }
    addSubview(dateLabel)
    dateLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.center.equalToSuperview()
      make.height.equalTo(50)
    }
    
    addSubview(stackView)
    stackView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(dateLabel.snp.top).offset(-20)
      make.height.equalTo(50)
    }
    [num1Label, num2Label, num3Label, num4Label,
     num5Label, num6Label, num7Label].forEach { label in
      stackView.addArrangedSubview(label)
    }
    
    addSubview(moneyLabel)
    moneyLabel.snp.makeConstraints { make in
      make.top.equalTo(dateLabel.snp.bottom).offset(20)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(50)
    }
  }
}
