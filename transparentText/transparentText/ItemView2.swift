//
//  ItemView2.swift
//  transparentText
//
//  Created by 성재 on 5/4/24.
//

import SwiftUI

struct ItemView2: View {
    @Binding var list: Model
    
    init(items: Binding<Model>) {
        
        self._list = items
    }
    
    var body: some View {
        ZStack {
            Image(list.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 250)
                .clipped()
        
            VStack {
                Spacer().frame(height: 175)
                LinearGradient(colors: [Color.clear, Color.clear, Color.black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
            }
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 52, height: 20)
                            .foregroundStyle(.ultraThinMaterial)
                        HStack {
                            Text("\(list.cnt)")
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 9.0))
                            Spacer().frame(width: 2)
                            Text("items")
                                .foregroundStyle(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 8.0))
                        }
                    }
                    .padding()
                }
                Spacer()
                
                VStack {
                    HStack {
                        Text(list.name)
                            .foregroundStyle(.white)
                            .fontWeight(.heavy)
                            .font(.system(size: 20.0))
                        Spacer()
                    }
                    Spacer().frame(height: 1)
                }
                .padding()
            }
        }
        .frame(width: 150, height: 250)
        .cornerRadius(5.0)
    }
}

#Preview {
    MainView()
}
