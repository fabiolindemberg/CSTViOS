//
//  Stringurl.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI

extension String {
    var url: URL? {
        URL(string: self)
    }
}
