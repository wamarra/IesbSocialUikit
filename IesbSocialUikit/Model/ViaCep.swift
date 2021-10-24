//
//  ViaCep.swift
//  IesbSocialUikit
//
//  Created by Wesley Marra on 23/10/21.
//

import Foundation

struct ViaCep: Codable {
    let cep, logradouro, complemento, bairro: String
    let localidade, uf, ibge, gia: String
    let ddd, siafi: String
}
