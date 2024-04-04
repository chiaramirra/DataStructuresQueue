//
//  ContentView.swift
//  DataStructuresQueue
//
//  Created by Chiara Mirra on 04/04/24.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct QueueView: View {
    @State private var showData = false
    @State private var addingNumber = false
    @State var Queue = [0]
    @State var num = 0
    @ObservedObject var input = NumbersOnly()
    
    var body: some View {
        ZStack {
            ZStack{ Spacer()}
                .background(Color(uiColor: UIColor.systemBackground))
                .ignoresSafeArea()
            VStack{
                if !showData {
                    Button{
                        showData.toggle()
                    } label: {
                        Text("Click me for more info!")
                            .foregroundColor(.black)
                            .font(.system(size: 50))
                            .frame(width: 500, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(.yellow)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.bottom,30)
                    }
                } else{
                    Button{
                        showData.toggle()
                    } label: {
                        Text("A Queue is defined as a linear data structure that is open at both ends there are two operations we can perform on a queue, first we can introduce a value and then we can remove a value, in a queue the first element to be inserted is the first one to be removed")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                            .frame(width: 720, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(.red)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.top,250)
                    }
                }
                VStack{
                    ScrollView (.horizontal){
                        HStack{
                            VStack{
                                Text(String("Out"))
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .border(.black)
                                    .padding(.top, 33)
                            }
                            ForEach(Array(Queue.enumerated()), id: \.offset) { index, number in
                                Image("arrowL")
                                    .resizable()
                                    .padding(.top,30)
                                    .frame(width: 50, height: 100)
                                VStack{
                                    Text(String(index))
                                        .font(.system(size: 30))
                                        .frame(width: 50, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text(String(number))
                                        .foregroundColor(.black)
                                        .font(.system(size: 40))
                                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .border(.black)
                                }
                            }
                            Image("arrowL")
                                .resizable()
                                .padding(.top,30)
                                .frame(width: 50, height: 100)
                            VStack{
                                Text(String("In"))
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .border(.black)
                                    .padding(.top, 33)
                            }
                        }
                        .frame(minHeight: 800)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .foregroundColor(.black)
                .font(.system(size: 50))
                .frame(width: 800, height: 800, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    HStack{
                        Button(action: {
                            withAnimation(.default) {
                                if !Queue.isEmpty{
                                    num = Queue.removeFirst()
                                }
                            }
                        }, label: { Text("Remove value")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                                .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .background(.yellow)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        Button(action: {
                            withAnimation(.default) {
                                addingNumber.toggle()
                            }
                        }, label: { Text("Add value")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                                .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .background(.yellow)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding(.top,20)
            }
            if addingNumber{
                VStack{
                    HStack{
                        Text("Insert a new number:")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                        TextField("Example 5", text: $input.value)
                                    .padding()
                                    .font(.system(size: 38))
                    }
                    .padding()
                    HStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    addingNumber.toggle()
                                }
                            }, label: { Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        }
                        .background(.gray)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    Queue.append(Int(input.value)!)
                                    addingNumber.toggle()
                                }
                            }, label: { Text("Insert")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        }
                        .background(.red)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        Spacer()
                    }
                }
                .background(Color.white)
                .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(50)
            }
        }
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
