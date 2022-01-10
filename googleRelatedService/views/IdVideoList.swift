import SwiftUI
struct IdVideoList: View {
    @StateObject var videoListViewModel = IdVideoListViewModel()
    @State var searchText = ""
    var body: some View {
        NavigationView {
            VStack{
                Text("請輸入頻道播放清單的Id:")
                SearchBar(searchText: $searchText)
                    .onChange(of: searchText) { newValue in
                        videoListViewModel.fetchItems(playListId: newValue)
                }
                Button {
                    videoListViewModel.fetchItems(playListId: searchText)
                        } label: {
                            Image(systemName: "arrow.clockwise.circle")
                }
                List{
                    ForEach(videoListViewModel.VideoItems){item in
                        NavigationLink(
                            destination: IdVideoDetail(videoItem: item),
                            label: {
                                IdVideoRow(videoItem: item)
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
