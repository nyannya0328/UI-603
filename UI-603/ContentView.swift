//
//  ContentView.swift
//  UI-603
//
//  Created by nyannyan0328 on 2022/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AnimatedSplashScreen(color: "Orange", image: "SwiftIcon") {
            
            ScrollView(.vertical,showsIndicators: false){
                
                VStack{
                    ForEach(1...5,id:\.self){index in
                        
                        GeometryReader{proxy in
                            
                             let size = proxy.size
                         
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width,height: size.height)
                                .cornerRadius(10)
                        
                        }
                        .frame(height:250)
                    }
                    
                    
                    
                }
            }
            .padding(15)
            
        } onAnimationEnd: {
            
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
