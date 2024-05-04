//
//  dummy.swift
//  transparentText
//
//  Created by 성재 on 5/3/24.
//

import Foundation

struct ResourceLoader {
    static private(set) var shared = ResourceLoader()
    
    func loadDummyList() -> [Model] {
        return [.init(id: 1, name: "Paris", cnt: 35, size: "135", date: "2023/09/15", image: "travel1"),
                .init(id: 2, name: "Madrid", cnt: 50, size: "200", date: "2022/07/28", image: "travel5"),
                .init(id: 2, name: "Pusan", cnt: 50, size: "200", date: "2022/07/28", image: "travel4"),
                .init(id: 5, name: "Istanbul", cnt: 50, size: "204", date: "2024/05/03", image: "travel3"),
                .init(id: 2, name: "London", cnt: 50, size: "200", date: "2022/07/28", image: "travel2")
        ]
    }
    
    func loadDummyList_B() -> [Model] {
        return [.init(id: 1, name: "Paris", cnt: 35, size: "135", date: "2023/09/15", image: "travel1"),
                .init(id: 2, name: "Madrid", cnt: 50, size: "200", date: "2022/07/28", image: "travel5"),
                .init(id: 2, name: "Pusan", cnt: 50, size: "200", date: "2022/07/28", image: "travel4"),
                .init(id: 5, name: "Istanbul", cnt: 50, size: "204", date: "2024/05/03", image: "travel3"),
                .init(id: 2, name: "London", cnt: 50, size: "200", date: "2022/07/28", image: "travel2"),
                .init(id: 5, name: "Istanbul", cnt: 50, size: "204", date: "2024/05/03", image: ""),
                .init(id: 5, name: "Istanbul", cnt: 50, size: "204", date: "2024/05/03", image: ""),

        ]
    }
}
