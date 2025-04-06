//
//  ContentView.swift
//  DocbaseSwiftData
//
//  Created by Weerawut Chaiyasomboon on 06/04/2568.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var reports: [FeedbackReport]
    @Environment(\.modelContext) var modelContext
    
    @State private var path: [FeedbackReport] = []
    
    @ViewBuilder
    private func ReportRowView(report: FeedbackReport) -> some View {
        VStack(alignment: .leading) {
            Text(report.title)
                .font(.headline)
            Text(report.content)
                .lineLimit(2)
            HStack {
                ForEach(0..<report.priority, id: \.self) { i in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
    
    private func addNewReport() {
        let newReport = FeedbackReport(title: "New Title", content: "New Content", priority: 2)
        modelContext.insert(newReport)
        path = [newReport]
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List(reports) { report in
                NavigationLink(value: report) {
                    ReportRowView(report: report)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Feedback Assistant")
            .navigationDestination(for: FeedbackReport.self) { report in
                EditReportView(report: report)
            }
            .toolbar {
                Button {
                    addNewReport()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }

            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(FeedbackReport.previewContainer)
}

