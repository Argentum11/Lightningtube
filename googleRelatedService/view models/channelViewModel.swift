import Foundation
class channelViewModel:ObservableObject{
    @Published var channelItems=[channel]()
    func fetchchannel(channelId:String){
        let finalUrl="https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id="+channelId+"&key="+apiKey
        if let url=URL(string: finalUrl){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data=data{
                    do{
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let searchResponse = try decoder.decode(channelResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.channelItems = searchResponse.items
                        }
                    }catch{
                    }
                }else{
                }
            }.resume()
        }
    }
 
}

