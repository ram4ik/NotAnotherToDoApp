//
//  ContentView.swift
//  NotAnotherToDoApp
//
//  Created by Ramill Ibragimov on 25.04.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modalType: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos) { toDo in
                    Button(action: {
                        modalType = .update(toDo)
                    }, label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    })
                }.onDelete(perform: dataStore.deleteToDo)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("ToDos")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        modalType = .new
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }.sheet(item: $modalType) { $0 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
