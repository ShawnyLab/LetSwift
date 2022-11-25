//
//  PeerListView.swift
//  LetSwift
//
//  Created by Noah on 2022/11/26.
//

import SwiftUI

struct PeerListView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: PeerListViewModel
    
    init(viewModel: PeerListViewModel) {
        self.viewModel = viewModel
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            List {
                if self.viewModel.isNearbySessionEstablished {
                    Section {
                        VStack(spacing: 20) {
                            HStack {
                                Image(systemName: "person.circle")
                                Text("\(self.viewModel.peerName) 님과의 거리")
                                    .fontWeight(.bold)
                                Spacer()
                                Button {
                                    self.viewModel.disconnectToPeerDevice()
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                }
                            }
                            HStack {
                                Text(
                                    "\(self.viewModel.distanceToPeerDevice)"
                                )
                                .font(.title)
                                .fontWeight(.bold)
                                Text("m")
                                Spacer()
                            }
                        }
                    }
                }
            }
            .background(Color.backgroundBlack)
            .listStyle(InsetGroupedListStyle())
        }
        .navigationTitle("동료 찾기")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct PeerListView_Previews: PreviewProvider {
    static var previews: some View {
        PeerListView(
            viewModel: PeerListViewModel(
                peerConnectionController: PeerConnectionController()
            )
        )
    }
}
