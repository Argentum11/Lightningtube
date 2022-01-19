import SwiftUI
import URLImage
struct searchVideoDetail: View {
    let videoItem:searchVideo
    var body: some View {
        VStack{
            Text(videoItem.snippet.title)
            URLImage(videoItem.snippet.thumbnails.medium.url){image in
                image
                    .resizable()
                    .frame(width: 400, height: 240, alignment: .leading)
            }
            Text(videoItem.snippet.publishedAt,style: .time)
            Link("馬上觀看", destination: URL(string: "https://www.youtube.com/watch?v="+videoItem.id.videoId)!)
            Text(videoItem.snippet.description)
                .padding(.leading, 15.0)
            
            NavigationLink(
                destination: gesture1View(),
                label: {
                    HStack{
                        Image(systemName: "hare")
                    }
            })
        }
    }
}
