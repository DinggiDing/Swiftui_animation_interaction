//
//  dummy.swift
//  scroll_3d
//
//  Created by 성재 on 4/21/24.
//

import Foundation

struct ResourceLoader {
    static private(set) var shared = ResourceLoader()
    
    func loadDummyList() -> [Model] {
        return [.init(id: 1, name: "Project Construction", cnt: 35, size: "135 MB", date: "2023/09/15", image: "image9"),
                .init(id: 2, name: "Project Human", cnt: 50, size: "200 MB", date: "2022/07/28", image: "image8"),
                .init(id: 3, name: "Project IT", cnt: 90, size: "1.23 GB", date: "2024/01/02", image: "image7"),
                .init(id: 4, name: "Project Non-profit", cnt: 40, size: "180 MB", date: "2023/03/19", image: "image6"),
                .init(id: 5, name: "Project Technology", cnt: 25, size: "102 MB", date: "2024/08/07", image: "image5"),
                .init(id: 6, name: "Project Events", cnt: 3, size: "70 MB", date: "2022/11/30", image: "image4"),
                .init(id: 4, name: "Project Marketing", cnt: 70, size: "528 MB", date: "2023/06/10", image: "image3"),
                .init(id: 5, name: "Project Mechanics", cnt: 50, size: "204 MB", date: "2024/05/03", image: "image2")]
    }
}
