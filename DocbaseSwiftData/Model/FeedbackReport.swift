//
//  FeedbackReport.swift
//  DocbaseSwiftData
//
//  Created by Weerawut Chaiyasomboon on 06/04/2568.
//

import Foundation
import SwiftData

@Model
class FeedbackReport {
    var title: String
    var content: String
    var priority: Int
    
    init(title: String, content: String, priority: Int) {
        self.title = title
        self.content = content
        self.priority = priority
    }
}

extension FeedbackReport {
    
    @MainActor
    static var previewContainer: ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: FeedbackReport.self, configurations: config)
        
        container.mainContext.insert(FeedbackReport(title: "16e using", content: "I have first impression on this iPhone feel like 16 for the body", priority: 2))
        
        container.mainContext.insert(FeedbackReport(title: "New Mc Cheese Burger", content: "Delicious!", priority: 3))
        
        container.mainContext.insert(FeedbackReport(title: "Santafe New Pork Chop", content: "Super!", priority: 1))
        
        return container
    }
}
