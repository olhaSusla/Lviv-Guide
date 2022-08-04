//
//  LocationManager.swift
//  Lviv Guide
//
//  Created by Ольга on 02.08.2022.
//

import Foundation

class AppLocationManager {

    static let shared = AppLocationManager()

    var places = [Place]()
    var routes = [Route]()

    private init() {
//        places.append(Place(name:"Victoria Gardens",
//                            latitude: 49.8073321,
//                            longitude: 23.9770634,
//                            info: "Shopping mall",
//                            imageName: "VictoriaGardens",
//                            audioGuideName: "cat",
//                            address: "st.Kulparkivska, 226a, Lviv, Lviv region"))
//
//        places.append(Place(name: "Market",
//                            latitude: 49.8033119,
//                            longitude: 23.9928793,
//                            info: "Small local market",
//                            imageName: "VictoriaGardens",
//                            audioGuideName: nil))
//
//        places.append(Place(name: "Post office",
//                             latitude: 49.8053344,
//                             longitude: 23.9877888,
//                             info:"Nearest post office",
//                             audioGuideName: "cat"))
       
        places.append(Place(name: "Lviv Opera Theater",
                            latitude: 49.844182728201936,
                            longitude: 24.026223027077492,
                            info: "The Solomiya Krushelnytska Lviv State Academic Theatre of Opera and Ballet or Lviv Opera is an opera house located in Lviv, Ukraine's largest western city and one of both Polish and Ukrainian historic cultural centers. Originally built on former marshland of the submerged Poltva River, the Lviv Opera now located on Freedom Avenue, the tree-lined centerpiece of Lviv's historic Old City, a UNESCO World Heritage Site located in the city's Halych district. \n According to the inscription in the theater lobby, the building was constructed between 1897 and 1900, and has remained standing throughout several changes in history. \n In 2000, the Lviv Opera celebrated its own centennial with another renaming, this time after one of the city's native daughters, Solomiya Krushelnytska, a renowned soprano of the early 20th century.",
                            imageName: "LvivOperaTheater",
                            audioGuideName: "LvivGuide",
                            address: "Svobody av., 28, Lviv",
                            url: "https://en.wikipedia.org/wiki/Lviv_Theatre_of_Opera_and_Ballet"))
        
        places.append(Place(name: "The Bernardine Monastery",
                            latitude: 49.83967786787572,
                            longitude: 24.03452261338716,
                            info: "The Bernardine church and monastery in Lviv, Ukraine, is located in the city's Old Town, south of the market square. The monastery along with the Roman Catholic church of St. Andrew, today the Greek Catholic church of St. Andrew, now belong to the Order of St. Basil the Great.",
                            imageName: "TheBernardineMonastery",
                            audioGuideName: nil,
                            address: "Cathedral Square, 1, Lviv",
                            url: "https://en.wikipedia.org/wiki/Bernardine_Church,_Lviv"))
    
        places.append(Place(name: "The House Of Scientists",
                            latitude: 49.84120644491674,
                            longitude: 24.021442184552235,
                            info: "House of Scientists — former casino for Lviv’s elite — is one of the most stunning buildings in Lviv. It is recognized as a valuable neo-baroque architectural icon.The building was designed and executed by the famous Austrian company Fellner and Helmer in 1898.",
                            imageName: "TheHouseOfScientists",
                            audioGuideName: nil,
                            address: "Listopadovoy Chinu Street, 6, Lviv",
                            url: "https://www.lvivconvention.com.ua/en/location/house-of-scientists/"))
        
        places.append(Place(name: "The Potocki Palace",
                            latitude: 49.838105369703165,
                            longitude: 24.026874440377217,
                            info: "The Potocki Palace in Lviv was built in the 1880s as an urban seat of Alfred Józef Potocki, former Minister-President of Austria. No cost was spared to make it the grandest nobleman's residence in the city.",
                            imageName: "TheHouseOfScientists",
                            audioGuideName: nil,
                            address: "Kopernyka street, 15, Lviv",
                            url: "https://en.wikipedia.org/wiki/Potocki_Palace,_Lviv"))
        
        places.append(Place(name: "Boim Chapel",
                            latitude: 49.84090547578322,
                            longitude: 24.031064498047257,
                            info: "The Boim Chapel is a monument of religious architecture in Cathedral Square, Lviv, Ukraine. It was constructed from 1609 to 1615 and is part of Lviv's Old Town, a UNESCO World Heritage Site.",
                            imageName: "BoimChapel",
                            audioGuideName: nil,
                            address: "Cathedral square, 1, Lviv",
                            url: "https://en.wikipedia.org/wiki/Boim_Chapel"))
        
        places.append(Place(name: "Italian courtyard",
                            latitude: 49.842470755647454,
                            longitude: 24.033037926882287,
                            info: "The Korniakt Palace has its inner courtyard, known as the \"Italian courtyard\" in Lviv. It was created in the time of King Jan III Sobieski, after two palace buildings were joined together. For some time the famous Italian-origin wife of the king - Marie Casimire Louise de La Grange d'Arquien, better known as Marysieńka, lived there.",
                            imageName: "ItaliancourtyardLviv",
                            audioGuideName: nil,
                            address: "Rynok square, 6, Lviv",
                            url: "https://lviv.travel/en/places/attractions/italiiskii-dvorik"))
        
        places.append(Place(name: "Ivan Franko National University of Lviv ",
                            latitude: 49.84174553540889,
                            longitude: 24.022630212673914,
                            info: "The University of Lviv,  presently the Ivan Franko National University of Lviv is the oldest institution of higher learning in present-day Ukraine dating from 1661 when John II Casimir, King of Poland, granted it its first royal charter.",
                            imageName: "University",
                            audioGuideName: nil,
                            address: "Rynok square, 6, Lviv",
                            url: "https://en.wikipedia.org/wiki/University_of_Lviv"))
        
        places.append(Place(name:"Bachevski restourant",
                            latitude: 49.84239353434731,
                            longitude: 24.02992968470734,
                            info: "Restaurant of new Galician cuisine. A large selection of vodkas and liqueurs. Exquisite Galician breakfasts with live music.",
                            imageName: "bachevskiRestourant",
                            audioGuideName: nil,
                            address: "Shevska Street, 8, Lviv",
                            url: "https://baczewski.virtual.ua/ua/"))
        
        places.append(Place(name: "Lviv Chocolate Factory ",
                            latitude: 49.84612771184733,
                            longitude: 24.03216411786977,
                            info: "If you want to try what real Lviv chocolate is, the Lviv Chocolate Workshop is waiting for you! It is here that you will try exclusive chocolate recipes, taste drinks using this product, and experience many new experiences, because the Lviv chocolate workshop will definitely find something to surprise you with.",
                            imageName: "chocolatefactory",
                            audioGuideName: nil,
                            address: "Serbska street, 3,  Lviv",
                            url: "https://lvivtc.com.ua/thematic-cafes-of-lviv/lviv-chocolate-workshop/"))
        
        places.append(Place(name:"Churchof Sts. Olha and Elizabeth",
                            latitude: 49.83709369337668,
                            longitude: 24.004703140269207,
                            info: "The Church of Sts. Olha and Elizabeth is located between the city's main rail station and the Old Town. It was originally built as the Roman Catholic Church of St. Elizabeth and today serves as the Greek Catholic Church of Sts. Olha and Elizabeth.",
                            imageName: "ChurchofSts.OlhaandElizabeth",
                            audioGuideName: nil,
                            address: "Kropyvnytskogo Square, 1, Lviv",
                            url: "https://en.wikipedia.org/wiki/Church_of_Sts._Olha_and_Elizabeth,_Lviv"))
        
        places.append(Place(name:"City Hall Lviv",
                            latitude: 49.84214039471897,
                            longitude: 24.03177154037734,
                            info: "The city of Lviv, Ukraine has had a series of town hall buildings since approximately 1357. These have for centuries been recognized landmarks of the community. The modern building located at Market Square, 1 is the residence of the Lviv City Council. It is included into a UNESCO World Heritage list as part of the Historic City Centre Ensemble.",
                            imageName: "CityHallLviv",
                            audioGuideName: nil,
                            address: "Market Square, 1, Lviv",
                            url: "https://en.wikipedia.org/wiki/Lviv_Town_Hall"))
        
        places.append(Place(name:"Craft Kumpel Lviv",
                            latitude: 49.84385097704056,
                            longitude: 24.030762558311174,
                            info: "Local beer bar.",
                            imageName: "CraftKumpel",
                            audioGuideName: nil,
                            address: "Market Square, 18, Lviv",
                            url: "https://craft-kumpel-futura.virtual.ua/ua/"))
        
        places.append(Place(name:"Dominican cathedral",
                            latitude: 49.84295388632138,
                            longitude: 24.033941215232243,
                            info: "The Dominican church and monastery in Lviv, Ukraine is located in the city's Old Town, east of the market square. It was originally built as the Roman Catholic church of Corpus Christi, and today serves as the Greek Catholic church of the Holy Eucharist.",
                            imageName: "dominicancathedrallviv",
                            audioGuideName: nil,
                            address: "Museum Square, Lviv",
                            url: "https://en.wikipedia.org/wiki/Dominican_Church,_Lviv"))
        
        places.append(Place(name:"Lviv Coffee Manufacture",
                            latitude: 49.84181778085642,
                            longitude: 24.03278896950255,
                            info: "Only here beans are mined from beneath Lviv’s Rynok Square.Only here you can feel the aroma and the atmosphere of the real Lviv.Only here you can buy nice Lviv souvenirs.A restaurant with a deep history which was started by Yuriy Kulchytsky in 1675 when coffee beans were set in the minery like natural resources.",
                            imageName: "lvivCoffeeManufacture",
                            audioGuideName: nil,
                            address: "Market Square, 10, Lviv",
                            url: "https://www.fest.lviv.ua/en/restaurants/coffeemanufacture/"))
        
        places.append(Place(name:"Lviv High Castle",
                            latitude: 49.849001925205265,
                            longitude: 24.03936805433107,
                            info: "The Lviv High Castle is a historic castle located on the top of the Castle Hill of the city of Lviv. It is currently the highest point in the city, 413 metres (1,355 ft) above sea level. The castle currently stands in ruins.",
                            imageName: "LvivHighCastle",
                            audioGuideName: nil,
                            address: "Zamkova 10, Lviv",
                            url: "https://en.wikipedia.org/wiki/Lviv_High_Castle"))
        
        places.append(Place(name:"Lychakiv Cemetery",
                            latitude: 49.83261252720762,
                            longitude: 24.05606954026907,
                            info: "Lychakiv Cemetery, officially State History and Culture Museum-Preserve \"Lychakiv Cemetery\", is a historic cemetery in Lviv, Ukraine.",
                            imageName: "LychakivCemetery",
                            audioGuideName: nil,
                            address: "Mechnikova Street, 33,  Lviv",
                            url: "https://en.wikipedia.org/wiki/Lychakiv_Cemetery"))
        
        places.append(Place(name:"Rynok Square",
                            latitude: 49.84144866344125,
                            longitude: 24.031592298047325,
                            info: "Rynok Square is a central square of the city of Lviv, Ukraine. According to archaeological data, the square was planned in the second half of the 13th century, during the reign of Prince Leo I of Galicia.",
                            imageName: "RynokSquare",
                            audioGuideName: nil,
                            address: "Market Square, 1, Lviv",
                            url: "https://en.wikipedia.org/wiki/Market_Square_(Lviv)"))
        
        places.append(Place(name:"Lviv Railway Station",
                            latitude: 49.84004604765659,
                            longitude: 23.99378755571719,
                            info: "Lviv-Holovnyi railway station is the main railway terminal in Lviv, Ukraine. It is one of the most notable pieces of Art Nouveau architecture in former Galicia.Lviv-Holovnyi railway station is the main railway terminal in Lviv, Ukraine. It is one of the most notable pieces of Art Nouveau architecture in former Galicia.Lviv-Holovnyi railway station is the main railway terminal in Lviv, Ukraine. It is one of the most notable pieces of Art Nouveau architecture in former Galicia.Lviv-Holovnyi railway station is the main railway terminal in Lviv, Ukraine. It is one of the most notable pieces of Art Nouveau architecture in former Galicia.",
                            imageName: "LvivRailwayStation",
                            audioGuideName: "cat",
                            address: "Courtyard square 1, Lviv",
                            url: "https://en.wikipedia.org/wiki/Lviv_railway_station"))
        
        
        places.append(Place(name:"St. George's Cathedral",
                            latitude: 49.8387867116782,
                            longitude: 24.01295361338716,
                            info: "St. George's Cathedral is a baroque-rococo cathedral located in the city of Lviv, the historic capital of western Ukraine. It was constructed between 1744-1760[1] on a hill overlooking the city.",
                            imageName: "StGeorge'sCathedralLviv",
                            audioGuideName: nil,
                            address: "St. Yura Square, 5, Lviv",
                            url: "https://en.wikipedia.org/wiki/St._George%27s_Cathedral,_Lviv"))
        
        
        
        
        routes.append(Route (places: [places[0], places[4], places[5], places[17], places[10], places[12], places[14]],
                             name: "Magnifical Lviv",
                             imageName: "Lviv",
                             discription: "We offer an opportunity to follow the paths of old Lviv, explore the thousand-year history of the royal city, visit an open-air museum and experience the magic of Lviv."))
        
        routes.append(Route (places: [places[1], places[3], places[2], places[6], places[9], places[18], places[17]],
                             name: "Discover Lviv",
                             imageName: "Lviv2",
                             discription: "Lviv – it’s a marvelous city. Everywhere you go you’ll find something special and interesting which is worth seeing. Our guide shows you 7 wonder’s – 7 the most popular and amazing places, majestic churches and buildings."))
        
        routes.append(Route (places: [places[7], places[8], places[13], places[11], places[16]],
                             name: "Taste Of Lviv",
                             imageName: "coffeeAndChocolate",
                             discription: "Culinary connoisseurs and off-beat travelers will enjoy a Food Tour of Lviv. You and your private guide will stop at five locations to taste various dishes and non-alcoholic beverages. Each restaurant is unique, offering a different decor, menu, and experience"))
    }

}

        
        
        

// add locations to roads +
// main view add buttons
// add info to opera house +
