//
//  Extensions.swift
//  UI-603
//
//  Created by nyannyan0328 on 2022/07/02.
//

import SwiftUI

extension View{
    
    func safeArea()->UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return.zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            
            return .zero
        }
        
        return safeArea
    }
}
