import Foundation

struct channelIdPlayListResponse:Codable{
    let nextPageToken:String?
    let items:[video]
}
struct video:Codable,Identifiable{
    var id:String{snippet.title}
    let contentDetails:videoId_time
    let snippet:videoProperty;
}
struct videoId_time:Codable{
    let videoId:String
}
struct videoProperty:Codable {
    let publishedAt:Date
    let channelId:String
    let title:String
    let description:String
    let thumbnails:previewImages
    let channelTitle:String?
}
struct previewImages:Codable{
    let medium:imageDetail
    let high:imageDetail
    let standard:imageDetail?
    let maxres:imageDetail?
}
struct imageDetail:Codable{
    let url:URL
}
/*gmm channel
https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=UC4PooiX37Pld1T8J5SYT-SQ&key=AIzaSyAHpLbEd-TYqa-5LDabuIGkPCHSD9Uji-c
playlist
https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UU4PooiX37Pld1T8J5SYT-SQ&key=AIzaSyAB1mJtve_aAj8JTqFCfqUynYhfBSQxK9I&maxResults=50
 
 https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UURijo3ddMTht_IHyNSNXpNQ&key=AIzaSyAB1mJtve_aAj8JTqFCfqUynYhfBSQxK9I&maxResults=50
 
search
https://www.googleapis.com/youtube/v3/search?part=snippet&q=搜尋的字串&key=AIzaSyAB1mJtve_aAj8JTqFCfqUynYhfBSQxK9I&type=video&maxResults=50
 
https://www.googleapis.com/youtube/v3/search?part=snippet&q=strnetwork&key=AIzaSyAB1mJtve_aAj8JTqFCfqUynYhfBSQxK9I&type=video&maxResults=50
 
json
https://jsoneditoronline.org/
 
套件：
https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/%E4%BD%BF%E7%94%A8-spm-%E5%AE%89%E8%A3%9D%E7%AC%AC%E4%B8%89%E6%96%B9%E5%A5%97%E4%BB%B6-xcode-11-%E6%96%B0%E5%8A%9F%E8%83%BD-2c4ffcf85b4b

https://swiftpackageindex.com/dmytro-anokhin/url-image

youtube api turtorial
https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84%E8%A9%A6%E7%85%89-%E5%8B%87%E8%80%85%E7%9A%84-100-%E9%81%93-swift-ios-app-%E8%AC%8E%E9%A1%8C/101-%E4%BD%BF%E7%94%A8-youtube-data-api-%E6%8A%93%E5%8F%96%E6%9C%89%E8%B6%A3%E7%9A%84-youtuber-%E5%BD%B1%E7%89%87-mv-d05c3a0c70aa

8 任我行
https://drive.google.com/file/d/1dCEvx3wqzxOIkoiuv8QLIKU_Ji31Pp98/view

search
https://drive.google.com/file/d/1PTCUYEUgnAAJAZrcUpSspON_Ez18n6uw/view

envirmonent object
https://drive.google.com/file/d/1w90OLkvIP95a2Y3KNqF9KGbGyJ8gA8GS/view

core data
https://drive.google.com/file/d/1sngkQyrqMB5dnDsCZYkC3Mu8wCHedtEI/view

wigit
https://drive.google.com/file/d/12D_brEQiSfg5rptfevmMhdyg2NenxP2t/view

gesture
https://drive.google.com/file/d/1tzBsz24-8j5IPPUhP3JL-esi491jWrNM/view

要求
https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84%E8%A9%A6%E7%85%89-%E5%8B%87%E8%80%85%E7%9A%84-100-%E9%81%93-swift-ios-app-%E8%AC%8E%E9%A1%8C/%E5%A4%A7%E5%AD%B8%E7%9A%84-swiftui-ios-app-%E5%85%A5%E9%96%80%E8%AA%B2%E7%A8%8B%E6%9C%9F%E6%9C%AB%E5%B0%88%E9%A1%8C-6ea4f32a86dc
*/
