import SwiftUI
struct searchVideoList: View {
    @StateObject var videoListViewModel = searchVideoListViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack{
                Text("請輸入邀搜尋的影片標題:")
                SearchBar(searchText: $searchText)
                    .onChange(of: searchText) { newValue in
                        videoListViewModel.fetchItems(searchingFor: newValue)
                }
                Button {
                    videoListViewModel.fetchItems(searchingFor: searchText)
                        } label: {
                            Image(systemName: "arrow.clockwise.circle")
                }
                List{
                    ForEach(videoListViewModel.VideoItems,id:\.etag){item in
                        NavigationLink(
                            destination: searchVideoDetail(videoItem: item),
                            label: {
                                searchVideoRow(videoItem: item)
                        })
                    }
                }
                .alert(isPresented: $videoListViewModel.showError, content: {
                            Alert(title: Text("\(videoListViewModel.error!.localizedDescription)"))
                        })
                .overlay(
                    ProgressView()
                        .opacity(videoListViewModel.VideoItems.isEmpty ? 1 : 0)
                )
                
            }
            
        }
        
    }
}
