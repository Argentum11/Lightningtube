import Foundation
class IdVideoListViewModel:ObservableObject{
    @Published var VideoItems=[video]()
    
    init(){
        fetchItems(playListId: "UU4PooiX37Pld1T8J5SYT-SQ")
    }
    var error: Error? {
        willSet {
            DispatchQueue.main.async {
                self.showError = newValue != nil
            }
        }
    }
    @Published var showError = false
    enum FetchError: Error {
        case invalidURL
    }
    func fetchItems(playListId:String){
        let finalUrl="https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId="+playListId+"&key=AIzaSyCgJmMKX1MHibEthKRHugCjXCtybRoTN40&maxResults=50"
        if let url=URL(string: finalUrl){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data=data{
                    do{
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let searchResponse = try decoder.decode(channelIdPlayListResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.VideoItems = searchResponse.items
                            //print(self.VideoItems)
                        }
                        
                    }catch{
                        self.error = error
                        print(error)
                    }
                }else{
                    self.error = error
                    print(error)
                }
            }.resume()
        }
    }
 
}
