//
//  DoctorCardView.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

struct DoctorCardView: View {
    let doctor: Doctor
    @State private var heartIsFilled: Bool = false

    var body: some View {
        NavigationLink(destination: DoctorDetailView(doctor: doctor)) {
            VStack(alignment: .leading, spacing: 0) {

                HStack(alignment: .top, spacing: 16) {
                    AvatarView(url: doctor.avatar, size: 50)

                    Text(doctor.fullName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.appBlack)

                    Spacer()
                }

                VStack(alignment: .leading, spacing: 8) {
                    RatingView(rating: doctor.ratingsRating)

                    Text("\(doctor.primarySpecialization) • стаж \(doctor.seniority) лет")
                        .font(.system(size: 13))
                        .foregroundColor(Color.appDarkGray)

                    Text(doctor.minPrice > 0 ? "от \(doctor.minPrice) ₽" : "Бесплатно")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.appBlack)
                }
                .padding(.leading, 66)
                .padding(.bottom, 15)

                Button { } label: {
                    Text(doctor.hasAvailableTime ? "Записаться" : "Нет свободного расписания")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(doctor.hasAvailableTime ? Color.appPink : Color.appGrey)
                        .foregroundColor(doctor.hasAvailableTime ? .white : Color.appDarkGray)
                        .cornerRadius(12)
                }
                .disabled(!doctor.hasAvailableTime)
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.appGrey, lineWidth: 1)
            )
            .overlay(alignment: .topTrailing) {
                Button {
                    heartIsFilled.toggle()
                } label: {
                    Image("like")
                        .foregroundStyle(heartIsFilled ? Color.appPink : Color.appSilver)
                        .padding(12)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
