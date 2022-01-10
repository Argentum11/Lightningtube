import SwiftUI
struct SearchBar: UIViewRepresentable {
    @Binding var searchText: String
    func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar()
    let searchAction = UIAction { action in
    guard let textField = action.sender as? UITextField else { return }
    searchText = textField.text!
    }
    searchBar.searchTextField.addAction(searchAction, for: .editingChanged)
    let closeAction = UIAction { action in
    guard let textField = action.sender as? UITextField else { return }
    textField.endEditing(true)
    }
    searchBar.searchTextField.addAction(closeAction, for: .editingDidEndOnExit)
    return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    typealias UIViewType = UISearchBar
}
