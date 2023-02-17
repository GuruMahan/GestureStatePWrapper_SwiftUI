//
//  ContentView.swift
//  GestureStatePWrapperPOC
//
//  Created by Guru Mahan on 17/02/23.
//

import SwiftUI

struct GestureStateView: View {
    @GestureState var offset1 = CGSize.zero
    @GestureState var animation1 = Animation.linear
    @GestureState var offset2 = CGSize.zero
    @GestureState var animation2 = Animation.linear
    @GestureState var offset3 = CGSize.zero
    @GestureState var animation3 = Animation.linear
    @GestureState var offset4 = CGSize.zero
    @GestureState var animation4 = Animation.linear
    @State var showLongPressImage = false
    var body: some View {
        VStack{
            ZStack {
                if !showLongPressImage{
                    DragGestureStateView
                }
                if showLongPressImage{
                    longPressGestureStateView
                }
                //  Text("Hello, world!")
            }
            .padding()
            
            Button("Change") {
                showLongPressImage.toggle()
            }
            .offset(y: 50)
        }
    }
    @ScaledMetric var imageSize:CGFloat = 100
    @ViewBuilder var DragGestureStateView: some View{
      
            VStack{
                Image(systemName: "leaf.fill")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .offset(offset1)
                    .scaledToFit()
                    .shadow(radius: 20)
                    .animation(animation1)
                    .gesture(DragGesture(minimumDistance: 10).updating(self.$offset1, body: { (value, State, translation) in
                        State = value.translation
                    })
                        .updating(self.$animation1, body: { value, state, translation in
                            state = Animation.easeInOut(duration: 2)
                        }))
                
                Image(systemName: "leaf")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .offset(offset2)
                    .scaledToFit()
                    .shadow(radius: 20)
                    .animation(animation2)
                    .gesture(DragGesture(minimumDistance: 10).updating(self.$offset2, body: { (value, State, translation) in
                        State = value.translation
                    })
                        .updating(self.$animation2, body: { value, state, translation in
                            state = Animation.easeInOut(duration: 2)
                        }))
            }
            HStack{
                Image(systemName: "leaf.fill")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .offset(offset3)
                    .scaledToFit()
                    .shadow(radius: 20)
                    .animation(animation3)
                    .gesture(DragGesture(minimumDistance: 10).updating(self.$offset3, body: { (value, State, translation) in
                        State = value.translation
                    })
                        .updating(self.$animation3, body: { value, state, translation in
                            state = Animation.easeInOut(duration: 2)
                        }))
                Image(systemName: "leaf")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .offset(offset4)
                    .scaledToFit()
                    .shadow(radius: 20)
                    .animation(animation4)
                    .gesture(DragGesture(minimumDistance: 10).updating(self.$offset4, body: { (value, State, translation) in
                        State = value.translation
                    })
                        .updating(self.$animation4, body: { value, state, translation in
                            state = Animation.easeInOut(duration: 2)
                        }))
            
        }
    }
    @State var scaleFactor: CGFloat = 1
    @GestureState var longPressed = false
    @ViewBuilder var longPressGestureStateView: some View{
        VStack{
            Image(systemName: "person")
                .resizable()
                .frame(width: imageSize,height: imageSize)
                .scaleEffect(longPressed ? 1.5 : 1)
              //  .clipShape(Circle())
//                .overlay(Circle().stroke(Color.black,lineWidth: 4))
                .shadow(radius: 20)
                .gesture(LongPressGesture(minimumDuration: 3).updating($longPressed, body: { (value, State, translation) in
                    State = value
                }))
                .animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GestureStateView()
    }
}
