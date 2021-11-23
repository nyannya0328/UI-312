//
//  LinearGraph.swift
//  UI-312 (iOS)
//
//  Created by nyannyan0328 on 2021/09/21.
//

import SwiftUI

struct LinearGraph: View {
    var data : [CGFloat]
    @State var currentPlot = ""
    @State var offset : CGSize = .zero
    @State var showPlot = false
    
    @State var translation : CGFloat = 0
    
    @GestureState var isDragging : Bool = false
    
    var body: some View {
        GeometryReader{proxy in
            let height = proxy.size.height
            let width = (proxy.size.width) / CGFloat(data.count - 1)
            
            let maxPoint = (data.max() ?? 0) + 100
            
            let points = data.enumerated().compactMap { item -> CGPoint in
                
                let progress = item.element / maxPoint
                
                let pathHight = progress * height
                let pathWidth = width * CGFloat(item.offset)
                
                
                return CGPoint(x: pathWidth, y: -pathHight + height)
                
                
                
                
                
            }
            
            ZStack{
                
                Path{Path in
                    
                    
                    Path.move(to: CGPoint(x: 0, y: 0))
                    Path.addLines(points)
                    
                    
                    
                }
                .strokedPath(StrokeStyle(lineWidth: 2.3, lineCap: .round, lineJoin: .round))
                .fill(
                
                
                LinearGradient(colors: [
                
                    
                    Color("Gradient1"),
                    Color("Gradient2"),
                    
                    
                
                ], startPoint: .leading, endPoint: .trailing)
                
                
                )
                
                
                FILBG()
                
                    .clipShape(
                    
                    
                        Path{path in
                            
                            
                            path.move(to: CGPoint(x: 0, y: 0))
                            
                            path.addLines(points)
                            
                            path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                            path.addLine(to: CGPoint(x: 0, y: height))
                        }
                    
                    )
                
                
                
                
            }
            
            
            .overlay(
            
                VStack(spacing:0){
                    
                    
                    Text(currentPlot)
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .padding(.vertical,6)
                        .padding(.horizontal,10)
                        .background(Color("Gradient1"),in:Capsule())
                        .offset(x: translation < 10 ? 30 : 0)
                        .offset(x: translation > (proxy.size.width - 60) ? -30 : 0)
                       
                    
                    Rectangle()
                        .fill(Color("Gradient1"))
                        .frame(width: 1, height: 40)
                        .padding(.top,5)
                    
                    
                    
                    Circle()
                        .fill(Color("Gradient1"))
                        .frame(width: 25, height: 25)
                        .overlay(
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 10, height: 10)
                        
                        
                        
                        )
                    
                    Rectangle()
                        .fill(Color("Gradient1"))
                        .frame(width: 1, height: 50)
                
                    
                    
                    
                    
                }
                    .frame(width: 80, height: 170)
                    .offset(y: 70)
                    .offset(offset)
                   .opacity(showPlot ? 1 : 0)
                 
                
                ,alignment: .bottomLeading
            
            )
            .contentShape(Rectangle())
            .gesture(
            
                DragGesture().onChanged({ value in
                    
                    withAnimation{showPlot = true}
                    
                    
                    let translation = value.location.x - 20
                    
                    let index = max( min(Int((translation / width).rounded() + 1), data.count - 1), 0)
                    
                    currentPlot = "$\(data[index])"
                    
                    self.translation = translation
                    
                    offset = CGSize(width: points[index].x - 40, height: points[index].y - height)
                    
                    
                })
                    .onEnded({ value in
                        
                        withAnimation{showPlot = false}
                        
                    })
                    .updating($isDragging, body: { value, out, _ in
                        out = true
                    })
                
            )
            
            
            
            
        }
        
        .overlay(
        
            VStack(alignment:.leading){
                
                
                
                let max = data.max() ?? 0
                
                
                Text("$\(Int(max))")
                    .font(.caption.bold())
                
                Spacer()
                
                
                Text("$0")
                    .font(.caption.bold())
                
                
            
            }
             
                .frame(maxWidth: .infinity,alignment: .leading)
        
        )
        .padding(.horizontal,10)
        .onChange(of: isDragging) { newValue in
            
            if !isDragging{showPlot = false}
        }
        
      
    }
    @ViewBuilder
    func FILBG()->some View{
        
        
        LinearGradient(colors: [
        
            Color("Gradient2").opacity(0.3),
            Color("Gradient2").opacity(0.2),
            Color("Gradient2").opacity(0.1),
            Color("Gradient1").opacity(0.3),
    
        
        ] + Array(repeating: Color("Gradient1").opacity(0.1), count: 4) + Array(repeating: Color.clear.opacity(0.1), count: 2), startPoint: .top, endPoint: .bottom)
        
        
    }
}

struct LinearGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
