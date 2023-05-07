//
//  SplashViewUI.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import SwiftUI
import AlertToast

struct SplashViewUI: View {
    @ObservedObject var viewModel: SplashViewModel
    @State var showToast = false
    @State var currentFailure: Failure?
    let controller: SplashViewController
    var body: some View {
        ZStack {
            I.splashBackground.swiftUIImage.resizable().scaledToFill()
            VStack {
                Spacer()
                Spacer()
                Spacer()
                ProgressView()
                Spacer()
            }.padding()
        }
        .ignoresSafeArea()
        .onAppear {
            switch viewModel.status {
            case .initial:
                currentFailure = nil
            case .areaMigration:
                currentFailure = nil
            case .areaMigrationFailed(let failure):
                currentFailure = failure
                showToast = true
            case .areaMigrationSuccess:
                currentFailure = nil
            case .navigateToNextSpage:
                currentFailure = nil
                controller.navigateToNextPage()
            }
        }
        .toast(isPresenting: $showToast) {

            AlertToast(displayMode: .alert, type: .error(.red), title: "Failure", subTitle: currentFailure?.localizedDescription)
        }
    }
}

struct SplashViewUI_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InjectionContainer.shared.container.resolve(SplashViewModel.self)!
        let controller = SplashViewController(viewModel: viewModel)
        SplashViewUI(viewModel: viewModel, controller: controller)
    }
}
