import SwiftUI

struct MySheetView: View {
    // Approach #1
    //@Binding var isPresented: Bool

    // Approach #2
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                Text("This is my modal content.")
                Button("Close") {
                    //isPresented = false // Approach #1
                    dismiss() // Approach #2
                }.buttonStyle(.bordered)
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView: View {
    @State private var isSheetPresented = false

    var body: some View {
        VStack {
            Text("This is my main view.")
            Button("Show Sheet") { isSheetPresented = true }
                .buttonStyle(.bordered)
                .sheet(isPresented: $isSheetPresented) {
                    // Only need to pass this argument in approach #1.
                    //MySheetView(isPresented: $isSheetPresented)
                    MySheetView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
