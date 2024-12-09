//
//  Views.swift
//  Ecommerce
//
//  Created by Nejat Boy on 28.07.2024.
//

import UIKit
import MapKit


// MARK: Label
class Label: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
}



// MARK: Button
class Button: UIButton {
    
    var action: Handler?
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(clicked), for: .touchUpInside)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.5 : 1
        }
    }
    
    
    func configure() { }
    
    
    @objc private func clicked() {
        action?()
    }
}



// MARK: TextField
class TextField: UITextField {
    
    var padding: UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}



//MARK: View
class View: UIView {
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
}



//MARK: UserInteractionView
class UserInteractionView: View {
    
    private let background = View()
    
    
    override func configure() {
        background.backgroundColor = .black
        background.alpha = 0.5
        
        addSubview(background)
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    func setup(window: UIWindow) {
        alpha = 0
        window.addSubview(self)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: window.leadingAnchor),
            trailingAnchor.constraint(equalTo: window.trailingAnchor),
            bottomAnchor.constraint(equalTo: window.bottomAnchor),
            topAnchor.constraint(equalTo: window.topAnchor),
        ])
    }
    
    
    func show() {
        superview?.bringSubviewToFront(self)
        UIView.animate(withDuration: 0.3, animations: animate, completion: afterShow)
        
        func animate() {
            alpha = 1
        }
    }
    
    
    @objc func hide() {
        guard alpha == 1 else { return }
        
        UIView.animate(withDuration: 0.3, animations: animate, completion: afterHide)
        
        func animate() {
            alpha = 0
        }
    }
    
    
    func afterShow(_: Bool) {
        
    }
    
    
    func afterHide(_: Bool) {
        
    }
    
    
    var isCancelable: Bool {
        get {
            background.isUserInteractionEnabled
        }
        
        set {
            background.isUserInteractionEnabled = newValue
            
            background.gestureRecognizers = [
                UITapGestureRecognizer(target: self, action: #selector(hide))
            ]
        }
    }
}



//MARK: ImageView
class ImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
    
    
    func set(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: cornerRadius * 2),
            heightAnchor.constraint(equalToConstant: cornerRadius * 2)
        ])
    }
}



//MARK: StackView
class StackView: UIStackView {
    
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
}



//MARK: MapView
class MapView: MKMapView, MKMapViewDelegate {
    
    ///Uzun tıklama ile seçilen coordinate buraya set edilir
    var selectedCoordinate: Coordinate?
    
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
        showsUserLocation = true
        
        configure()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tapGesture)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() { }
    
    
    @objc private func tapped(gestureRecognizer: UILongPressGestureRecognizer) {
        removeAnnotations(annotations)
        
        let touchPoint = gestureRecognizer.location(in: self)
        let coordinate = convert(touchPoint, toCoordinateFrom: self)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Selected Location"
        
        addAnnotation(annotation)
        
        selectedCoordinate = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    
    ///Coordinate'i haritaya region etmek için kullanırız
    /// - Parameters:
    ///   - coordinate: Koordinat'lar
    ///   - meters: Kuşbakışı uzaklık
    ///   - animated: Animasyon olsun mu olmasın mı
    func setRegion(coordinate: Coordinate, meters: CLLocationDistance, animated: Bool) {
      /*  let clLocationCoordinate = CLLocationCoordinate2D(latitude: coordinate.latitude ?? 0, longitude: coordinate.latitude ?? 0)
        let region = MKCoordinateRegion(center: clLocationCoordinate, latitudinalMeters: meters, longitudinalMeters: meters)
        
        setRegion(region, animated: animated) */
        
        let latDelta: CLLocationDegrees = 0.001
        let longDelta: CLLocationDegrees = 0.001
        
        let theSpan2: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let pointLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(coordinate.latitude ?? 0, coordinate.longitude ?? 0)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: pointLocation, span: theSpan2)
        setRegion(region, animated: true)
    }
}
