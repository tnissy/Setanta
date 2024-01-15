//
//  ContentView.swift
//  Setanta
//
//  Created by 西口竜也 on 2024/01/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var menus: FetchedResults<Menu>
    
    @State var name = ""
    
    var body: some View {
        List {
            ForEach(menus) { menu in
                HStack {
                    if(menu.checked) {
                        Text("☑️")
                    }
                    else {
                        Text("🔲")
                    }
                    Button(action: {
                        menu.checked.toggle()
                    })
                    {
                        Text(menu.name!)
                    }
                }
            }
            
            TextField("メニュー名", text: $name)
                .onSubmit {
                    addMenu()
                }
            Button(action: deleteMenu) {
                Text("メニューの削除")
            }
        }
    }
    
    func addMenu() {
        let newMenu = Menu(context: viewContext)
        newMenu.name = name
        
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブ失敗")
        }
        
        name = ""
    }
    func deleteMenu() {
        for menu in menus {
            if(menu.checked) {
                viewContext.delete(menu)
            }
        }
        
        do {
            try viewContext.save()
        } catch {
            fatalError("削除失敗")
        }
    }
}

#Preview {
    ContentView()
}
