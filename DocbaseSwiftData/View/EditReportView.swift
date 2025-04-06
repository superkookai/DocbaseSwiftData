//
//  EditReportView.swift
//  DocbaseSwiftData
//
//  Created by Weerawut Chaiyasomboon on 06/04/2568.
//

import SwiftUI
import SwiftData

struct EditReportView: View {
    @Bindable var report: FeedbackReport
    
    var body: some View {
        Form {
            TextField("Title", text: $report.title)
            TextField("Content", text: $report.content)
            
            Picker("Priority", selection: $report.priority) {
                Text("Low").tag(1)
                Text("Medium").tag(2)
                Text("High").tag(3)
            }
            .pickerStyle(.segmented)
        }
        .navigationTitle("Edit Report")
    }
}

#Preview {
    let example = FeedbackReport(title: "New Mc Cheese Burger", content: "Delicious!", priority: 3)
    EditReportView(report: example)
        .modelContainer(FeedbackReport.previewContainer)
}
