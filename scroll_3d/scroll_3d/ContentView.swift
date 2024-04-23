//
//  ContentView.swift
//  scroll_3d
//
//  Created by 성재 on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var offsetviewModel = OffsetViewModel()
    @GestureState var offset: CGFloat = 0
    
    let columns = [
        GridItem(.flexible()),
    ]
    
    private var scrollObservableView: some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .global).origin.y
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: offsetY
                )
                .onAppear {
                    offsetviewModel.setOriginOffset(offsetY)
                }
        }
        .frame(height: 0)
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                scrollObservableView
                Spacer().frame(height: 400)
                
                VStack(alignment: .center, spacing: 200) {
                    ForEach(0..<viewModel.models.count) { index in
                        GeometryReader { geometry in
                            let degree = (-offsetviewModel.offset/50 - 20.0) - Double(geometry.frame(in: .global).minY) / 12
                            ItemView(items: $viewModel.models[index])
                                .frame(width: 250, height: 350, alignment: .center)
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                                .rotation3DEffect(Angle(degrees: degree < 0 ? degree : 0), axis: (x: 1.0, y: 0, z: 0))
                        }
                    }
                }
                .padding(.horizontal, 75)
                
                Spacer().frame(height: 400)
            }.clipped()
                .onPreferenceChange(ScrollOffsetKey.self) {
                    offsetviewModel.setOffset($0)
                }
            
            VStack {
                ZStack {
                    Rectangle().frame(height: 175).foregroundStyle(.black)
                    
                    VStack {
                        Spacer().frame(height: 50)
                        HStack {
                            Text("Hi, Seongjae!")
                                .foregroundStyle(.white)
                                .font(.system(size: 24.0))
                                .fontWeight(.heavy)
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.white)
                                .font(.system(size: 24.0))
                        }
                        .frame(width: 345, height: 48)
                        Spacer().frame(height: 15)
                        ZStack {
                            RoundedRectangle(cornerRadius: 20.0)
                                .foregroundStyle(.gr)
                                .frame(height: 40)
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.gray)
                                
                                Text("Search")
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            .padding()
                        }
                        .frame(width: 345, height: 40)
                        
                    }
                }
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
