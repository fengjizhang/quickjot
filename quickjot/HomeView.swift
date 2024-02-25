import SwiftUI

struct HomeView: View {
    @State private var enteredText = "TEXT"
    @StateObject private var fetcher = aiParserAPI()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            TextEditor(text: $enteredText)
                .padding()
                .font(.title)
                .foregroundColor(.gray)
            Spacer() 
            HStack {
                Button(action: {
                    showAlert = true
                    Task {
                        do {
                            do {
                                let result = try await fetcher.sendData(textToSend: enteredText)
                                // Now you can use `result` however you need
                            } catch {
                                // Handle any errors
                                print("An error occurred: \(error)")
                            }

                            
                        } catch {
                            print(error)
                        }
                    }
                    
                }) {
                    VStack {
                        Text("+")
                            .frame(maxWidth: 50, maxHeight: 30)
                    }
                }
                .buttonStyle(GrowingButton())
                // Align the button to the right
                .frame(maxWidth: .infinity, alignment: .trailing)
                // Optional: Apply padding here to move the button a bit away from the edge
                .padding(.trailing, 20)
                .alert("Text-entered", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(enteredText)
                }
            }
        }
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    HomeView()
}

