//
//  SwiftUIView.swift
//  khafootTest1
//
//  Created by Shahad Alhothali on 01/05/1446 AH.
//

import SwiftUI

struct SettingsView: View {
    @State private var isNotificationOn = true
    @State private var isSoundAccessOn = false
    
    var body: some View {
            VStack {
                Form {
                    Section(header: Text("Notifications")) {
                        Toggle(isOn: $isNotificationOn) {
                            Text("Activate notifications")
                        }
                        Text("Upon activation, you will receive notifications and everything new")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    Section(header: Text("Sound")) {
                        Toggle(isOn: $isSoundAccessOn) {
                            Text("Access to sound")
                        }
                        Text("When you allow, the sounds around you will be accessible")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    Section(header: Text("Problem")) {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                .foregroundColor(.green)
                            Text("Report problem")
                        }
                        Text("If there is a problem, you can contact us via email to solve it")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Setting", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

