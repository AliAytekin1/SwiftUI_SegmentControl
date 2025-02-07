//
//  ContentView.swift
//  SegmentControl_SwiftUI
//
//  Created by Ali Aytekin on 7.02.2025.
//
import SwiftUI

struct SegmentControl_SwiftUI: View {
    @State private var yildiz = 1
    @State private var deger = 0.0
    @State private var secim = -1
    var body: some View {
        VStack(spacing : 20){
            Image("kiz_kulesi").resizable()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2,alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                .shadow(radius: 10)
            Picker("",selection: $secim){
                Text("Bir").tag(1)
                Text("İki").tag(2)
                Text("Üç").tag(3)
                Text("...").tag(4)
            }.pickerStyle(SegmentedPickerStyle())
                .background(RoundedRectangle(cornerRadius: 25).stroke( Color.red, lineWidth: secim == -1 ? 3: 0))
                .padding()
            Stepper(value: $yildiz, in: 1...5){
                Text("puan ver: \(yildiz)")}.padding(.horizontal)
            Stepper(value:$yildiz, in: 1...5){Text("puan ver: ")}.padding(.horizontal)
            HStack{
                ForEach(1...yildiz, id: \.self){
                    star in Image(systemName: "star.fill")
                }.padding(.horizontal).foregroundColor(.yellow)
            }
            Slider(value: $deger, in: 0...100, step: 2).padding(.horizontal) .frame(width:355,height:30)
                .background(Capsule().stroke(Color.black, lineWidth: 2))
            Text("Son: ").font(.title).foregroundColor(.red)+Text("\(deger)").font(.title)
        }
    }
}

        
#Preview {
    SegmentControl_SwiftUI()
}

    
