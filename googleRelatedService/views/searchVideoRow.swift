import SwiftUI
import URLImage
struct searchVideoRow: View {
    let videoItem:searchVideo
    var body: some View {
        HStack {
            URLImage(videoItem.snippet.thumbnails.medium.url){image in
                image
                    .resizable()
                    .frame(width: 200, height: 120, alignment: .leading)
            }
            VStack {
                Text(videoItem.snippet.title)
                    .padding(10.0)
                
            }
            
        }
        
    }
}
