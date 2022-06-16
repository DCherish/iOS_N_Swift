//
//  AlertActionConvertible.swift
//  SearchDaumBlogMVVM
//
//  Created by kid cherish on 2022/06/15.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
