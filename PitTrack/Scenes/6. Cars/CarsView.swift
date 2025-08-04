//
//  CarsView.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 03.08.25.
//

import SwiftUI
import SwiftData

struct CarsView: View {
    @Query(sort: [SortDescriptor(\Car.name)]) private var cars: [Car]

    var body: some View {
        NavigationStack {
            List {
                ForEach(cars) { car in
                    HStack {
                        Image(uiImage: car.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing, 10)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(car.name)
                                .font(.headline)
                            Text("Госномер: \(car.plateNumber)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Мои машины")
        }
    }
}

#Preview {
    do {
        let container = try ModelContainer(
            for: Car.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )

        let car1 = Car(name: "BMW", year: 2020, vin: "WBAXXXX", plateNumber: "123ABC")
        let car2 = Car(name: "Audi", year: 2022, vin: "WAUXXXX", plateNumber: "456DEF")

        container.mainContext.insert(car1)
        container.mainContext.insert(car2)

        return CarsView()
            .modelContainer(container)
    } catch {
        return Text("Ошибка создания preview: \(error.localizedDescription)")
    }
}
