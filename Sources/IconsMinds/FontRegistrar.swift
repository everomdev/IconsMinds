//
//  FontRegistrar.swift
//  SimpleLineIcons
//
//  Created by Dairon Ian Garcia Roque on 19/1/26.
//

import Foundation
import CoreText

public enum IconsMindsFont {
    nonisolated(unsafe) private static var didRegister = false

  /// Llama esto una sola vez (por ejemplo en App.init() o al inicio de tu UI).
  public static func register() {
    guard !didRegister else { return }
    didRegister = true

    guard let url = Bundle.module.url(forResource: "Icons-Minds", withExtension: "ttf") else {
      assertionFailure("iconsmainds.ttf no aparece en Bundle.module")
      return
    }

    var error: Unmanaged<CFError>?
    let ok = CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)

    if !ok {
       print("Font register error:", error?.takeRetainedValue() ?? "unknown")
    }
  }
}
