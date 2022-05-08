//
//  detailsPhysical.swift
//  HealthArcane
//
//  Created by aksa nazir on 07/04/22.
//

import Foundation
struct physical: Decodable {
    let name: String
    let description: String
    let symptoms: String
    let precautionaryMeasures: String
    let exercise: String
    let diet: String
    let id: Int
}
