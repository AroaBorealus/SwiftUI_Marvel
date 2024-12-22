//
//  CarouselTests.swift
//  SwiftUIMarvelTesting
//
//  Created by Aroa Miguel Garcia on 22/12/24.
//

import Foundation

import Testing
import SwiftUI
import ViewInspector

@testable import SwiftUIMarvel


struct CarouselTests {

    @Suite("Presentation testing", .serialized) struct PresentationTest{
        
//        @Test("Login View")
//        @MainActor
//        func ViewLoginViewTest() throws {
//            @State var appStateVM = AppStateVM(loginUC: LoginUserCase(repo: DefaultLoginRepositoryMock()))
//            
//            #expect(appStateVM != nil)
//            
//            //intancio la vista
//            let suc = LoginView()
//                .environment(appStateVM)
//            
//            //pillamos el ZStack
//            let zstack = try suc.inspect().implicitAnyView().zStack()
//            #expect(zstack.count == 3)
//            
//            //pillar el textField
//            let textFielf = try suc.inspect().find(viewWithId: 1)
//            #expect(textFielf != nil)
//            
//            //pillar un boton
//            let buttom = try suc.inspect().find(viewWithId: 3)
//            #expect(buttom != nil)
//            
//        }
        
        @Test("Carousel")
        @MainActor
        func SeriesCarouselViewTest() throws {
            
            //intancio la vista
            let suc = SeriesCarousel()
            
            //pillamos el ZStack
//            let zstack = try suc.inspect().implicitAnyView().zStack()
//            #expect(zstack.count == 3)
            
            //pillar el textField
            let zStack = try suc.inspect().find(viewWithId: 1)
            #expect(zStack != nil)
            
            //pillar el textField
            let scrollView = try suc.inspect().find(viewWithId: 2)
            #expect(scrollView != nil)
            
            //pillar un boton
            let hStack = try suc.inspect().find(viewWithId: 3)
            #expect(hStack != nil)
            
        }
    }

}
