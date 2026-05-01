//
//  PriceView 2.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//


import SwiftUI

struct PriceView: View {
    let doctor: Doctor

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                if doctor.videoChatPrice > 0 {
                    priceBlock(title: "Видеоконсультация", label: "30 мин", price: doctor.videoChatPrice)
                }

                if doctor.textChatPrice > 0 {
                    priceBlock(title: "Чат с врачом", label: "30 мин", price: doctor.textChatPrice)
                }

                if doctor.hospitalPrice > 0 {
                    priceBlock(title: "Приём в клинике", label: "В клинике", price: doctor.hospitalPrice)
                }

                if doctor.homePrice > 0 {
                    priceBlock(title: "Вызов на дом", label: "На дому", price: doctor.homePrice)
                }

                if doctor.minPrice == 0 {
                    Text("Услуги бесплатны")
                        .font(.system(size: 16))
                        .foregroundColor(Color.appDarkGray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                }
            }
            .padding(.vertical, 16)
        }
        .background(Color.appBackground)
        .navigationTitle("Стоимость услуг")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func priceBlock(title: String, label: String, price: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.appBlack)
                .padding(.horizontal)

            HStack {
                Text(label)
                    .font(.system(size: 16))
                    .foregroundColor(Color.appBlack)
                Spacer()
                Text("\(price) ₽")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.appBlack)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}
