import Foundation
class searchVideoListViewModel:ObservableObject{
    @Published var VideoItems=[searchVideo]()
    
    init(){
        fetchItems(searchingFor: "SpaceX")
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
    func fetchItems(searchingFor:String){
        let finalUrl="https://www.googleapis.com/youtube/v3/search?part=snippet&q="+searchingFor+"&key=AIzaSyAHpLbEd-TYqa-5LDabuIGkPCHSD9Uji-c&type=video&maxResults=50"
        if let url=URL(string: finalUrl){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data=data{
                    do{
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let searchResponse = try decoder.decode(searchPlayListResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.VideoItems = searchResponse.items
                        }
                    }catch{
                        self.error = error
                    }
                }else{
                    self.error = error
                }
            }.resume()
        }
    }
 
}

