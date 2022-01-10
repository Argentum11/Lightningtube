import Foundation
struct searchPlayListResponse:Codable {
    let items:[searchVideo]
}
struct searchVideo:Codable{
    let id:idDetail
    let snippet:videoProperty
    let etag:String
}
struct idDetail:Codable {
    let videoId:String
}
