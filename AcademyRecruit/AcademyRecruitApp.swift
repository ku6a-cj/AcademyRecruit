//
//  AcademyRecruitApp.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 06/10/2022.
//

import SwiftUI

@main
struct AcademyRecruitApp: App {
    var body: some Scene {
        let persistanceContainer = PersistanceController.shared
            WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, persistanceContainer.containter.viewContext )
                
            }
                
        }
    }

