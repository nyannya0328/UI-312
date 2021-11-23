//
//  Home.swift
//  UI-312 (iOS)
//
//  Created by nyannyan0328 on 2021/09/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button {
                    
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                   Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
                
                

            }
            .foregroundColor(.primary)
            .padding()
            
            VStack(spacing:15){
                
                Text("Total Balane")
                    .font(.title.bold())
                
               Text("$ 51 200")
                    .font(.largeTitle.weight(.black))
            }
            .padding(.bottom,20)
            
            
            Button {
                
            } label: {
                
                HStack{
                    
                    Text("Income")
                        
                    Image(systemName: "chevron.down")
                        
                }
                .font(.caption.bold())
                .foregroundColor(.primary)
                .padding(.vertical,8)
                .padding(.horizontal)
                .background(.white,in: Capsule())
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
            
                
                
                
            }
            
            LinearGraph(data: sample)
                .frame(height: 220)
                .padding(.top,15)
            
            
            Text("ShortCuts")
                .font(.largeTitle.weight(.black))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding([.leading,.top],5)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                
                HStack(spacing:25){
                    
                    
                    
                    cardView(image: "youtube", title: "YOU TUBE", price: "$ 26", color: Color("Gradient1"))
                    
                    cardView(image: "apple", title: "Apple", price: "$ 2600", color: Color("Gradient2"))
                    
                    cardView(image: "xbox", title: "XBox", price: "$120", color: Color.red)
                    
                    
                    
                }
                .padding()
                
            }
            
            
            
            

            
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
    }
    @ViewBuilder
    func cardView(image : String,title : String,price:String,color : Color)->some View{
        
        
        VStack{
            
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
                .padding()
                .background(color,in: Circle())
               
            
            
            Text(title)
                .font(.caption.bold())
                .foregroundColor(.gray)
                
            
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .background(.white,in: RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
        
        
        
        
       

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
let sample : [CGFloat] = [

    989,1200,750,790,650,950,1200,600,500,600,890,1203,1400,900,1250,
1600,1200

]

