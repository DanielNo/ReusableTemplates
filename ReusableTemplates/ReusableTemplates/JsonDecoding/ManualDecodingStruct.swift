//
//  ManualDecodingStruct.swift
//  ReusableTemplates
//
//  Created by Daniel No on 8/19/21.
//

import Foundation

public struct ManualDecodingStruct : Codable{
    let name : String
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
    }

    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//
//        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        name = try values.decode(String.self, forKey: .name)

    }
    
}
