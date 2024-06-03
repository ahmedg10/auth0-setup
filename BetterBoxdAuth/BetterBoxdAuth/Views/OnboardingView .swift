//import SwiftUI
//
//struct OnboardingView: View {
//    @Binding var profile: Profile
//    @State private var step: OnboardingStep = .username
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                GeometryReader { geometry in
//                    HStack(spacing: 0) {
//                        UsernameInputView(profile: $profile, nextStep: $step)
//                            .frame(width: geometry.size.width)
//                        
//                        BioInputView(profile: $profile, nextStep: $step)
//                            .frame(width: geometry.size.width)
//                        
//                        ProfileView(profile: profile)
//                            .frame(width: geometry.size.width)
//                    }
//                    .frame(width: geometry.size.width * 3, alignment: .leading)
//                    .offset(x: -CGFloat(step.rawValue) * geometry.size.width)
//                    .animation(.easeInOut, value: step)
//                }
//            }
//            .background(Color.customBackground)
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct UsernameInputView: View {
//    @Binding var profile: Profile
//    @Binding var nextStep: OnboardingStep
//
//    var body: some View {
//        VStack {
//            Text("Enter your username")
//                .modifier(TitleStyle())
//                .foregroundColor(.text)
//            
//            TextField("Username", text: $profile.username)
//                .textFieldStyle(CustomTextFieldStyle())
//                .padding()
//            
//            Button("Next") {
//                withAnimation {
//                    nextStep = .bio
//                }
//            }
//            .buttonStyle(CustomButtonStyle())
//            .padding() // Add padding to ensure it is visible
//        }
//        .padding()
//        .background(Color.customBackground)
//        .cornerRadius(10)
//        .foregroundColor(.text)
//    }
//}
//
//struct BioInputView: View {
//    @Binding var profile: Profile
//    @Binding var nextStep: OnboardingStep
//    @State private var errorMessage: String?
//
//    var body: some View {
//        VStack {
//            Text("Enter your bio")
//                .modifier(TitleStyle())
//                .foregroundColor(.text)
//            
//            TextField("Bio", text: $profile.bio)
//                .textFieldStyle(CustomTextFieldStyle())
//                .padding()
//            
//            Toggle(isOn: $profile.isPrivate) {
//                Text("Private Profile")
//                    .foregroundColor(.text)
//            }
//            .padding()
//            
//            Button("Finish") {
//                withAnimation {
//                    nextStep = .complete // Transition to profile view or main app
//                }
//            }
//            .buttonStyle(CustomButtonStyle())
//            .padding() // Add padding to ensure it is visible
//            
//            if let errorMessage = errorMessage {
//                Text(errorMessage)
//                    .foregroundColor(.red)
//                    .padding()
//            }
//        }
//        .padding()
//        .background(Color.customBackground)
//        .cornerRadius(10)
//        .foregroundColor(.text)
//    }
//}
//
//struct OnboardingView_Previews: PreviewProvider {
//    @State static var profile = Profile.empty
//
//    static var previews: some View {
//        OnboardingView(profile: $profile)
//    }
//}
