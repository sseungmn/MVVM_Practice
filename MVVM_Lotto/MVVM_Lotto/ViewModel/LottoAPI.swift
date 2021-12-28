//
//  LottoAPI.swift
//  MVVM_Lotto
//
//  Created by SEUNGMIN OH on 2021/12/28.
//

import Foundation

enum APIError: Error {
  case invalidResponse, invalidData, noData, failed
}

class APIService {
  static func requestLotto(_ round: Int, completion: @escaping (Lotto?, APIError?) -> Void) {
    DispatchQueue.main.async {
      
      let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)")!
      
      URLSession.shared.dataTask(with: url) { data, response, error in
        guard error == nil else {
          completion(nil, .failed)
          return
        }
        
        guard let response = response as? HTTPURLResponse else {
          completion(nil, .invalidResponse)
          return
        }
        
        // 이곳의 response는 HTTPURLResponse타입입니다. 순서를 주의!
        guard response.statusCode == 200 else {
          completion(nil, .failed)
          return
        }
        
        guard let data = data else {
          completion(nil, .noData)
          return
        }
        
        do {
          let decodedData = try JSONDecoder().decode(Lotto.self, from: data)
          completion(decodedData, nil)
        } catch {
          completion(nil, .invalidData)
        }
        
      }.resume()
    }
  }
}
