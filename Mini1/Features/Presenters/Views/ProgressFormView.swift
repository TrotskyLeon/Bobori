
//
//  AddEntryView.swift
//  Mini1
//
//  Created by Nadya Tyandra on 02/05/23.
//

import SwiftUI

struct ProgressFormView: View {
    @ObservedObject var entryViewModel: EntryViewModel
    @State private var bedTime: Date = Date()
    @State private var date: Date = Date()
    @Binding var name: String
    @State private var distance = ""
    @State private var currentPageIndex: Int = 0
    @Environment(\.presentationMode) var presentationMode
    var distances = ["Besides crib", "Halfway towards door", "Next to doorway", "Outside the room (seen)", "Outside the room (unseen)"]
    
    let paleBlue = Color(UIColor(named: "paleBlue")!)
    
    var body: some View {
//        NavigationView {
        if currentPageIndex == 0 {
            Form {
                //                VStack {
                Section(header: Text("sementara pilih tgl dr sini")) {
                    FormattedDate(date: self.date)
                    DatePicker("pilih tgl", selection: $date,
                               in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(.graphical)
                }
            }
            
//            if currentPageIndex < 1 {
                Button(action: {
                    withAnimation(){
                        currentPageIndex += 1
                    }
                }, label: {
                    Text("Next")
                        .font(.system(size: 21))
                        .foregroundColor(Color("paleBlue"))
                })
//            }
            
        } else if currentPageIndex == 1{
            ZStack{
                Color("paleBlue").ignoresSafeArea()
                VStack{
                    Image("placeholder")
                        .resizable()
                        .frame(width: 222, height: 120)
                        .scaledToFill()
                        .padding(.top, 30)
                        
                    Text("What time did \(name) sleep?")
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
//                        .padding(.leading, 50)
                        .padding(.top, 50)
                        .frame(width: 304, height: 130)
                    //            Form{
                    
                    //                Section(header: Text("What time does ur child sleep today?")) {
                    //                    FormattedTime(time: self.bedTime)
                    DatePicker("", selection: $bedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(width: 299, height: 210)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.top, 10)
                    //                }
                    //            }
                    
                    //            if currentPageIndex < 2 {
                    Button(action: {
                        withAnimation(){
                            currentPageIndex += 1
                        }
                    }, label: {
                        Text("Next")
                            .frame(width: 210, height: 55)
                            .background(Color.white)
                            .cornerRadius(70)
                            .font(.system(size: 21))
                            .foregroundColor(Color("paleBlue"))
                            .padding(.top, 90)
                        
                        
                        
                    })
                    
                    
                    
                    Button(action: {
                        withAnimation(){
                            currentPageIndex -= 1
                        }
                    }, label: {
                        Text("Back")
                            .font(.system(size: 21))
                            .foregroundColor(Color.white)
                            .underline()
                            .padding(.leading, 5)
                        
                    })
                }
            }
            
        } else if currentPageIndex == 2{
            ZStack{
                Color("paleBlue").ignoresSafeArea()
                VStack{
                    Image("placeholder")
                        .resizable()
                        .frame(width: 110, height: 145)
                        .padding(.top, 10)
                        
                    
                    Text("How's today's distance?")
                        .font(.system(size: 32))
                        .multilineTextAlignment(.center)
                        .frame(width: 305, height: 80)
                        .padding(.top, 20)
                        
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 299, height: 210)
                        
                        Picker("Please choose a distance", selection: $distance) {
                            ForEach(distances, id: \.self) {
                                Text($0)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 18))
                            }
                        }
                        .pickerStyle(.wheel)
                        
                    } .padding(.top, 30)

                    
                    Button(action: {
                        self.entryViewModel.createEntry(date: self.date, bedTime: self.bedTime, distance: self.distance)
                    }) {
                        Text("Save")
                    }
                        .frame(width: 210, height: 55)
                        .background(Color.white)
                        .cornerRadius(70)
                        .font(.system(size: 21))
                        .foregroundColor(Color("paleBlue"))
                        .padding(.top, 90)
//                    .shadow(color: Color.gray, radius: 5)
                    
                    Button(action: {
                        withAnimation(){
                            currentPageIndex -= 1
                        }
                    }, label: {
                        Text("Back")
                            .font(.system(size: 21))
                            .foregroundColor(Color.white)
                            .underline()
                            .padding(.leading, 5)
                        
                    })
                }
            }
                
            }
    
        }
    }
