import SwiftUI
import URLImage
struct IdVideoDetail: View {
    let videoItem:video
    var body: some View {
        ScrollView(content: {
            Text(videoItem.snippet.title)                
            URLImage(videoItem.snippet.thumbnails.medium.url){image in
                image
                    .resizable()
                    .frame(width: 400, height: 240, alignment: .leading)
            }
            Link("馬上觀看", destination: URL(string: "https://www.youtube.com/watch?v="+videoItem.contentDetails.videoId)!)
            Text(videoItem.snippet.description)
                .padding(.leading, 15.0)
            Text("comment")
            
            
        })
    }
}
