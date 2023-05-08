//
//  HomeViewUI.swift
//  Memoria
//
//  Created by Christopher Gunadi on 07/05/23.
//

import SwiftUI

struct HomeViewUI: View {
    @ObservedObject var controller: HomeViewController
    @ObservedObject var scrapBookViewModel: ScrapBookViewModel
    @State var books: [(name: String, date: String, quote: String, thumbnail: String, scrapBook: ScrapBook)] = []
    var body: some View {
        
        var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(books.indices, id: \.self) { index in
                    let scrapBookInfo = books[index]
                    ZStack {
                        Image("HomeBackground")
                            .resizable()
                            .scaledToFit()
                        GeometryReader { geometry in
                            VStack(spacing: 150) {
                                let uiImage = UIImage(data: Data(base64Encoded: scrapBookInfo.thumbnail)!) // Replace 'Data()' with the actual image data
                                
                                if index % 6 == 0 {
                                    TitleDate1(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
                                } else if index % 6 == 1 {
                                    TitleDate2(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
                                } else if index % 6 == 2 {
                                    TitleDate3(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
                                } else if index % 6 == 3 {
                                    TitleDate4(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
                                } else if index % 6 == 4 {
                                    TitleDate5(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
                                } else {
                                    TitleDate6(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                        }
                    }
                    .onTapGesture {
                        controller.navigateToScrapBook(scrapBook: scrapBookInfo.scrapBook)
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                UIScrollView.appearance().bounces = false
                
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
                
            }
            .onReceive(scrapBookViewModel.$scrapBooks) { xxxx in
                
                if xxxx != nil {
                    let data = controller.getScrapBookInfo(scrapBooksData: xxxx!)
                    self.books = data
                }
            }
            .environmentObject(controller)
            .environmentObject(scrapBookViewModel)
        }
    }
}


struct TitleDate1: View {
    @State private var titleText: String
    @State private var dateText: String
    let uiImage: UIImage

    init(title: String, date: String, image: UIImage) {
        _titleText = State(initialValue: title)
        _dateText = State(initialValue: date)
        uiImage = image
    }

    var body: some View {
        HStack {
            FramedImage(uiImage: uiImage)
                .rotationEffect(Angle.degrees(-8))
                .offset(x: 40, y: 62)

            VStack(alignment: .leading, spacing: 8) {
                TextField("Title", text: $titleText)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 250/255, green: 68/255, blue: 20/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 25))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(5))
                    .offset(x: 60, y:50)

                TextField("Date", text: $dateText)
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 42/255, green: 186/255, blue: 187/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 20))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(8))
                    .offset(x: 75, y: 40)
            }
            Spacer()
        }
        .padding()
    }
}


struct TitleDate2: View {
    @State private var titleText: String
    @State private var dateText: String
    let uiImage: UIImage
    
    init(title: String, date: String, image: UIImage) {
        _titleText = State(initialValue: title)
        _dateText = State(initialValue: date)
        uiImage = image
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 8) {
                Text("Title")
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 250/255, green: 68/255, blue: 20/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 25))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(-5))
                    .offset(x:-15, y:0)


                Text("Date")
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 42/255, green: 186/255, blue: 187/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 20))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(5))
                    .offset(x: 10, y: -10)
            }
            
            FramedImage2(uiImage: uiImage)
                .rotationEffect(Angle.degrees(4.5))
                .offset(x: 24,y :15)
        }
        .padding()
    }
}




struct TitleDate3: View {
    @State private var titleText: String
    @State private var dateText: String
    let uiImage: UIImage

    init(title: String, date: String, image: UIImage) {
        _titleText = State(initialValue: title)
        _dateText = State(initialValue: date)
        uiImage = image
    }

    var body: some View {
        HStack {
            FramedImage2(uiImage: uiImage)
                .rotationEffect(Angle.degrees(-8))
                .offset(x:37, y: -80)

            VStack(alignment: .leading, spacing: 8) {
                TextField("Title", text: $titleText)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 250/255, green: 68/255, blue: 20/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 25))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(5))
                    .offset(x:70, y: -70)

                TextField("Date", text: $dateText)
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 42/255, green: 186/255, blue: 187/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 20))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(8))
                    .offset(x: 85, y: -80)
            }
            Spacer()
        }
        .padding()
    }
}

struct TitleDate4: View {
    @State private var titleText: String
    @State private var dateText: String
    let uiImage: UIImage
    
    init(title: String, date: String, image: UIImage) {
        _titleText = State(initialValue: title)
        _dateText = State(initialValue: date)
        uiImage = image
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                Text("Title")
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 250/255, green: 68/255, blue: 20/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 25))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(-5))
                    .offset(x: -65, y: -10)


                Text("Date")
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 42/255, green: 186/255, blue: 187/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 20))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(5))
                    .offset(x: -60, y: -20)

            }
            
            FramedImage2(uiImage: uiImage)
                .rotationEffect(Angle.degrees(3.5))
                .offset(x:-32, y:-20)
        }
        .padding()
    }
}


struct TitleDate5: View {
    @State private var titleText: String
    @State private var dateText: String
    let uiImage: UIImage

    init(title: String, date: String, image: UIImage) {
        _titleText = State(initialValue: title)
        _dateText = State(initialValue: date)
        uiImage = image
    }

    var body: some View {
        HStack {
            FramedImage2(uiImage: uiImage)
                .rotationEffect(Angle.degrees(-8.5))
                .offset(x:25, y:-84)

            VStack(alignment: .leading, spacing: 8) {
                TextField("Title", text: $titleText)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 250/255, green: 68/255, blue: 20/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 25))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(-5))
                    .offset(x:67, y:-100)

                TextField("Date", text: $dateText)
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 42/255, green: 186/255, blue: 187/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 20))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(5))
                    .offset(x:74 , y: -110)
            }
            Spacer()
        }
        .padding()
    }
}

struct TitleDate6: View {
    @State private var titleText: String
    @State private var dateText: String
    let uiImage: UIImage
    
    init(title: String, date: String, image: UIImage) {
        _titleText = State(initialValue: title)
        _dateText = State(initialValue: date)
        uiImage = image
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                Text("Title")
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 250/255, green: 68/255, blue: 20/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 25))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(-5))
                    .offset(x:40, y:-15)


                Text("Date")
                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                    .frame(width: 100)
                    .background(Rectangle().fill(Color(red: 42/255, green: 186/255, blue: 187/255, opacity: 1)))
                    .foregroundColor(.white)
                    .font(.custom("LilitaOne", size: 20))
                    .multilineTextAlignment(.center)
                    .cornerRadius(0)
                    .rotationEffect(Angle.degrees(5))
                    .offset(x: 55, y: -30)
            }
            
            FramedImage2(uiImage: uiImage)
                .rotationEffect(Angle.degrees(10))
                .offset(x:-47, y:-145)
        }
        .padding()
    }
}


struct FramedImage: View {
    let uiImage: UIImage

    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 165, height: 120) // Set the size of the content image
            .clipped() // Clip the image to the frame size
    }
}

struct FramedImage2: View {
    let uiImage: UIImage

    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 162, height: 135) // Set the size of the content image
            .clipped() // Clip the image to the frame size
    }
}



//                                    switch index % 6 {
//                                    case 0:
//                                        TitleDate1(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
//                                    case 1:
//                                        TitleDate2(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
//                                    case 2:
//                                        TitleDate3(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
//                                    case 3:
//                                        TitleDate4(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
//                                    case 4:
//                                        TitleDate5(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
//                                    case 5:
//                                        TitleDate6(title: scrapBookInfo.name, date: scrapBookInfo.date, image: uiImage!)
//                                    default:
//                                        EmptyView()
//                                    }

//                                if index == 0 {
//                                    TitleDate1(title: "Title 1", date: "8 May", image: UIImage(named: "Monas")!)}
//                                    TitleDate2(title: "Title 2", date: "Date 2", image: UIImage(named: "Dufan")!)
//                                    TitleDate3(title: "Title 3", date: "Date 3", image: UIImage(named: "TMII")!)
//                                    TitleDate4(title: "Title 4", date: "Date 4", image: UIImage(named: "KotaTua")!)
//                                    TitleDate5(title: "Title 5", date: "Date 5", image: UIImage(named: "Ragunan")!)
//                                    TitleDate6(title: "Title 6", date: "Date 6", image: UIImage(named: "GBK")!)
//                                } else {
////                                    TitleDate1(title: "Monas", date: "8 May", image: UIImage(named: "Dkandang")!)
//
