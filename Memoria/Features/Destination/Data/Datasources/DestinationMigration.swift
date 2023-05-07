// swiftlint:disable line_length
//
//  DestinationMigration.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 25/04/23.
//

import CoreData
import Combine

class DestinationMigration {

    let context: NSManagedObjectContext
   

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    private lazy var destinations: [Destination] = {
        var x = [Destination]()
            let jakarta = Area(id: UUID(), name: "Jakarta", province: "DKI Jakarta", description: "The Capital of Republic Indonesia", image: "Jakarta")
                let bogor = Area(id: UUID(), name: "Bogor", province: "West Java", description: "The City of Rain", image: "Bogor")
                let depok = Area(id: UUID(), name: "Depok", province: "West Java", description: "The City of Star Fruit", image: "Depok")
                let tangerang = Area(id: UUID(), name: "Tangerang", province: "Banten", description: "The City of Fotress", image: "Tangerang")
                let bekasi = Area(id: UUID(), name: "Bekasi", province: "West Java", description: "The City of Patriot", image: "Bekasi")
                
                // Jakarta
                x.append(Destination(id: UUID(), area: jakarta, name: "Monumen Nasional (Monas)", description: "The National Monument or popularly called Monas is a memorial monument that has a height of 132 meters or about 433 feet and was built in an area of 80 hectares. Monas itself has a beauty that is located at the top of the monument because there is a tongue of fire coated with gold sheets that illustrate the spirit of the Indonesian people's struggle that burns like fire.", photo: "Monas", address: "Gambir Street, Gambir District, Central Jakarta City, DKI Jakarta", coordinate: Coordinate(latitude: -6.175392, longitude: 106.827153), ticketPrice: "Rp. 2000 - Rp. 15.000", webstite: nil, instagram: "https://www.instagram.com/monumen.nasional/?hl=en"))
                
                x.append(Destination(id: UUID(), area: jakarta, name: "Kota Tua", description: "Kota Tua, also known as Batavia Lama (Oud Batavia), is a small neighborhood in Jakarta, Indonesia. This particular area has an area of 1.3 square kilometers across North Jakarta and West Jakarta (Pinangsia, Taman Sari and Roa Malaka). Dubbed the \"Jewel of Asia\" and \"Queen of the East\" in the 16th century by European voyagers, Old Jakarta was considered a trading center for the Asian continent due to its strategic location and abundant resources.", photo: "KotaTua", address: "Pintu Besar Utara Street Number 27, Rt 07 / Rw 07, Pinangsia, Tamansari, West Jakarta, DKI Jakarta", coordinate: Coordinate(latitude: -6.137645, longitude: 106.817124), ticketPrice: "Free - Rp. 5.000", webstite: "https://www.wisatakotatua.com", instagram: "https://www.instagram.com/kotatuajakarta.id/?hl=en"))
                
                x.append(Destination(id: UUID(), area: jakarta, name: "Gelora Bung Karno (GBK)", description: "GBK is a multi-purpose sports complex located in Senayan, Jakarta, Indonesia. The sports complex was named in honor of Soekarno, the first President of Indonesia who was the originator of the idea of building the GBK complex. Not only does it function as a space for sports, President Soekarno also hopes that the GBK stadium complex will also serve as the lungs of the city and an open space where citizens gather.", photo: "GBK", address: "Pintu Satu Senayan Street, Gelora, Tanah Abang District, Central Jakarta City, DKI Jakarta 10270", coordinate: Coordinate(latitude: -6.21857, longitude: 106.801797), ticketPrice: "Free", webstite: "https://gbk.id/", instagram: "https://www.instagram.com/love_gbk/?hl=en"))

                x.append(Destination(id: UUID(), area: jakarta, name: "Dunia Fantasi (Dufan)", description: "Dunia Fantasi (Dufan) is an entertainment attraction in Taman Impian Jaya Ancol, North Jakarta and has many game rides and as an edutainment area. Dunia Fantasi is the first theme park in Indonesia like Disney Land, Universal Studios or Trans Studio.", photo: "Dufan", address: "Lodan Timur Street Number 7, Ancol, Pademangan District, North Jakarta, DKI Jakarta 14430", coordinate: Coordinate(latitude: -6.125312, longitude: 106.833538), ticketPrice: "Rp. 275.000 - Rp. 350.000", webstite: "https://www.ancol.com/unit-rekreasi/dufan-ancol--2", instagram: "https://www.instagram.com/infodufan/?hl=en"))

                x.append(Destination(id: UUID(), area: jakarta, name: "Ragunan", description: "Ragunan Zoo or Taman Margasatwa Ragunan is more than 150 years old, and was the first zoo in Indonesia. Its name is familiar to the Indonesian people, and it is a favorite location for holding various school activities or reunions. Because the location is very wide, besides that the entrance fee is very cheap. The atmosphere at Ragunan Zoo is shady, because of the many trees.", photo: "Ragunan", address: "Harsono RM. Street Number 1, Ragunan, Pasar Minggu, South Jakarta 12550 Indonesia", coordinate: Coordinate(latitude: -6.301752, longitude: 106.820788), ticketPrice: "Rp. 3.000 - Rp. 4.000", webstite: "https://ragunanzoo.jakarta.go.id/language/id/", instagram: "https://www.instagram.com/ragunanzoo/?hl=en"))
                
                x.append(Destination(id: UUID(), area: jakarta, name: "Taman Mini Indonesia Indah", description: "This park is a summary of the culture of the Indonesian nation, which covers various aspects of the daily life of the people of 33 Indonesian provinces (in 1975) which are displayed in regional platforms with traditional architecture, as well as displaying various clothing, dances and regional traditions.", photo: "TMII", address: "Taman Mini Street, East Jakarta, DKI Jakarta, Indonesia", coordinate: Coordinate(latitude: -6.302446, longitude: 106.895156), ticketPrice: "Rp. 25.000", webstite: "https://www.tamanmini.com/pesona_indonesia/", instagram: "https://www.instagram.com/TMIIOfficial/"))

                // Bogor
                
                x.append(Destination(id: UUID(), area: bogor, name: "Bogor Botanical Gardens (Kebun Raya Bogor)", description: "Bogor Botanical Garden is a large botanical garden located in Bogor City, Indonesia. It covers 87 hectares and has 15,000 species of tree and plant collections. Nowadays, Bogor Botanical Garden is visited by many tourists, especially on Saturdays and Sundays.", photo: "KebunRaya", address: "Ir. H. Juanda Street Number 13, Paledang, Central Bogor District, Bogor City, West Java 16122", coordinate: Coordinate(latitude: -6.597629, longitude: 106.79957), ticketPrice: "Rp. 15.000 - Rp. 25.000", webstite: "https://kebunraya.id/bogor", instagram: "https://www.instagram.com/kebunraya_id/"))

                x.append(Destination(id: UUID(), area: bogor, name: "Devoyage Bogor", description: "Devoyage Bogor is the newest tourist destination in Bogor with a typical European concept. Located on the Boulevard Bogor Nirwana Residence Mulyaharja South Bogor, Bogor city, West Java. There are very distinctive European-style miniatures such as the Paris Eiffel Tower, Dutch Windmill Landmarks and others to make a selfie spot.", photo: "Devoyage", address: "Bogor Street Number 240, Mulyaharja, South Bogor District, Bogor City, West Java 16135", coordinate: Coordinate(latitude: -6.637089, longitude: 106.795362), ticketPrice: "Rp. 30.000 - Rp. 40.000", webstite: "https://devoyagebogor.net/", instagram: "https://www.instagram.com/devoyagebogor/?hl=en"))

                x.append(Destination(id: UUID(), area: bogor, name: "The Jungle Waterpark Bogor", description: "The Jungle Waterpark or better known as The Jungle Waterpark Bogor is one of the most visited family tourism areas in the city of Bogor which was inaugurated on December 16, 2007. The scenery is beautiful and the air is cool, occupying an area of 4.8 hectares with 60% of the total area is an open green area in southern Bogor. The water rides in The Jungle Waterpark Bogor are one of the most complete water rides in Bogor.", photo: "JungleWaterpark", address: "Bogor Nirwana Boulevard Dreded Pahlawan Street, Bogor Nirwana Residence, Mulyaharja, South Bogor District, Bogor City, West Java 16132, Indonesia", coordinate: Coordinate(latitude: -6.634512, longitude: 106.795241), ticketPrice: "Rp. 50.000 - Rp. 68.000", webstite: "https://www.junglebogor.com/", instagram: "https://www.instagram.com/thejunglebogor/"))

                x.append(Destination(id: UUID(), area: bogor, name: "Taman Safari Indonesia Bogor", description: "Taman Safari Indonesia Bogor is one of the favorite family tourist destinations in the Puncak area. Besides being equipped with a diverse collection of animals, Taman Safari is also enriched with various playgrounds. More than just a zoo, this tourist attraction presents a variety of vacation rides as well as environmental science, which is oriented towards preserving the habitat of various fauna species.", photo: "TamanSafari", address: "Jalan Kapten Harun Kabir Number 724, Cibeureum, Cisarua District, Bogor Regency, West Java 16750", coordinate: Coordinate(latitude: -6.718899, longitude: 106.950732), ticketPrice: "Rp. 200.000 - Rp. 350.000", webstite: "https://bogor.tamansafari.com/", instagram: "https://www.instagram.com/taman_safari/?hl=en"))

                x.append(Destination(id: UUID(), area: bogor, name: "Mekarsari Fruit Garden (Taman Buah Mekarsari)", description: "Mekarsari Fruit Park Tourism Bogor is one of the famous agro-tourism recreation places in Bogor. Mekarsari Fruit Park has 1,470 varieties of fruit plants and 100,000 trees, including spice plants, biopharma plants, food plants, ornamental plants, vegetable plants, industrial plants, protective plants, and rare plants such as bunga bangkai, sawo kecik, persimmon, as well as tropical plants such as salak, jackfruit, orange, rambutan, star fruit, melon, and many more.", photo: "Mekarsari", address: "Cileungsi Street -Jonggol KM.3, Mekarsari, Cileungsi, Bogor Regency, West Java 16820", coordinate: Coordinate(latitude: -6.414656, longitude: 106.986557), ticketPrice: "Rp. 35.000 - Rp. 85.000", webstite: "https://mekarsari.com/web/", instagram: "https://www.instagram.com/mekarsari_fruitgarden/"))

                x.append(Destination(id: UUID(), area: bogor, name: "JungleLand Adventure Theme Park", description: "JungleLand Adventure Theme Park is a recreation and playground located in the Sentul Nirwana area, Bogor. This tourist destination offers dozens of rides that are divided into four zones. This recreational park with Mount Pancar as the background has rides suitable for various ages.", photo: "JungleLand", address: "Sentul Nirwana Area, Jungle Land Street Number 1, Karang Tengah, Babakan Madang District, Bogor Regency, West Java 16810", coordinate: Coordinate(latitude: -6.572221, longitude: 106.894703), ticketPrice: "Rp. 165.000 - Rp. 250.000", webstite: "https://jungleland.id/", instagram: "https://www.instagram.com/jungleland_indo/"))
                
                // Depok

                x.append(Destination(id: UUID(), area: depok, name: "Dian Al-Mahri Golden Dome Mosque", description: "Dian Al-Mahri Mosque or better known as the Golden Dome Mosque is the largest mosque complex located in Depok City, West Java Province, Indonesia. In addition to being a place of daily Muslim worship, the mosque complex is also a family tourism area and attracts many people because of its gold dome. Due to its large area and accessibility to the public, it is often a destination for family vacations or resting places.", photo: "Al-Mahri", address: "Meruyung Raya Street, Meruyung, Limo District, Depok City, West Java 16515", coordinate: Coordinate(latitude: -6.383909, longitude: 106.771938), ticketPrice: "Free", webstite: nil, instagram: nil))

                x.append(Destination(id: UUID(), area: depok, name: "Wiladatika Recreation Park", description: "Wiladatika Recreation Park is a tourist attraction located in Cimanggis, Depok. It has the National Scout Education and Training Center (Pusdiklatmas), the Education Development Center for the Implementation of the Guidelines for the Creation and Practice of Pancasila (P4), a reception hall commonly used for wedding receptions and a green lawn commonly used by visitors for picnics with their families.", photo: "Wiladatika", address: "Jambore Street Number 1, Harjamukti, Cimanggis District, Depok City, West Java 13720", coordinate: Coordinate(latitude: -6.3702, longitude: 106.893327), ticketPrice: "Rp. 10.000 - Rp. 100.000", webstite: nil, instagram: "https://www.instagram.com/wiladatika_cibubur/?hl=en"))

                x.append(Destination(id: UUID(), area: depok, name: "D'kandang Depok (D'Kandang Amazing Farm)", description: "D'Kandang Amazing Farm is one of the references for a fun vacation spot in the city of Depok, West Java. This tourist spot is recommended for all groups and all ages. This tourist spot is very appropriate to visit, because it is an educational tour for them about the world of animal husbandry and agriculture.", photo: "Dkandang", address: "Penarikan Street (Perum PGRI), RT 07 / RW 02, Pasir Putih Village, Sawangan District, Depok City, West Java", coordinate: Coordinate(latitude: -6.415876, longitude: 106.784568), ticketPrice: "Rp. 20.000 - Rp. 25.000", webstite: "https://dkandang.co.id/", instagram: "https://www.instagram.com/dkandang/?hl=en"))

                x.append(Destination(id: UUID(), area: depok, name: "Godongijo Tourism Park (Godongijo)", description: "Godongijo is an educational tourist spot located in Depok City with the concept of \"Forest in the Middle of the City\", where we can learn about ecology and ecosystems. Godongijo tourist attractions have several complete facilities for all ages, so it's no wonder this place is always used as a place for formal and non-formal events.", photo: "Godongijo", address: "Cinangka Street Number 60, Serua, Bojongsari, Depok City, West Java, Indonesia 16517", coordinate: Coordinate(latitude: -6.370721, longitude: 106.745051), ticketPrice: "Rp. 65.000 - Rp. 135.000", webstite: "https://godongijo.com/", instagram: "https://www.instagram.com/godongijoofficial/"))

                x.append(Destination(id: UUID(), area: depok, name: "Pasir Putih Tourism Park", description: "Pasir Putih Tourism Park is located in Sawangan, Depok, West Java. This recreation area offers a variety of play and vacation experiences for children and adults. Pasir Putih Tourism Park has various exciting rides and facilities. From water games and outbound rides for children, to bungalows, karaoke, fishing ponds, and futsal courts for teenagers and adults can be used for fun.", photo: "PasirPutih", address: "Garuda Raya Street Number 1, RT.01 / RW.07, Pasir Putih, Sawangan District, Depok City, West Java 16519", coordinate: Coordinate(latitude: -6.433063, longitude: 106.787352), ticketPrice: "Rp. 30.000 - Rp. 40.000", webstite: nil, instagram: "https://www.instagram.com/waterparkpasirputih/?hl=en"))

                x.append(Destination(id: UUID(), area: depok, name: "Taman Lembah Gurame", description: "Taman Lembah Gurame is one of the parks that has the largest green open space in Depok City. Taman Lembah Gurame is surrounded by several plants and trees of various types on an area of approximately 3 hectares. This park is always crowded by those who want to do various activities, ranging from jogging, playing with children, relaxing, studying together, and even hanging out with friends.", photo: "TamanLembah", address: "Nangka Raya Street Number 68, Depok Jaya, Pancoran Mas District, Depok City, West Java 16432", coordinate: Coordinate(latitude: -6.394578, longitude: 106.808949), ticketPrice: "Free", webstite: nil, instagram: nil))
                
                // Tangerang

                x.append(Destination(id: UUID(), area: tangerang, name: "Scientia Square Park", description: "Scientia Square Park is a tourist location that combines several elements, ranging from education, playgrounds, and facilities for exercise. In addition, despite being in a busy area Scientia Square Park feels cool with the shade of the existing trees. With more than 1 hectare of land, Scientia Square Park provides a variety of fun and exciting outdoor activities.", photo: "Scientia", address: "Scientia Boulevard Street, Curug Sangereng, Kelapa Dua, Tangerang, Banten, Indonesia, 15810", coordinate: Coordinate(latitude: -6.257042, longitude: 106.6155), ticketPrice: "Rp. 45.000 - Rp. 95.000", webstite: "https://www.scientiasquarepark.com/", instagram: "https://www.instagram.com/scientiasquare.park/"))

                x.append(Destination(id: UUID(), area: tangerang, name: "Boen Tek Bio Chinese Temple", description: "Boen Tek Bio Temple is the oldest temple in the Kalipasir area, Tangerang. This temple is estimated to have been built since 1684. The name Boen Tek Bio has a certain meaning. The word \"boen\" means intellectual, \"tek\" means virtue, and \"bio\" means place of worship. So, Boen Tek Bio means a place of worship that forms intellectual people with virtue.", photo: "BoenTekBio", address: "Bhakti Street Number 14, RT.001 / RW.004, Sukasari, Tangerang District, Tangerang City, Banten 15118", coordinate: Coordinate(latitude: -6.179129, longitude: 106.62967), ticketPrice: "Free", webstite: nil, instagram: nil))

                x.append(Destination(id: UUID(), area: tangerang, name: "Ocean Park BSD", description: "Ocean Park BSD is a modern waterpark located in an elite area in South Tangerang City. This modern waterpark is located on an area of 8.6 hectares, with a variety of exciting and fun rides. Ocean Park BSD is the 17th best waterpark in Asia Pacific, and is always crowded especially on weekends or holidays.", photo: "OceanPark", address: "Pahlawan Seribu Street, CBD Area, Lengkong Gudang, Serpong, South Tangerang City, Banten, Indonesia, 15310", coordinate: Coordinate(latitude: -6.292498, longitude: 106.669375), ticketPrice: "Rp. 65.000 - Rp. 100.000", webstite: "https://oceanpark.co.id/", instagram: "https://www.instagram.com/oceanparkbsd/?hl=en"))

                x.append(Destination(id: UUID(), area: tangerang, name: "Benteng Heritage Museum", description: "Benteng Heritage Museum is the first museum of Chinese descent in Indonesia. The museum is the result of the restoration of an old building with traditional Chinese architecture. The museum presents collections and activities related to Chinese descendants, especially Benteng Chinese.", photo: "BentengHeritage", address: "Cilame Street Number 18 & 20, RT.001 / RW.004, Pasar Lama, Tangerang District, Tangerang City, Banten 15118", coordinate: Coordinate(latitude: -6.178687, longitude: 106.629668), ticketPrice: "Rp. 10.000 - Rp. 50.000", webstite: "https://bentengheritage.com/", instagram: "https://www.instagram.com/bentengheritage/"))

                x.append(Destination(id: UUID(), area: tangerang, name: "Taman Potret", description: "Taman Potret is one of the most visited thematic parks in Tangerang, especially in the afternoon and evening. The park, which is the pride of Tangerang City, is also known as a park that has many instagramable spots. Taman Potret is one of 26 parks in Tangerang City which is quite large because it was built on an area of 5 hectares.", photo: "TamanPotret", address: "Jendral Sudirman Street RT.001 / RW.005, Babakan, Tangerang City, Banten, Indonesia 15118", coordinate: Coordinate(latitude: -6.195261, longitude: 106.632193), ticketPrice: "Free", webstite: nil, instagram: nil))

                x.append(Destination(id: UUID(), area: tangerang, name: "Branchsto Equestrian Park", description: "Branchsto Equestrian Park is a tourist attraction that carries the concept of a horse farm. Various exciting activities can be done here, such as pony riding, ATV and UTV/Gokart riding, andong riding, scooter playing, archery playing, pony feeding, and private horse training with the guidance of a trainer.", photo: "Branchsto", address: "BSD City, BSD Raya Barat Street, Pagedangan, Serpong, Tangerang, Banten, Indonesia, 15339", coordinate: Coordinate(latitude: -6.295395, longitude: 106.623771), ticketPrice: "Free - Rp. 80.000", webstite: "https://www.branchsto.com/", instagram: "https://www.instagram.com/branchsto/?hl=en"))

                // Bekasi
                
                x.append(Destination(id: UUID(), area: bekasi, name: "Transera Waterpark", description: "Transera Waterpark is a waterpark that gives visitors a lot of fun. Because here offers 2 zones to play, namely waterpark and drypark. Designed to be a world-class game vehicle with the concept of African natural nuances. Making this tourist location always crowded, especially during weekends or holidays. There are 23 rides in Transera Waterpark Bekasi, all of which have different levels of excitement.", photo: "Transera", address: "Harapan Indah Boulevard Street, Pusaka Rakyat, Tarumajaya District, Bekasi Regency, West Java 17214", coordinate: Coordinate(latitude: -6.15357, longitude: 106.975825), ticketPrice: "Rp. 45.000 - Rp. 120.000", webstite: nil, instagram: "https://www.instagram.com/transerawaterpark.bekasi/?hl=en"))

                x.append(Destination(id: UUID(), area: bekasi, name: "Summarecon Mall Bekasi", description: "Summarecon Mall Bekasi is the latest creation from Summarecon which began operating on June 28, 2013. Taking the concept of \"Your Family Mall\", Summarecon Mall Bekasi becomes the latest shopping icon by presenting a unique shopping concept for families. Summarecon Mall Bekasi offers a wide selection of fashion from various local and international brands. There are also a series of shopping programs that will be presented in various events as a benefit for visitors.", photo: "Summarecon", address: "Sentra Summarecon Bekasi, Boulevard Ahmad Yani Street, Marga Mulya, North Bekasi District, Bekasi City, West Java 17142", coordinate: Coordinate(latitude: -6.226128, longitude: 107.001076), ticketPrice: "Free", webstite: "https://www.malbekasi.com/", instagram: "https://www.instagram.com/summareconmal.bekasi/"))

                x.append(Destination(id: UUID(), area: bekasi, name: "Patriot Bina Bangsa City Forest Bekasi City", description: "Patriot Bina Bangsa City Forest Bekasi City is one of the choices for visitors who want to get cool air and tranquility under the shade of thousands of scattered trees. The wide open space and spotable, makes this urban forest often used by communities or various groups for filming or just gathering together.", photo: "PatriotBina", address: "A. Yani Street Number 2, RT.004/RW.016, Kayuringin Bekasi, Bekasi City, West Java 17144", coordinate: Coordinate(latitude: -6.234369, longitude: 106.992382), ticketPrice: "Free", webstite: nil, instagram: nil))

                x.append(Destination(id: UUID(), area: bekasi, name: "Trans Snow World Bekasi", description: "Trans Snow World Bekasi is a place where visitors can experience snow without having to go abroad. Trans Snow World Bekasi opened to the public on March 25, 2019. This Bekasi tour presents an indoor or indoor snow game vehicle covering an area of 6,500 square meters. There are various snow game rides such as skiing, snow slides, and so on.", photo: "SnowWorld", address: "Ir. H. Juanda Street Number 180, Margahayu, East Bekasi, Bekasi, West Java, Indonesia, 17113", coordinate: Coordinate(latitude: -6.249671, longitude: 107.016698), ticketPrice: "Rp. 247.500", webstite: "https://www.transentertainment.com/transsnow/bekasi", instagram: "https://www.instagram.com/transsnowworld.bekasi/"))

                x.append(Destination(id: UUID(), area: bekasi, name: "Gedung Juang 45 Bekasi", description: "Gedung Juang 45 Bekasi or also known as Gedung Juang Tambun is a silent witness to the resistance of the Bekasi people to the colonizers. This building is located on Jalan Sultan Hasanudin Number 39, South Tambun. After being renovated, this building was converted into the Bekasi Museum and can be visited by tourists.", photo: "GedungJuang", address: "Sultan Hasanudin Street Number 39, Mekarsari, South Tambun District, Bekasi Regency, West Java 17510", coordinate: Coordinate(latitude: -6.259509, longitude: 107.054671), ticketPrice: "Free", webstite: nil, instagram: "https://www.instagram.com/museumbekasi/?hl=en"))

                x.append(Destination(id: UUID(), area: bekasi, name: "Situ Rawa Gede Bekasi", description: "Situ Rawa Gede Bekasi is one of the tourist attractions in Bekasi City, located near residential areas and factories in Bojong Menteng Village, Rawalumbu District. Situ Rawa Gede Bekasi was originally a water catchment area and water disposal with murky water color due to waste. In fact, this area was previously known as a slum and unkempt place. Until finally the government relocated this place and made it a very interesting tourist attraction.", photo: "RawaGede", address: "RT.005/RW.002, Bojong Menteng, Rawalumbu District, Bekasi City, West Java 17117", coordinate: Coordinate(latitude: -6.294889, longitude: 106.978453), ticketPrice: "Free", webstite: nil, instagram: nil))
                
                return x
            }()


    func addDestinations() -> AnyPublisher<Void, Failure> {
        for destination in destinations {
            let areaRequest = AreaCoreDataModel.fetchRequest()
            areaRequest.predicate = NSPredicate(format: "%K == %@", "name", destination.area.name as CVarArg)
            areaRequest.fetchLimit = 1
            
            let area = try? context.fetch(areaRequest).first
            
            
            let newDestination = NSEntityDescription.insertNewObject(forEntityName: "DestinationCoreDataModel", into: context) as! DestinationCoreDataModel
            
            newDestination.id = UUID()
            newDestination.name = destination.name
            newDestination.descriptions = destination.description
            newDestination.latitude = destination.coordinate.latitude
            newDestination.longitude = destination.coordinate.longitude
            newDestination.photo = destination.photo
            newDestination.address = destination.address
            newDestination.ticketPrice = destination.ticketPrice
            newDestination.website = destination.webstite
            newDestination.instagram = destination.instagram
            
            area?.addToDestinations(newDestination)
            
        }
        do {
            try context.save()

            return Just(()).setFailureType(to: Failure.self)
                .eraseToAnyPublisher()
            
        } catch {
                    print(error)
                    return Fail(error: Failure.destinationMigrationFailure).eraseToAnyPublisher()
                }
    }

}
