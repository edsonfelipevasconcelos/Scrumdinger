//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by EDSON FELIPE VASCONCELOS on 18/08/22.
//

import SwiftUI

struct ErrorView: View {
    let ErrorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Text("An error has occurred")
                    .font(.title)
                    .padding(.bottom)
                Text(ErrorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(ErrorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safaly ignore this error.")
    }
    
    static var previews: some View {
        ErrorView(ErrorWrapper: wrapper)
    }
}
