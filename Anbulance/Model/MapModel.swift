//
//  MapModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import UIKit
import SwiftUI
import MapKit
import FirebaseFirestore

extension MapModel {
    
    public func onAnnotationTapped(perform action: @escaping ((MKAnnotation?) -> Void)) -> MapModel {
        var new = self
        new.onAnnotationTappedCallback = action
        return new
    }
    
}


struct MapModel: UIViewRepresentable {
    
    var onAnnotationTappedCallback: ((MKAnnotation?) -> Void)?
    let map = MKMapView()
    private var db = Firestore.firestore()
    
    func makeUIView(context: Context) -> UIView {
        return map
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        map.addAnnotation(yedikuleShelter)
        map.addAnnotation(kadikoy1)
        map.addAnnotation(uskudar1)
        map.addAnnotation(kadikoy2)
        map.addAnnotation(bahcelievler1)
        
        
        func fetchData() {
            db.collection("posts").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                let posts = documents.map { (queryDocumentSnapshot) -> MKAnnotation in
                    let data = queryDocumentSnapshot.data()
                    
                    print(data.debugDescription)
                    
                    let postID = data["postID"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let imageUrl = data["imageUrl"] as? String ??
                        "https://via.placeholder.com/468x300?text=No%20image"
                    
                    let latitude = data["latitude"] as? Double ?? 0
                    let longitude = data["longitude"] as? Double ?? 0
                    
                    let animalAnnotations = AnimalAnnotation(postID: postID,
                                                             title: description,
                                                             coordinate: CLLocationCoordinate2D(latitude: latitude,
                                                                                                longitude: longitude),
                                                             imageUrl: imageUrl)
                    
                    return animalAnnotations
                    
                }
                map.addAnnotations(posts)
            }
        }
        
        fetchData()
    }
    
    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }
   
    func openMapForPlace(coordinates: CLLocationCoordinate2D) {
        let regionDistance: CLLocationDistance = 10000000
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        
        MKMapItem.openMaps(with: [mapItem], launchOptions: options)
    }
    
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapModelController: MapModel
    
    init(_ control: MapModel) {
        self.mapModelController = control
    }
    
    //EDIT THE ANNOTATION VIEWS HERE:
    func mapView(_ mapView: MKMapView, viewFor
                    annotation: MKAnnotation) -> MKAnnotationView?{
        var annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        
        //CUSTOM IMAGE ICON
        
        switch annotation {
        case is ShelterAnnotation:
            annotationView.image = #imageLiteral(resourceName: "AnbulancePin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
        case is AnimalAnnotation:
            annotationView.image = #imageLiteral(resourceName: "AnbulanceRedPin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
        case is MKUserLocation:
            annotationView = MKUserLocationView.init()
        default:
            annotationView.image = #imageLiteral(resourceName: "AnbulancePin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
        }
        
        return annotationView
    }
        
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let btn = UIButton(type: .detailDisclosure)
        view.canShowCallout = true
        view.rightCalloutAccessoryView = btn
        
    }
    
    //Display alert once annotation is tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let annotation = view.annotation;
        self.mapModelController.onAnnotationTappedCallback?(annotation)
        
        print("annotation is tapped - \(String(describing: annotation))")
        
        //IF STATEMENT FOR WHAT KIND OF ACTIONSHEET/SCREEN IS GOIN TO BE DISPLAYED
    }
    
    
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
                    mapView.setRegion(region, animated: true)
                    
                    
                }
            }
        }
    }
    
}
