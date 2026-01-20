// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct IconsMindsView: View {
    private let icon: IconsMinds?
    private let size: CGFloat
    private let fontName: String
    
    public init(_ icon: IconsMinds, size: CGFloat = 20, fontName: String = "Icons-Minds") {
        self.icon = icon
        self.size = size
        self.fontName = fontName
    }
    
    public init(_ icon: String, size: CGFloat = 20, fontName: String = "Icons-Minds") {
        if let iconEnum = IconsMinds(name: icon) {
            self.icon = iconEnum
        }else{
            self.icon = nil
        }
        self.size = size
        self.fontName = fontName
    }
    
    public var body: some View {
        if let icon = icon {
            Text(icon.unicodeScalar)
                .font(.custom(fontName, size: size))
        }
    }
}
