//
//  Models.swift
//  Docapp
//
//  Created by Ruben on 22.04.26.
//

import Foundation

//MARK: Корень JSON
struct DoctorsResponse: Decodable {
    let record: Record
}

struct Record: Decodable {
    let data: DataContainer
}

struct DataContainer: Decodable {
    let users: [Doctor]
}


//MARK: Врач
struct Doctor: Decodable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let patronymic: String
    let specialization: [Specialization]
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let nearestReceptionTime: TimeInterval?
    let categoryLabel: String
    let educationTypeLabel: EducationType?
    let workExpirience: [WorkExperience]
    let isFavorite: Bool

    enum CodingKeys: String, CodingKey {
        case id, patronymic, specialization, seniority, avatar
        case firstName = "first_name"
        case lastName = "last_name"
        case ratingsRating = "ratings_rating"
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice = "home_price"
        case hospitalPrice = "hospital_price"
        case nearestReceptionTime = "nearest_reception_time"
        case categoryLabel = "category_label"
        case educationTypeLabel = "education_type_label"
        case workExpirience = "work_expirience"
        case isFavorite = "is_favorite"
    }
    
    // MARK: - Образование итд 
    var displaySeniority: String {
        seniority > 0 ? "Опыт работы: \(seniority) лет" : "Опыт не указан"
    }

    var displayCategory: String {
        categoryLabel != "нет" && !categoryLabel.isEmpty
            ? "Врач \(categoryLabel) категории"
            : "Категория не указана"
    }

    var displayEducation: String {
        educationTypeLabel?.name ?? "Образование не указано"
    }

    var displayWorkplace: String {
        workExpirience.first?.organization ?? "Место работы не указано"
    }
    
    //MARK: ФИО
    var fullName: String {
        [lastName, firstName, patronymic]
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    //MARK: Специализация
    var primarySpecialization: String {
        specialization.first?.name ?? "Специализация не указана"
    }
    
    //MARK: Минимальная цена
    var minPrice: Int {
        let prices = [textChatPrice,videoChatPrice,homePrice,hospitalPrice]
        let noZero = prices.filter { $0 > 0 }
        return noZero.min() ?? 0
    }
    
    //MARK: Текст кнопки записаться
    var hasAvailableTime: Bool {
        nearestReceptionTime != nil
    }
}

//MARK: Специализация
struct Specialization: Decodable {
    let id: Int
    let name: String
}

//MARK: Учебное заведение
struct EducationType: Decodable {
    let id: Int
    let name: String
}

//MARK: Место работы
struct WorkExperience: Decodable {
    let organization: String
    let position: String
}
