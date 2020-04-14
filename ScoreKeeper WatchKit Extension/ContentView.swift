import SwiftUI

struct ContentView: View {
    @State private var homeNumberOfGoals = 0;
    @State private var awayNumberOfGoals = 0;
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
        .updating($isDetectingLongPress) { currentstate, gestureState,
                transaction in
        }
            .onEnded({ finished in
                self.completedLongPress = finished
                self.homeNumberOfGoals = 1337;
                self.awayNumberOfGoals = 69696969;
            })}
    
    var body: some View {
        VStack {
            Button(action: {
//                self.showDetails.toggle()
                self.homeNumberOfGoals+=1;
            }){
                Text(String(self.homeNumberOfGoals))
            }
            .gesture(longPress)

            
            Button(action: {
                self.awayNumberOfGoals+=1;
            }
                )
            {
                Text(String(self.awayNumberOfGoals))
            }
            .gesture(longPress)
            
            
//            if showDetails {
//                Text("MÅÅL")
//            }
            Circle()
            .fill(self.isDetectingLongPress ?
                Color.red :
                    (self.completedLongPress ? Color.green : Color.blue))
            .gesture(longPress)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
