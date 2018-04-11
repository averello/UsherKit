//
//  Usher.swift
//  UsherKit
//
//  Created by Georges Boumis on 22/03/2018.
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

public protocol Usher {
    func positioning<Rect, Size>(ofSizes sizes: [Size], inBounds bounds: Rect) throws -> [Rect]
    where Rect: UsherRect, Size: UsherSize
    
    func requiredSizeForPositioning<Size>(sizes: [Size]) -> Size where Size: UsherSize
    
    var insets: UsherInsets { get set }
}

public enum UsherError: Error {
    case cannotFit
    case noInput
}
