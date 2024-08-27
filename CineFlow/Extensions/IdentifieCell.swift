//
//  IdentifieCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 26/08/24.
//

import UIKit

public protocol Identifiable: AnyObject { }

extension UITableViewCell: Identifiable { }
extension UITableViewHeaderFooterView: Identifiable { }
extension UICollectionReusableView: Identifiable { }

public extension Identifiable where Self: UITableViewCell {
    static var reuseId: String { String(describing: self) }
}

public extension Identifiable where Self: UITableViewHeaderFooterView {
    static var reuseId: String { String(describing: self) }
}

public extension Identifiable where Self: UICollectionReusableView {
    static var reuseId: String { String(describing: self) }
}
