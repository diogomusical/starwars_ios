//
//  Star_Wars_Version4App.swift
//  Star_Wars_Version4
//
//  Created by Diogo on 13/09/2023.
//

import SwiftUI

@main
struct Star_Wars_Version4App: App {
    
    init(){
       printFonts()
   }
   
   func printFonts(){
       let fontFamilyNames = UIFont.familyNames
       
       for familyName in fontFamilyNames{
           print("--------------")
           print("Font Family name ->  [\(familyName)]")
           let names = UIFont.fontNames(forFamilyName: familyName)
           print("Font names ==> [\(names)]")
       }
   }
    
    var body: some Scene {
        WindowGroup {
                        
            SplashScreen()
        }
    }
}
