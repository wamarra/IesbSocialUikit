//
//  Post.swift
//  IesbSocialUikit
//
//  Created by Wesley Marra on 23/10/21.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId, id: Int
    let title, body: String
}

