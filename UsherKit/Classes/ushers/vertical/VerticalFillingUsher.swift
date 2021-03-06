//
//  VerticalFillingUsher.swift
//  UsherKit
//
//  Created by Georges Boumis on 18/10/2018.
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//

import Foundation

public protocol VerticalFillingUsher: VerticalUsher {}

public extension VerticalFillingUsher {

    public func positioning<Rect>(ofRects rects: [Rect], inBounds bounds: Rect) throws -> [Rect]
        where Rect: UsherRect {

            guard rects.isEmpty == false else { throw UsherError.noInput }

            let sizes = rects.map({ (rect: UsherRect) -> USize in
                let size = rect.layoutSize
                return USize(layoutWidth: size.layoutWidth, layoutHeight: size.layoutHeight)
            })
            let requiredSize = self.requiredSizeForPositioning(sizes: sizes)
            guard bounds.layoutWidth >= requiredSize.layoutWidth,
                bounds.layoutHeight >= requiredSize.layoutHeight else { throw UsherError.cannotFit }

            guard rects.count > 1 else { return rects }

            let totalHeight = bounds.layoutHeight - (self.insets.top + self.insets.bottom)
            let rectHeight = totalHeight / Float(rects.count)
            let sizedRects = rects.map({ (rect: UsherRect) -> Rect in
                let size = USize(layoutWidth: rect.layoutWidth, layoutHeight: rectHeight)
                return Rect(layoutOrigin: rect.layoutOrigin, layoutSize: size)
            })
            let layout = Top(verticalSpacing: 0, insets: self.insets)
            return try layout.positioning(ofRects: sizedRects, inBounds: bounds)
    }
}

private struct Top: TopStackingVerticalUsher {
    var verticalSpacing: Float = 0
    var insets: UsherInsets = UsherInsets.zero
}
