//
//  EventKieWrapper.swift
//  StayFit_Workout_ios
//
//  Created by Ridmi on 2023-05-18.
//


import UIKit
import CalendarKit
import EventKit

final class EventKitWrapper: EventDescriptor {
    public var dateInterval: DateInterval {
        get {
            DateInterval(start: ekEvent.startDate, end: ekEvent.endDate)
        }
        
        set {
            ekEvent.startDate = newValue.start
            ekEvent.endDate = newValue.end
        }
    }
    
    public var isAllDay: Bool {
        get {
            ekEvent.isAllDay
        }
        set {
            ekEvent.isAllDay = newValue
        }
    }
    
    public var text: String {
        get {
            ekEvent.title
        }
        
        set {
            ekEvent.title = newValue
        }
    }

    public var attributedText: NSAttributedString?
    public var lineBreakMode: NSLineBreakMode?
    
    public var color: UIColor {
        get {
            UIColor(cgColor: ekEvent.calendar.cgColor)
        }
    }
    
    public var backgroundColor = UIColor()
    public var textColor = SystemColors.label
    public var font = UIFont.boldSystemFont(ofSize: 12)
    public weak var editedEvent: EventDescriptor? {
        didSet {
            updateColors()
        }
    }
    
    public private(set) var ekEvent: EKEvent
    
    public init(eventKitEvent: EKEvent) {
        self.ekEvent = eventKitEvent
        applyStandardColors()
    }
    
    public func makeEditable() -> Self {
        let cloned = Self(eventKitEvent: ekEvent)
        cloned.editedEvent = self
        return cloned
    }
    
    public func commitEditing() {
        guard let edited = editedEvent else {return}
        edited.dateInterval = dateInterval
    }
    
    private func updateColors() {
      (editedEvent != nil) ? applyEditingColors() : applyStandardColors()
    }
    
    
    private func applyStandardColors() {
      backgroundColor = dynamicStandardBackgroundColor()
      textColor = dynamicStandardTextColor()
    }
    
    
    private func applyEditingColors() {
      backgroundColor = color.withAlphaComponent(0.95)
      textColor = .white
    }
    
   
    private func dynamicStandardBackgroundColor() -> UIColor {
      let light = backgroundColorForLightTheme(baseColor: color)
      let dark = backgroundColorForDarkTheme(baseColor: color)
      return dynamicColor(light: light, dark: dark)
    }
    
   
    private func dynamicStandardTextColor() -> UIColor {
      let light = textColorForLightTheme(baseColor: color)
      return dynamicColor(light: light, dark: color)
    }
    
    private func textColorForLightTheme(baseColor: UIColor) -> UIColor {
      var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
      baseColor.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
      return UIColor(hue: h, saturation: s, brightness: b * 0.4, alpha: a)
    }
    
    private func backgroundColorForLightTheme(baseColor: UIColor) -> UIColor {
      baseColor.withAlphaComponent(0.3)
    }
    
    private func backgroundColorForDarkTheme(baseColor: UIColor) -> UIColor {
      var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
      color.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
      return UIColor(hue: h, saturation: s, brightness: b * 0.4, alpha: a * 0.8)
    }
    
    private func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { traitCollection in
          let interfaceStyle = traitCollection.userInterfaceStyle
          switch interfaceStyle {
          case .dark:
            return dark
          default:
            return light
          }
        }
      } else {
        return light
      }
    }
}
