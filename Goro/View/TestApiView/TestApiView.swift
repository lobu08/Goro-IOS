import SwiftUI

struct TestApiView: View {
    @StateObject private var getApiVm = GetVM()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddDataView()) {
                    Text("Add Data")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                VStack {
                    if getApiVm.isShowIndicator {
                        ProgressView("Loading...")
                    } else {
                        List(getApiVm.eventApi) { event in
                            NavigationLink(destination: ApiDetailView(event: event)) {
                                ApiRowView(event: event)
                            }
                        }
                    }
                }
                .navigationTitle("Events")
                .onAppear {
                    getApiVm.fetchEventData()
                }
                .alert(isPresented: $getApiVm.isShowAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(getApiVm.error?.localizedDescription ?? "Unknown error"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
        }
    }
}

#Preview {
    TestApiView()
}
