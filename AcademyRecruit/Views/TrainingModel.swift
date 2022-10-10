//
//  TrainingModel.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 10/10/2022.
//

import Foundation
import SwiftUI

struct Excesise: Identifiable{
    var id =  UUID().uuidString
    var excesiseTitel: String
    var reps: Int
    var series: Int
}
