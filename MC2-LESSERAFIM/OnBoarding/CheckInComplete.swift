//
//  CheckInComplete.swift
//  MC2-LESSERAFIM
//
//  Created by 손서연 on 2023/05/11.
//

import SwiftUI

struct CheckInComplete: View {
    @EnvironmentObject var userData: UserData
    @State var tappedImageName: String
    @State var isStartButtonEnabled: Bool = false
    @Binding var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            PageTitle(titlePage: "이제부터 당신의 짝꿍은")
            HStack {
                Text(username)
                    .foregroundColor(.blue)
                    .font(.system(size: 32, weight: .bold))
                PageTitle(titlePage: "입니다.")
                Spacer()
            }
            
            Image(tappedImageName)
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .padding(.top, 48)
            //                    .padding(.bottom, 164)
        
            Button("시작하기", action: finishOnboarding)
                .font(.custom("ButtonStyle", size: 18))
                .foregroundColor(.white)
                .frame(width: 345,height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.blue)
                )
        }
    }
}
struct CheckInComplete_Previews: PreviewProvider {
    static var previews: some View {
        CheckInScreen()
            .environmentObject(UserData())
    }
}

fileprivate extension CheckInComplete {
    func finishOnboarding() {
        isStartButtonEnabled = true
        userData.isOnBoarding = false
        userData.userName = username
        userData.selectedImageName = tappedImageName
    }
}
