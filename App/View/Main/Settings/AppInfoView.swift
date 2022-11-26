//
//  AppInfoView.swift
//  LetSwift
//
//  Created by BumMo Koo on 2019/11/05.
//  Copyright © 2019 Cleanios. All rights reserved.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct AppInfoView: View {
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
//            Image(uiImage: UIImage(named: "AppIcon_2019_Let_Dark60x60")!)
//                .resizable()
//                .frame(width: 32, height: 32)
//                .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
            #if os(iOS)
            VStack(spacing: 2) {
                Text(UIApplication.shared.applicationName)
                    .fontWeight(.bold)
                Text(UIApplication.shared.versionString)
                    .fontWeight(.semibold)
            }
            .font(.system(size: 10))
            #else
            VStack(spacing: 2) {
                Text(NSApplication.shared.applicationName)
                    .fontWeight(.bold)
                Text(NSApplication.shared.versionString)
                    .fontWeight(.semibold)
            }
            .font(.system(size: 10))
            #endif
            Text("Made with 💖")
                .font(.system(size: 12))
                .fontWeight(.bold)
        }
        .foregroundColor(.secondary)
    }
}

// MARK: - Preview
struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
            .previewAsComponent()
    }
}
