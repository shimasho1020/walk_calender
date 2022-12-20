//
//  ContentView.swift
//  walk_calender
//
//  Created by 島田将太郎 on 2022/12/18.
//

import SwiftUI

struct ContentView: View {
    let week: [String] = ["日","月","火","水","木","金","土"]
    @State var diff: Int = -1
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            HStack{
                Button(action: {diff -= 1}, label: {Image(systemName: "chevron.left.circle.fill")})
                Text(Date().changeMonth(diff: diff).DateToString(format: "yyyy年M月")).padding()
                Button(action: {diff += 1}, label: {Image(systemName: "chevron.right.circle.fill")})
            }
            
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7))
                {
                    ForEach(week, id: \.self) {
                        i in
                        Text(i).foregroundColor(.blue)
                    }
                    
                    let days: [Date] = Date().changeMonth(diff: diff).getAllDays()
                    let start = days[0].getWeekDay()
                    let end = start + days.count
                    
                    var maxBlock: Int = end <= 35 ? 34 : 41
                    
                    ForEach((0...maxBlock), id: \.self) {
                        index in
                        VStack{
                            if(index >= start && index < end){
                                let i = index - start
                                Text(days[i].DateToString(format: "d"))
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .foregroundColor(.yellow)
                                    .opacity(0.5)
                            } else {
//                                Text("--")
                            }
//                            RoundedRectangle(cornerRadius: 8)
//                                .frame(width: 40, height: 40, alignment: .center)
//                                .foregroundColor(.yellow)
//                                .opacity(0.5)
                        }
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
