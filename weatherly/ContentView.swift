//
//  ContentView.swift
//  weatherly
//
//  Created by Nguyễn Minh on 27/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var location: Location?
    @State private var locationInput: String = ""
    @State private var weather: Weather?
    @State private var isLoading: Bool = false
    
    
    func fetch() async {
        isLoading = true
        do {
            location = try await LocationAPIClient.decodeByCityName(city: locationInput)
            weather = try await WeatherAPIClient.decodeByLocation(lat: location?.lat ?? 10.7758439, lon: location?.lon ?? 106.7017555)
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nhập tên địa điểm", text: $locationInput)
                        .onSubmit {
                            Task {
                                await fetch()
                            }
                        }
                }
                Section {
                    if !isLoading {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Địa điểm: \(location?.name ?? "Hồ Chí Minh")")
                                .font(.system(size: 20, weight: .semibold))
                            Text(String(format: "Nhiệt độ: %.1f°C", weather?.temp ?? 0.0))
                        }
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }.navigationTitle("Weatherly")
        }
    }
}

#Preview {
    ContentView()
}
