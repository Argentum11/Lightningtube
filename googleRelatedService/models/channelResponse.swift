import Foundation
let apiKey="AIzaSyAHpLbEd-TYqa-5LDabuIGkPCHSD9Uji-c"
struct channelResponse:Decodable{
    let items:[channel]
}
struct channel:Decodable{
    let contentDetails:ContentDetails
}
struct ContentDetails:Decodable{
    let relatedPlaylists:RelatedPlaylists
}
struct RelatedPlaylists:Decodable{
    let uploads:String
}
