import SwiftUI
import URLImage
struct IdVideoDetail: View {
    let videoItem:video
    
    var body: some View {
        VStack{
            Text(videoItem.snippet.title)
                
            URLImage(videoItem.snippet.thumbnails.medium.url){image in
                image
                    .resizable()
                    .frame(width: 400, height: 240, alignment: .leading)
            }
            Link("馬上觀看", destination: URL(string: "https://www.youtube.com/watch?v="+videoItem.contentDetails.videoId)!)
            NavigationLink(
                destination: gesture2View(),
                label: {
                    HStack{
                        Image(systemName: "ear")
                    }
            })
            Text(videoItem.snippet.description)
                .padding(.leading, 15.0)            
        }
    }
}
