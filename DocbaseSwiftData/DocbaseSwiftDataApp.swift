//
//  DocbaseSwiftDataApp.swift
//  DocbaseSwiftData
//
//  Created by Weerawut Chaiyasomboon on 06/04/2568.
//

import SwiftUI

@main
struct DocbaseSwiftDataApp: App {
    var body: some Scene {
        DocumentGroup(editing: FeedbackReport.self, contentType: .feedbackReport) {
            ContentView()
        }
    }
}

//Important: You must not use the modelContainer() modifier when working with a SwiftData document-based app.
