//
//  MainPageView.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 07/10/2022.
//


import SwiftUI
import CoreData
import Combine
import MapKit

struct MainPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)])
    private var tasks: FetchedResults<Task>
    
    @StateObject var deviceLocationService = DeviceLocationService.shared
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)

    
    @State  var long = 20.0
    @State  var lat = 52.0
    @State var tokens: Set<AnyCancellable> = []
    
    var body: some View {
        VStack{
            Form{
                ScrollView(.horizontal){
                    LazyHStack(alignment: .center, spacing: -70){
                        SimulatioScoreView()
                            .padding(.leading, -40.0)
                        .shadow(radius: 10)
                        DaysTo()
                        .shadow(radius: 10)
                            .padding(.leading, 20.0)
                        Localization()
                            .padding(.leading, 70.0)
                         .shadow(radius: 10)
                        
                    }}.frame(height:130)
                
                
                VStack{
                    MapVie(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                        .frame(height:280)
                    HStack {
                        VStack {
                            TextField("latitude", value: $lat, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            
                            Divider()
                                .frame(height: 1)
                                .background(.gray)
                                .padding(.horizontal, 16)
                                .blur(radius: 0.5)
                            
                            Text("latitude")
                                .padding(.bottom, 5.0)
                        }.onAppear{
                            observeCoordinateUpdates()
                            observeDeniedLocationAccess()
                            deviceLocationService.requestLocationUpdates()
                        }
                            .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                        Spacer()
                        VStack {
                            TextField("longitude", value: $long, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            
                            Divider()
                                .frame(height: 1)
                                .background(.gray)
                                .padding(.horizontal, 16)
                                .blur(radius: 0.5)
                            
                            Text("longitude")
                                .padding(.bottom, 5.0)
                        }.overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                        Spacer()
                    }.onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                            //print("done")
                            lat = coordinates.lat
                            long = coordinates.lon
                        })
                       
                    }
                    
                }
                
                Section(header: Text("Database")){
                    ForEach(tasks) { task in
                        VStack(spacing: -60) {
                            DataBaseView( Points: task.title ?? "NN", DataM: task.date?.formatted(date: .numeric, time: .shortened) ?? "UNN DATE", GenderChoice: task.gender ?? "UNNOWN")
                            // on tap does not work becouse it is already used in a DataBaseView to change colour while selecting
    //                                    .onTapGesture {
    //                                       // sel.toggle()
    //                                        updateTask(task)}
                            
                           // Text(task.title ?? "Untitled")
                           // Text(task.date?.formatted(date: .numeric, time: .shortened) ?? "UNN DATE" )
                    }
                    .padding(.vertical, -35.0)
                    }.onDelete(perform: deleteTasks)
                }
       
                
                
                Section(header: Text("Events List")){
                    VStack{
                        let taskModel: TaskViewModel = TaskViewModel()
                        let tasks = taskModel.storedTasks
                        
                                ForEach(tasks){Task in
                                    VStack(alignment: .leading, spacing: 12) {
                                        HStack(alignment: .top, spacing: 50){
                                            VStack(alignment: .leading, spacing: 12){
                                                Text(Task.taskTitle)
                                                    .font(.title2.bold())
                                            
                                                
                                            }
                                            Text(Task.taskDate.formatted(date: .numeric, time: .shortened))
                                        }
                                        Text(Task.taskDescription)
                                            .font(.callout)
                                            .foregroundStyle(.secondary)
                                    }
                                    .foregroundColor( .white )
                                    .padding(12)
                                    .frame(width: 330)
                                    .background(
                                            Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00))
                                                .cornerRadius(25)
                                                .opacity( 1 )
                                            
                                    )
                        }
                    }
                }
                
//                Section(header: Text("Main Screen")){
//                    Text("hello")
//                }
                
                
            }
  
            
            }.onAppear{
                Shared.shared.Lat = lat
                Shared.shared.Long = long
                observeCoordinateUpdates()
                observeDeniedLocationAccess()
                deviceLocationService.requestLocationUpdates()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                    //print("done")
                    Shared.shared.Lat = coordinates.lat
                    Shared.shared.Long = coordinates.lon
            })
                
    }
    
}
    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
            }
            .store(in: &tokens)
    }

    func observeDeniedLocationAccess() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("Handle access denied event, possibly with an alert.")
            }
            .store(in: &tokens)
    }
    
    private func saveContext(){
        withAnimation(){
            do{
                try viewContext.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved Error: \(error)")
            }
        }
      
    }
    
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map{tasks[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
        

    
    private func updateTask(_ task: FetchedResults<Task>.Element){
        withAnimation{
            task.title = "My Score: \(String(Shared.shared.MyPoints ?? 0)) \(Date().formatted(date: .numeric, time: .shortened))"
            saveContext()
        }
    }
    
}
                                              

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
