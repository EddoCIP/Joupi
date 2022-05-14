//
//  Helpers.swift
//  Joupi
//
//  Created by Eddo Careera Iriyanto Putra on 14/05/22.
//

import Foundation

func formatDateToString(date: Date, format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    
    return formatter.string(from: date)
}
