//
//  Drivers+Root.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-21.
//

import SwiftUI

extension Standing.View {
    struct Root: View {
        @ObservedObject var viewModel: Standing.View.ViewModel
        let viewFactory: ViewFactory.Factory

        var body: some View {
            NavigationView {
                makeView(basedOn: viewModel.state)
                    .task {
                        await viewModel.fetchDriver()
                    }
                    .navigationTitle("Drivers")
            }
        }

        @ViewBuilder func makeView(basedOn state: Standing.View.ViewModel.ViewState) -> some View {
            switch state {
                case .loading:
                    loadingView()
                case let .loaded(drivers):
                    loadedView(standing: drivers)
                case .error:
                    loadingView()
            }
        }

        func loadingView() -> some View {
            ProgressView()
                .padding()
        }

        func loadedView(standing: [Models.DriverStandings]) -> some View {
            ScrollView {
                ForEach(standing, id: \.self) { standing in
                    ConstructorStandingCard(standing: standing)
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "0E0F0F"))
        }
    }
}

struct StandingRootView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory.Factory(
        assembly: ViewFactory.Assembly.ForPreview()
    )

    static var previews: some View {
        viewFactory.makeView(id: .standing)
    }
}

struct ConstructorStandingCard: View {
    let standing: Models.DriverStandings

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text(standing.points)
                        .font(.title)
                        .bold()
                        .italic()
                        .foregroundColor(Color(hex: "C7C9CB"))
                    Text("pts.")
                        .bold()
                        .italic()
                        .font(.caption)
                        .foregroundColor(Color(hex: "C7C9CB"))
                }
            }

            HStack(spacing: 15) {
                Text(standing.positionText)
                    .font(.title)
                    .italic()
                    .bold()
                    .foregroundColor(Color(hex: "343D42"))
                    .minimumScaleFactor(0.01)
                    .frame(width: 40)

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: "373E45"), Color(hex: "373E45").opacity(0.1)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 50, height: 50, alignment: .center)

                VStack(alignment: .leading, spacing: 5) {
                    Text("\(standing.driver.givenName) \(standing.driver.familyName)")
                        .font(.body)
                        .bold()
                        .lineLimit(1)

                    Text(standing.constructors.name)
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(standing.constructors.color)
                        .cornerRadius(12)
                }
                Spacer()
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(12)
    }
}
