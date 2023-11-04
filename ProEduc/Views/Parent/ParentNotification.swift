import SwiftUI

struct ParentNotification: View {
    
    @State private var isWritingMessageViewPresented = false
    @State private var selectedNotification: Notification?
    @State private var isShowingNotificationDetails = false
    
    var messages: [Notification] = [
        Notification(title: "Nouveau message", text: "Vous avez reçu un nouveau message."),
        Notification(title: "Réunion", text: "N'oubliez pas la réunion demain à 18H."),
        Notification(title: "Voyage scolaire", text: "Voyage scolaire en Italie du 8/11 au 15/11"),
        Notification(title: "Absence professeur", text: "Mme Anglais sera absente du 9/11 au 10/11")
    ]
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(.blueParent))
                            .frame(width: 350, height: 120)
                        
                        Text("Mes notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        ForEach(messages.indices, id: \.self) { index in
                            NotificationBubble(notification: messages[index])
                                .onTapGesture {
                                    selectedNotification = messages[index]
                                    isShowingNotificationDetails = true
                                }
                        }
                    }
                    .padding(50)
                }
            }
            .alert(isPresented: $isShowingNotificationDetails) {
                Alert(
                    title: Text(selectedNotification?.title ?? ""),
                    message: Text(selectedNotification?.text ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    struct NotificationBubble: View {
        var notification: Notification
        
        var body: some View {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.blueParent))
                .overlay(
                    VStack(alignment: .leading) {
                        Text(notification.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(notification.text)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                                )
                )
        }
        
        struct ParentNotification_Previews: PreviewProvider {
            static var previews: some View {
                ParentNotification()
            }
        }
    }
    
    struct Notification {
        var title: String
        var text: String
    }
    
}
