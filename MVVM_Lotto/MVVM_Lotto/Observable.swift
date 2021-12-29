//
//  Observable.swift
//  MVVM_Lotto
//
//  Created by SEUNGMIN OH on 2021/12/29.
//

import Foundation

class Observable<T> {
  typealias Listener = ( (T) -> Void )
  
  var listener: Listener?
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ completion: @escaping Listener) {
    self.listener = completion
    print(completion)
  }
}
