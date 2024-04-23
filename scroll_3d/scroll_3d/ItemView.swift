//
//  ItemView.swift
//  scroll_3d
//
//  Created by 성재 on 4/23/24.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var list: Model
    
    init(items: Binding<Model>) {
        
        self._list = items
    }
    
    var body: some View {
        ZStack {
            Image(list.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 350)
                .clipped()
        
            VStack {
                Spacer().frame(height: 175)
                LinearGradient(colors: [Color.clear, Color.black, Color.black], startPoint: .top, endPoint: .bottom)
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
                    Spacer().frame(height: 14)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Date")
                                .foregroundStyle(.gray)
                                .fontWeight(.medium)
                                .font(.system(size: 13.0))
                            Text(list.date)
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 16.0))
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Bite")
                                .foregroundStyle(.gray)
                                .fontWeight(.medium)
                                .font(.system(size: 13.0))
                            Text(list.size)
                                .foregroundStyle(.mint)
                                .fontWeight(.bold)
                                .font(.system(size: 20.0))
                        }
                    }
                }
                .padding()
            }
        }
        .frame(width: 250, height: 350)
        .cornerRadius(20.0)
    }
}

#Preview {
    ContentView()
}
