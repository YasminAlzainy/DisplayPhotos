//
//  StringEx.swift
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 02/08/1444 AH.
//

import Foundation

extension String{
    func localize(tableName: String? = nil , bundle: Bundle = Bundle.main, comment:String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, comment: comment)
    }
}
