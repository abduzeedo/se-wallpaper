//
//  ContentView.swift
//  SEBG
//
//  Created by Fabio Sasso on 3/12/22.
//
import SwiftUI

struct ContentView: View {
    var multiplier:CGFloat = 60
    var steps:Int = 9
    var half:Int = 5
    var gStart:Color  = Color(red: 29 / 255, green: 6 / 255, blue: 74 / 255)
    var gEnd:Color  = Color(red: 54 / 255, green: 4 / 255, blue: 2 / 255)
    @State var aniBar: Bool = false
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                HStack(alignment: .center, spacing:0){
                    ForEach((1...steps), id: \.self) { i in
                        if(i <= half){
                            ColorBar().frame(height: self.aniBar ? geometry.size.height - (multiplier * CGFloat(i)) : geometry.size.height).zIndex(Double(half - (i-half))).shadow(color: Color.black.opacity(self.aniBar ? 0.1 : 0),radius: 5 ).animation(Animation.easeInOut(duration:4))
                            //geometry.size.height - (multiplier * CGFloat(i))
                        }
                        else{
                            ColorBar().frame(height: self.aniBar ? geometry.size.height - (multiplier * CGFloat(half - (i-half))) : geometry.size.height).zIndex(Double(i)).shadow(color: Color.black.opacity(self.aniBar ? 0.1 : 0),radius: 5 ).animation(Animation.easeInOut(duration:4))
                        }
                    }
                }.frame(height: geometry.size.height)
            }.background(LinearGradient(gradient: Gradient(colors: [gStart,gEnd]), startPoint: .top, endPoint: .bottom))
        }.edgesIgnoringSafeArea(.all)
            .onAppear{
                self.aniBar.toggle()
            }
            .onTapGesture{
                self.aniBar.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ColorBar: View {
    var g1:Color = Color(red: 95 / 255, green: 71 / 255, blue: 202 / 255)
    var g2:Color = Color(red: 255 / 255, green: 175 / 255, blue: 196 / 255)
    var g3:Color = Color(red: 230 / 255, green: 210 / 255, blue: 173 / 255)
    var g4:Color = Color(red: 244 / 255, green: 160 / 255, blue: 18 / 255)
    var g5:Color = Color(red: 228 / 255, green:0 / 255, blue: 0 / 255)
    var body: some View {
        Rectangle().fill(
            LinearGradient(gradient: Gradient(colors: [g1.opacity(0),g1,g2,g3,g4,g5,g5.opacity(0)]), startPoint: .top, endPoint: .bottom))
        
    }
}
struct ManualBars: View{
    var multiplier:CGFloat = 60
    var body: some View{
        GeometryReader { geometry in
            HStack(alignment: .center, spacing:0){
                ColorBar().frame(height: geometry.size.height - (multiplier * 1)).zIndex(5)
                ColorBar().frame(height: geometry.size.height - (multiplier * 2)).zIndex(4)
                ColorBar().frame(height: geometry.size.height - (multiplier * 3)).zIndex(3)
                ColorBar().frame(height: geometry.size.height - (multiplier * 4)).zIndex(2)
                ColorBar().frame(height: geometry.size.height - (multiplier * 5))
                ColorBar().frame(height: geometry.size.height - (multiplier * 4)).zIndex(2)
                ColorBar().frame(height: geometry.size.height - (multiplier * 3)).zIndex(3)
                ColorBar().frame(height: geometry.size.height - (multiplier * 2)).zIndex(4)
                ColorBar().frame(height: geometry.size.height - (multiplier * 1)).zIndex(5)
            }
        }
    }
}
//        Rectangle().fill(
//            LinearGradient(gradient: Gradient(colors: [Color("G1").opacity(0),Color("G1"),Color("G2"),Color("g3"),Color("G4"),Color("G5"),Color("G5").opacity(0)]), startPoint: .top, endPoint: .bottom))
//            .shadow(color: Color.black.opacity(0.1),radius: 5 )
