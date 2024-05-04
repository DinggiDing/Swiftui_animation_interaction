//
//  MainView.swift
//  transparentText
//
//  Created by 성재 on 5/3/24.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = ViewModel()
    @StateObject var offsetviewModel = OffsetViewModel()
    @StateObject var offsetviewModel_B = OffsetViewModel()
    @GestureState var offset: CGFloat = 0
    
    let columns = [
        GridItem(.flexible()),
    ]
    
    private var scrollObservableView: some View {
        GeometryReader { proxy in
            let offsetX = proxy.frame(in: .global).origin.x
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: offsetX
                )
                .onAppear {
                    offsetviewModel.setOriginOffset(offsetX)
                }
        }
        .frame(height: 0)
    }
    
    private var scrollObservableView_B: some View {
        GeometryReader { proxy in
            let offsetX = proxy.frame(in: .global).origin.x
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: offsetX
                )
                .onAppear {
                    offsetviewModel_B.setOriginOffset(offsetX)
                }
        }
        .frame(height: 0)
    }

    var body: some View {
        
        VStack {
            
            VStack {
                
                Spacer().frame(height: 70)
                HStack {
                    Text("Hi, Seongjae!")
                        .foregroundStyle(.black)
                        .font(.system(size: 24.0))
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.black)
                        .font(.system(size: 24.0))
                }
                .frame(width: 345, height: 48)
                Spacer().frame(height: 15)
                        
                ZStack {
                    Color.white.ignoresSafeArea()
                        .frame(height: 400, alignment: .center)

                    ScrollView(.horizontal, showsIndicators: false) {
                        scrollObservableView
                        
                        HStack(spacing: 10) {
                            ForEach(0..<viewModel.models.count) { index in
                                ZStack {
                                    Color.black.ignoresSafeArea()
                                        .frame(width: 250, height: 350, alignment: .center)
                                        .cornerRadius(5.0)
                                    if offsetviewModel.offset <= CGFloat(index) * (-260) {
                                        ItemView(items: $viewModel.models[index])
                                            .frame(width: 250, height: 350, alignment: .center)
                                    } else {
                                        ItemView(items: $viewModel.models[index])
                                            .frame(width: 250, height: 350, alignment: .center)
                                            .mask(
                                                VStack {
                                                    Text(viewModel.models[index].name)
                                                        .font(.system(size: 62, weight: .heavy))
                                                        .scaleEffect(pow(4,(offsetviewModel.offset / -270 - CGFloat(index))+1))
                                                    
                                                }
                                            )
//                                        Text("\(offsetviewModel.offset / -270 - CGFloat(index))")
                                    }
                                }
                                //                        }
                            }
                        }
                        .padding(.horizontal, 15)
                        
                    }.clipped()
                        .onPreferenceChange(ScrollOffsetKey.self) {
                            offsetviewModel.setOffset($0)
                        }
                }
                Spacer()
                HStack {
                    Text("Likes")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.leading, 15)
                    Spacer()
                }
                ZStack {
                    Color.white.ignoresSafeArea()
                        .frame(height: 250, alignment: .center)

                    ScrollView(.horizontal, showsIndicators: false) {
                        scrollObservableView_B
                        
                        HStack(spacing: 10) {
                            ForEach(0..<viewModel.models_B.count) { index in
                                ZStack {
                                    Color.black.ignoresSafeArea()
                                        .frame(width: 150, height: 250, alignment: .center)
                                        .cornerRadius(5.0)
                                    if offsetviewModel_B.offset <= CGFloat(index) * (-160) {
                                        ItemView2(items: $viewModel.models_B[index])
                                            .frame(width: 150, height: 250, alignment: .center)
                                    } else {
                                        ItemView2(items: $viewModel.models_B[index])
                                            .frame(width: 150, height: 250, alignment: .center)
                                            .mask(
                                                VStack {
                                                    Text(viewModel.models_B[index].name)
                                                        .font(.system(size: 32, weight: .heavy))
                                                        .scaleEffect(pow(4,(offsetviewModel_B.offset / -170 - CGFloat(index))+1))
                                                    
                                                }
                                            )
//                                        Text("\(offsetviewModel_B.offset / -270 - CGFloat(index))")
                                    }
                                }
                                //                        }
                            }
                        }
                        .padding(.horizontal, 15)
                        
                    }.clipped()
                        .onPreferenceChange(ScrollOffsetKey.self) {
                            offsetviewModel_B.setOffset($0)
                        }
                }
                Spacer()
            }
            
            
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MainView()
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
