//
//  UsherInsets.swift
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

public struct UsherInsets {
    public let top: Float
    public let right: Float
    public let bottom: Float
    public let left: Float
    
    public init(top: Float,
                right: Float,
                bottom: Float,
                left: Float) {
        self.top    = top
        self.right  = right
        self.bottom = bottom
        self.left   = left
    }
    
    public static let zero: UsherInsets = UsherInsets(top: 0, right: 0, bottom: 0, left: 0)
}
