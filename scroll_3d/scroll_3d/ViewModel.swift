//
//  ViewModel.swift
//  scroll_3d
//
//  Created by 성재 on 4/21/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var models: [Model] = ResourceLoader.shared.loadDummyList()
    
}

final class OffsetViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    private var originOffset: CGFloat = 0
    private var isCheckedOriginOffset: Bool = false
    
    func setOriginOffset(_ offset: CGFloat) {
        guard !isCheckedOriginOffset else { return }
        self.originOffset = offset
        self.offset = offset
        isCheckedOriginOffset = true
    }
    
    func setOffset(_ offset: CGFloat) {
        guard isCheckedOriginOffset else { return }
        self.offset = offset
    }
}
