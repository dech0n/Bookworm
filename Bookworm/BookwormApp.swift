//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Dechon Ryan on 5/29/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
