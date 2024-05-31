//
//  String-EmptyOrBlank.swift
//  Bookworm
//
//  Created by Dechon Ryan on 5/30/24.
//

import Foundation

extension String {
    var isEmptyOrBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
