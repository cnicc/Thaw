//
//  MenuOpenMonitorStripTests.swift
//  Project: Thaw
//
//  Copyright (Thaw) © 2026 Toni Förster
//  Licensed under the GNU GPLv3

import CoreGraphics
@testable import MenuBarModel
import Testing

@Suite("Menu open monitor strip height")
struct MenuOpenMonitorStripTests {
    @Test("A bar that reserves room keeps that height", arguments: [24.0, 30.0, 38.0] as [CGFloat])
    func reservedHeight(reserved: CGFloat) {
        let height = MenuOpenMonitor.menuBarStripHeight(reserved: reserved, safeAreaTop: 0, statusBarThickness: 22, hasMenuBar: true)
        #expect(height == reserved)
    }

    @Test("An auto-hidden bar covers the status bar thickness plus the slack")
    func autoHiddenBar() {
        let height = MenuOpenMonitor.menuBarStripHeight(reserved: 0, safeAreaTop: 0, statusBarThickness: 22, hasMenuBar: true)
        #expect(height == 30)
    }

    @Test("An auto-hidden bar under a notch covers the notch plus the slack")
    func autoHiddenBarUnderNotch() {
        let height = MenuOpenMonitor.menuBarStripHeight(reserved: 0, safeAreaTop: 38, statusBarThickness: 22, hasMenuBar: true)
        #expect(height == 46)
    }

    @Test("A screen without a menu bar has no strip")
    func screenWithoutBar() {
        let height = MenuOpenMonitor.menuBarStripHeight(reserved: 0, safeAreaTop: 0, statusBarThickness: 22, hasMenuBar: false)
        #expect(height == nil)
    }
}
