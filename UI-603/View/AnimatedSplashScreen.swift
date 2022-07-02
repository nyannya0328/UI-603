//
//  AnimatedSplashScreen.swift
//  UI-603
//
//  Created by nyannyan0328 on 2022/07/02.
//

import SwiftUI

struct AnimatedSplashScreen<Content : View>: View {
    
    var content : Content
    var color : String
    var image : String
    var barHeight : CGFloat = 60
    var animationTiming : Double = 0.6
   
    var onAnimationEnd : ()->()
    
    init(color: String, image: String,barHeight : CGFloat = 60,animationTiming : Double = 2, content: @escaping()->Content, onAnimationEnd: @escaping () -> ()) {
        self.content = content()
        self.color = color
        self.image = image
        self.barHeight = barHeight
        self.animationTiming = animationTiming
   
        self.onAnimationEnd = onAnimationEnd
    }
    
    @State var startAnimation : Bool = false
    @State var animatedContent : Bool = false
    
    
    @State var disabelControlle : Bool = false
    
    @Namespace var animation
    
    var body: some View {
        
        
        VStack(spacing:0){
            
            if startAnimation{
                
                
                GeometryReader{proxy in
                     let size = proxy.size
                    
                    VStack(spacing:0){
                        
                        ZStack(alignment:.bottom){
                            
                            Rectangle()
                                .fill(Color("Orange").gradient)
                                .matchedGeometryEffect(id: "SPLASHCOLOR", in: animation)
                                .frame(height:barHeight + safeArea().top)
                                
                            
                            Image("SwiftIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: "SPLASHIMAGE", in: animation)
                                .frame(width:35,height: 35)
                               
                                .padding(.bottom,20)
                            
                            
                            
                        }
                        
                        content
                            .offset(y:startAnimation ? 0 : (size.height - (barHeight + safeArea().top)))
                            .disabled(disabelControlle)
                    }
                    .frame(maxHeight: .infinity,alignment: .top)
                }
                .transition(.identity)
                .ignoresSafeArea(.container,edges: .all)
                .onAppear{
                    
                    if !animatedContent{
                        
                        withAnimation(.easeInOut(duration: animationTiming)){
                            
                            animatedContent = true
                        }
                    }
                }
                
                
                
                
            }
            else{
                
                ZStack{
                    
                    Rectangle()
                        .fill(Color("Orange").gradient)
                        .matchedGeometryEffect(id: "SPLASHCOLOR", in: animation)
                    
                    Image("SwiftIcon")
                        .matchedGeometryEffect(id: "SPLASHIMAGE", in: animation)
                    
                }
                .ignoresSafeArea(.container,edges: .all)
            }
            
            
        }
        .onAppear{

            if !startAnimation{

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){

                    withAnimation(.easeInOut(duration: animationTiming)){
                        
                        startAnimation = true
                        
                    }

                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                    
                    
                    disabelControlle = false
                    onAnimationEnd()
                }
                

            }
            
           

            
            
        }
        
    
           
            
    }
        
}

struct AnimatedSplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
