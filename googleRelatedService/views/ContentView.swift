import SwiftUI
struct ContentView: View {
    var body: some View{
        TabView {
            searchVideoList()
                .tabItem {
                    Label("搜尋影片", systemImage: "magnifyingglass.circle.fill")
                }
            IdVideoList()
                .tabItem {
                    Label("清單Id", systemImage: "mail.and.text.magnifyingglass")
                }
        }
        //IdVideoList()
        //searchVideoList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
