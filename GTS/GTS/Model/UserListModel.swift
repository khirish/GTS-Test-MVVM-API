//
//  UserListModel.swift
//  GTS
//
//  Created by Khirish Meshram on 10/12/22.
//

struct UserResponse: Codable {
    let errorMessage: String?
    let data: UserResponseData?
}

struct UserResponseData: Codable {
    let results: [UserResults]
    let info: Info
}


struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct UserResults: Codable {
    let gender: String
    let name: UserName
    let location: UserLocation
    let email: String
    let login: Login
    let dob: Dob
    let registered: Dob
    let phone: String
    let cell: String
    let id: ID
    let picture: UserPicture
    let nat: String
    
}


struct Dob: Codable {
    let date: String
    let age: Int
}

struct ID: Codable {
    let name: String
    let value: String?
}

struct UserLocation: Codable {
    let street: UserStreet
    let city: String
    let state: String
    let country: String
    let postcode: Postcode
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Coordinates: Codable {
    let latitude: String
    let longitude: String
}

enum Postcode: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}


struct UserStreet: Codable {
    let number: Int
    let name: String
}

struct Timezone: Codable {
    let offset: String
    let timezoneDescription: String

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

struct Login: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}


struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}

struct UserPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
