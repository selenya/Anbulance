//
//  AnnotationModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 15.05.2021.
//

import UIKit
import MapKit

class ShelterAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let number: Int
    init(title: String?,
         coordinate: CLLocationCoordinate2D,
         number: Int) {
        self.title = title
        self.coordinate = coordinate
        self.number = number
    }
}

class AnimalAnnotation: NSObject, MKAnnotation {
    let title: String?
    let imageUrl: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String?,
         coordinate: CLLocationCoordinate2D,imageUrl : String) {
        self.title = title
        self.coordinate = coordinate
        self.imageUrl = imageUrl
    }
}




