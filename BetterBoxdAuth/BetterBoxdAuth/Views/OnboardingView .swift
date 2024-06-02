import SwiftUI

struct OnboardingView: View {
    @Binding var profile: Profile
    @State private var step: OnboardingStep = .username
    
    var body: some View {
        NavigationView {
            VStack {
                switch step {
                case .username:
                    UsernameInputView(profile: $profile, nextStep: $step)
                case .bio:
                    BioInputView(profile: $profile, nextStep: $step)
                case .complete:
                    ProfileView(profile: profile)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct UsernameInputView: View {
    @Binding var profile: Profile
    @Binding var nextStep: OnboardingStep

    var body: some View {
        VStack {
            Text("Enter your username")
                .modifier(TitleStyle())
            
            TextField("Username", text: $profile.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Next") {
                nextStep = .bio
            }
            .buttonStyle(MyButtonStyle())
        }
        .navigationBarHidden(true)
    }
}

struct BioInputView: View {
    @Binding var profile: Profile
    @Binding var nextStep: OnboardingStep
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Text("Enter your bio")
                .modifier(TitleStyle())
            
            TextField("Bio", text: $profile.bio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Toggle(isOn: $profile.isPrivate) {
                Text("Private Profile")
            }
            .padding()
            
            Button("Finish") {
                nextStep = .complete // Transition to profile view or main app
            }
            .buttonStyle(MyButtonStyle())
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

enum OnboardingStep {
    case username
    case bio
    case complete
}


struct OnboardingView_Previews: PreviewProvider {
    @State static var profile = Profile.empty

    static var previews: some View {
        OnboardingView(profile: $profile)
    }
}
