//
//  SentenceModel.swift
//  WordsPaper
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI

struct ScentenceModel : Identifiable, Codable {
    var id : UUID = UUID()
    var sentence:String
    var create_time :String
}
