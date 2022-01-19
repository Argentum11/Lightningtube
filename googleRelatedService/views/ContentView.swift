import SwiftUI
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var Text = please()
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
        .environmentObject(Text)
    }
}
