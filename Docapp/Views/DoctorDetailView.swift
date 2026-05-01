//
//  DoctorDetailView.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import SwiftUI

struct DoctorDetailView: View {
    let doctor: Doctor

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            VStack(alignment: .leading, spacing: 20) {

                HStack(spacing: 16) {
                    AvatarView(url: doctor.avatar, size: 50)
                    Text(doctor.fullName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.appBlack)
                    Spacer()
                }

                VStack(alignment: .leading, spacing: 20) {
                    InfoRow(icon: "timeout",       text: doctor.displaySeniority)
                    InfoRow(icon: "first-aid-kit", text: doctor.displayCategory)
                    InfoRow(icon: "graduation",    text: doctor.displayEducation)
                    InfoRow(icon: "position",      text: doctor.displayWorkplace)
                }

                NavigationLink(destination: PriceView(doctor: doctor)) {
                    HStack {
                        Text("Стоимость услуг")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.appBlack)
                        Spacer()
                        Text(doctor.minPrice > 0 ? "от \(doctor.minPrice) ₽" : "Бесплатно")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.appBlack)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.appGrey, lineWidth: 1)
                    }
                }
                .buttonStyle(.plain)


                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    .font(.system(size: 14))
                    .foregroundColor(Color.appBlack)
                    .lineSpacing(6)
            }
            .padding()

            Spacer()


            Button { } label: {
                Text(doctor.hasAvailableTime ? "Записаться" : "Нет свободного расписания")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(doctor.hasAvailableTime ? .white : Color.appBlack)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(doctor.hasAvailableTime ? Color.appPink : Color.primaryButtonGray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .disabled(!doctor.hasAvailableTime)
            .padding(.horizontal)
            .padding(.bottom, 100)
        }
        .background(Color.appBackground)
        .navigationTitle(doctor.primarySpecialization)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct InfoRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.appDarkGray)
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(Color.appDarkGray)
        }
    }
}
