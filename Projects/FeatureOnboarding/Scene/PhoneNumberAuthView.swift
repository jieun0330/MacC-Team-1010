//
//  PhoneNumberAuthView.swift
//  FeatureOnboarding
//
//  Created by 박지은 on 2023/11/20.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core
import Combine
import Foundation

public struct PhoneNumberAuthView: View {
    
    @State var phoneNumber = ""
    @State var isNavigation = false
    @State var certificationNumber = ""
    @State private var showSecondTextField = false
    @State var timeRemaining: Int = 180
    @State private var isCountdownOver = false
    
    let date = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    public init(phoneNumber: String, isNavigation: Bool = false) {
        self.phoneNumber = phoneNumber
        self.isNavigation = isNavigation
    }
    
    public var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .center) {
                
                Spacer()
                
                headerView()
                
                if showSecondTextField {
                    
                    VStack {
                        ZStack {
                            Image(uiImage: .designSystem(.numBox)!)
                            TextField("000000", text: $certificationNumber)
                                .frame(width: 300)
                                .padding()
                                .textFieldStyle(CertiNumTextFieldStyle())
                                .keyboardType(.numberPad)
                                .onReceive(Just(certificationNumber)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.certificationNumber = filtered
                                    }
                                    if self.certificationNumber.count == 7 {
                                        self.certificationNumber.removeLast()
                                    }
                                }
                            
                        }
                        HStack {
                            Text("인증번호가 발송되었어요!")
                                .SF12B()
                                .foregroundColor(.Primary2)

                            Spacer()
                            
                            Text(converSecondsToTime(timeInSeconds: timeRemaining))
                                .SF14R()
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    } else {
                                        isCountdownOver = true
                                    }
                                }
                            
                            Text("인증번호 재전송")
                                .SF12B()
                                .foregroundColor(.Primary)
                        }
                        .frame(width: 300)
                    }
                }

                TextField("010-1234-5678", text: $phoneNumber)
                    .padding(.top, 24)
                    .textFieldStyle(PhoneNumTextFieldStyle())
                    .keyboardType(.numberPad)
                    .onChange(of: phoneNumber) { _ in
                        var withoutHypen = String(phoneNumber.replacingOccurrences(of: "-", with: "").prefix(11))
                        if withoutHypen.count >= 8  {
                            withoutHypen.insert("-", at: phoneNumber.index(phoneNumber.startIndex, offsetBy: 3))
                            withoutHypen.insert("-", at: phoneNumber.index(phoneNumber.endIndex, offsetBy: -5))
                            phoneNumber = withoutHypen
                        } else {
                            phoneNumber = withoutHypen
                        }
                    }
                
                Spacer()
                
                nextButton()
            }
        }
        .navigationBarItems(trailing: Text("건너뛰기"))
    }
}

extension PhoneNumberAuthView {
    @ViewBuilder
    func headerView() -> some View {
        Text("반가워요!")
        .SF24B()
        
        HStack {
            Text("본인 확인")
                .foregroundColor(.Primary)
                .SF24B()
            Text("을 해주세요")
                .SF24B()
        }
        .padding(.bottom, 24)
    }
}

extension String {
    public func validatePhone(number: String) -> Bool {
        let regex = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$"
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: number)
    }
}

struct PhoneNumTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            Rectangle()
                .cornerRadius(12)
                .frame(width: 300, height: 58)
                .foregroundColor(.DarkBase)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.Lilac, lineWidth: 3)
                )
            
            configuration
                .font(.style(.SF24B))
                .kerning(3)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}


struct CertiNumTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
            
            configuration
                .font(.style(.SF24B))
                .foregroundColor(.White)
                .kerning(28)
                .multilineTextAlignment(.leading)
    }
}

extension PhoneNumberAuthView {
    func converSecondsToTime(timeInSeconds: Int) -> String {
        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds - hours*3600) / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes,seconds)
    }
    
    func calcRemain() {
        let calendar = Calendar.current
        let targetTime: Date = calendar.date(byAdding: .second, value: 3800, to: date, wrappingComponents: false) ?? Date()
        let remainSeconds = Int(targetTime.timeIntervalSince(date))
        self.timeRemaining = remainSeconds
    }
}


extension PhoneNumberAuthView {
    @ViewBuilder
    func nextButton() -> some View {
        Button {
            if phoneNumber.validatePhone(number: phoneNumber) {
                showSecondTextField = true
//                PhoneNumTextFieldStyle.configuration.
            } else {
                showSecondTextField = false
            }
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(uiColor: .designSystem(phoneNumber.isEmpty ? .w10 :.goldenyellow)!))
                .frame(height: 50)
                .overlay {
                    Text("다음")
                        .foregroundColor(.White)
                        .SF17R()
                }
                .padding(.bottom, 16)
        }
        .disabled(phoneNumber.isEmpty || !phoneNumber.validatePhone(number: phoneNumber))
    }
}
