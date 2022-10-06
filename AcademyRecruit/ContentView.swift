//
//  ContentView.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 06/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
 Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    
    @State var index = 0
    @State var show = false
    
    var body: some View{
        ZStack {
            //Side Menu
            HStack{
                VStack(alignment: .leading, spacing: 12){
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color.white)
                        
                        HStack(spacing: 10) {
                            Text("Academy Recruiter")
                                .font(.callout)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }.padding(.vertical)
                        
                        Divider()
                            .frame(width:100,height: 2)
                            .background(.white)
                        
                        HStack(spacing: 10){
                            Text("Menu:")
                                .font(.callout)
                                .fontWeight(.bold)
                            .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                    }
                    
               
                 

                    
                    Button(action: {
                        self.index = 0
                        
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 0 ? Color.white : Color.white)
                            
                            Text("Home")
                                .foregroundColor(self.index == 0 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top,-5)
                    
                    Button(action: {
                        self.index = 1
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 1 ? Color.white : Color.white)
                            
                            Text("Ranking Points")
                                .foregroundColor(self.index == 1 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    
                    Button(action: {
                        self.index = 2
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 2 ? Color.white : Color.white)
                            
                            Text("Set route to WAT")
                                .foregroundColor(self.index == 2 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    
                    Button(action: {
                        self.index = 3
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 3 ? Color.white : Color.white)
                            
                            Text("Fitness Calculators")
                                .foregroundColor(self.index == 3 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 4
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 4 ? Color.white : Color.white)
                            
                            Text("Calendar")
                                .foregroundColor(self.index == 4 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 4 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 5
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 5 ? Color.white : Color.white)
                            
                            Text("News")
                                .foregroundColor(self.index == 5 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 5 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    
 
                    
                    Button(action: {
                        self.index = 6
                        //animatingViews
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 10){
                            
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(self.index == 6 ? Color.white : Color.white)
                            
                            Text("Git")
                                .foregroundColor(self.index == 6 ? Color.white : Color.white)
                             
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 6 ? Color.white.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    

                }
                .padding(.top,25)
                .padding(.horizontal)
                
                Spacer(minLength: 0)
            }
            .padding(.top, -300)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            // Main View
            VStack(spacing: 0){
                HStack(spacing: 15){
                    Button(action: {
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))

                    }
                    Text(self.index == 0 ? "Home" : (self.index == 1 ? "Ranking Points Calculator" : (self.index == 2 ? "Set Route to WAT" : (self.index == 3 ? "Fitness Calculators" :  (self.index == 4 ? "Calendar" : (self.index == 5 ? "News" : "Git") )) )))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer(minLength: 0)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
            
                
                
                GeometryReader{ _ in
                    VStack{
                        if self.index == 0{
                            MainPage()
                        }else if self.index == 1{
                            Card()
                        }else if self.index == 2{
                            Others()
                        }else if self.index == 1{
                            Some()
                        }
                    }

                }
                
                
            }
           .background(Color.white)
            //Corner radius
           .cornerRadius(self.show ? 30 : 0)
           //MoveingView
           .scaleEffect(self.show ? 0.9 : 1)
           .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
           .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
            
        
        }
        .background(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
        .edgesIgnoringSafeArea(.all)
    }
}


//MainPageView

struct MainPage: View{
    var body: some View{
        
        
        ZStack(alignment: .bottomTrailing){
            VStack(spacing: 12){
                
                Text("MainScreen")
                
            }
            .padding()
            .background(Color.black.opacity(0.06))
            .cornerRadius(15)
            .padding()
            
            
        }
    }
}

struct Card: View{
    var body: some View{
        VStack{
            Text("Page1")
        }
    }
}


struct Others: View{
    var body: some View{
        VStack{
            Text("Page3")
        }
    }
}


struct Some: View{
    var body: some View{
        VStack{
            Text("Page3")
        }
    }
}
