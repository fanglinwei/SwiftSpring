//
//  SpringDemoView.swift
//  SwiftSpring-SwiftUI-Demo
//
//  Created by 方林威 on 2026/5/29.
//

import SwiftSpring
import SwiftUI

private typealias SpringAnimation = SwiftSpring.Animation

struct SpringDemoView: View {
    private let animations = SpringAnimation.Preset.demoCases
    private let curves = SpringAnimation.Curve.demoCases

    @State private var animationIndex = 0
    @State private var curveIndex = 0
    @State private var force: Double = 1
    @State private var duration: Double = 0.7
    @State private var delay: Double = 0
    @State private var damping: Double = 0.7
    @State private var velocity: Double = 0.7
    @State private var scale: Double = 1
    @State private var x: Double = 0
    @State private var y: Double = 0
    @State private var rotate: Double = 0
    @State private var isCircle = false
    @State private var showOptions = false
    @State private var showCode = false
    @State private var isColorHighlighted = false
    @State private var trigger = 0

    private var configuration: SpringConfiguration {
        SpringConfiguration(
            animation: animation,
            curve: curve,
            force: CGFloat(force),
            delay: delay,
            duration: duration,
            damping: CGFloat(damping),
            velocity: CGFloat(velocity),
            x: CGFloat(x),
            y: CGFloat(y),
            scaleX: CGFloat(scale),
            scaleY: CGFloat(scale),
            rotate: CGFloat(rotate)
        )
    }

    private var animation: SpringAnimation.Preset {
        animations[animationIndex]
    }

    private var curve: SpringAnimation.Curve {
        curves[curveIndex]
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                previewArea
                controlPanel
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .scaleEffect(showOptions || showCode ? 0.935 : 1)
            .animation(.interpolatingSpring(stiffness: 170, damping: 20), value: showOptions || showCode)

            if showOptions {
                modalBackdrop {
                    dismissModals()
                }
                OptionsPanel(
                    damping: binding(for: $damping),
                    velocity: binding(for: $velocity),
                    scale: binding(for: $scale),
                    x: binding(for: $x),
                    y: binding(for: $y),
                    rotate: binding(for: $rotate),
                    onReset: reset
                )
                .transition(.move(edge: .bottom))
            }

            if showCode {
                modalBackdrop {
                    dismissModals()
                }
                CodePanel(codeText: codeText)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.interpolatingSpring(stiffness: 170, damping: 20), value: showOptions)
        .animation(.interpolatingSpring(stiffness: 170, damping: 20), value: showCode)
    }

    private var previewArea: some View {
        GeometryReader { proxy in
            ZStack {
                Button(action: previewTapped) {
                    Color.clear
                }
                .buttonStyle(PlainButtonStyle())

                RoundedRectangle(cornerRadius: isCircle ? 50 : 10, style: .continuous)
                    .fill(isColorHighlighted ? Color.demoHighlightBlue : Color.demoBlue)
                    .frame(width: 100, height: 100)
                    .spring(animation, trigger: trigger, configuration: configuration)
                    .allowsHitTesting(false)

                VStack {
                    Spacer()
                    HStack {
                        Button("Code") {
                            showCode = true
                        }
                        .buttonStyle(LinkDemoButtonStyle())

                        Spacer()

                        Button(action: toggleShape) {
                            Image(systemName: isCircle ? "roundedcorners" : "circle")
                                .frame(width: 100, height: 44)
                        }
                        .buttonStyle(LinkDemoButtonStyle())

                        Spacer()

                        Button("Options") {
                            showOptions = true
                        }
                        .buttonStyle(LinkDemoButtonStyle())
                    }
                    .padding(.horizontal, 0)
                    .padding(.bottom, 10)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }

    private var controlPanel: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                CompactSlider(title: "Force", value: binding(for: $force), range: 1...5, step: 0.1)
                CompactSlider(title: "Duration", value: binding(for: $duration), range: 0.5...5, step: 0.1)
                CompactSlider(title: "Delay", value: binding(for: $delay), range: 0...5, step: 0.1)
            }
            .padding(.horizontal, 15)

            HStack(spacing: 0) {
                Picker("", selection: binding(for: $animationIndex)) {
                    ForEach(animations.indices, id: \.self) { index in
                        Text(animations[index].value).tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()

                Picker("", selection: binding(for: $curveIndex)) {
                    ForEach(curves.indices, id: \.self) { index in
                        Text(curves[index].value).tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }
            .frame(height: 194)
        }
        .frame(height: 260)
        .background(Color.white)
    }

    private var codeText: String {
        var lines = [
            "ball",
            "\t.spring(.\(animation.value),",
            "\t        trigger: trigger,"
        ]

        var options: [String] = [
            "animation: .\(animation.value)",
            "curve: .\(curve.value)"
        ]

        if force != 1 {
            options.append("force: \(formatted(force))")
        }
        if duration != 0.7 {
            options.append("duration: \(formatted(duration))")
        }
        if delay != 0 {
            options.append("delay: \(formatted(delay))")
        }
        if damping != 0.7 {
            options.append("damping: \(formatted(damping))")
        }
        if velocity != 0.7 {
            options.append("velocity: \(formatted(velocity))")
        }
        if x != 0 || y != 0 {
            options.append("x: \(formatted(x))")
            options.append("y: \(formatted(y))")
        }
        if scale != 1 {
            options.append("scaleX: \(formatted(scale))")
            options.append("scaleY: \(formatted(scale))")
        }
        if rotate != 0 {
            options.append("rotate: \(formatted(rotate))")
        }

        lines.append("\t        configuration: SpringConfiguration(")
        lines.append(options.map { "\t            \($0)" }.joined(separator: ",\n"))
        lines.append("\t        )")
        lines.append("\t)")
        return lines.joined(separator: "\n")
    }

    private func runAnimation() {
        trigger += 1
    }

    private func previewTapped() {
        flashBallColor()
        runAnimation()
    }

    private func toggleShape() {
        withAnimation(.easeInOut(duration: 0.2)) {
            isCircle.toggle()
        }
        flashBallColor()
    }

    private func flashBallColor() {
        withAnimation(.easeInOut(duration: 0.1)) {
            isColorHighlighted = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut(duration: 0.5)) {
                isColorHighlighted = false
            }
        }
    }

    private func reset() {
        animationIndex = 0
        curveIndex = 0
        force = 1
        duration = 0.7
        delay = 0
        damping = 0.7
        velocity = 0.7
        scale = 1
        x = 0
        y = 0
        rotate = 0
        dismissModals()
    }

    private func dismissModals() {
        showOptions = false
        showCode = false
    }

    private func formatted(_ value: Double) -> String {
        String(format: "%.1f", value)
    }

    private func binding<Value>(for value: Binding<Value>) -> Binding<Value> {
        Binding(
            get: { value.wrappedValue },
            set: { newValue in
                value.wrappedValue = newValue
                runAnimation()
            }
        )
    }

    private func modalBackdrop(onTap: @escaping () -> Void) -> some View {
        Color.black.opacity(0.001)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture(perform: onTap)
    }
}

private struct OptionsPanel: View {
    @Binding var damping: Double
    @Binding var velocity: Double
    @Binding var scale: Double
    @Binding var x: Double
    @Binding var y: Double
    @Binding var rotate: Double
    let onReset: () -> Void

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    CompactSlider(title: "Damping", value: $damping, range: 0...1, step: 0.1)
                    CompactSlider(title: "Velocity", value: $velocity, range: 0...1, step: 0.1)
                    CompactSlider(title: "Rotate", value: $rotate, range: 0...5, step: 0.1)
                }
                .padding(.top, 35)

                HStack(spacing: 0) {
                    CompactSlider(title: "X", value: $x, range: 0...300, step: 1)
                    CompactSlider(title: "Y", value: $y, range: 0...300, step: 1)
                    CompactSlider(title: "Scale", value: $scale, range: 1...5, step: 0.1)
                }
                .padding(.top, 35)

                Button("Reset", action: onReset)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.demoGray)
                    .frame(width: 100, height: 36)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.demoGray, lineWidth: 1)
                    )
                    .padding(.top, 29)

                Spacer()
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity)
            .frame(height: 360)
            .background(Color(red: 0.239, green: 0.259, blue: 0.306))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

private struct CodePanel: View {
    let codeText: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 18) {
                Text("Code")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)

                ScrollView {
                    Text(codeText)
                        .font(.system(size: 13, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(20)
            .frame(width: 300)
            .frame(maxHeight: .infinity)
            .background(Color(red: 0.239, green: 0.259, blue: 0.306))

            Spacer()
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

private struct CompactSlider: View {
    let title: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double

    var body: some View {
        VStack(spacing: 6) {
            Slider(value: $value, in: range, step: step)
                .accentColor(Color.demoBlue)
                .frame(width: 86, height: 30)

            Text("\(title): \(displayValue)")
                .font(.system(size: 12, weight: .heavy))
                .foregroundColor(Color.demoGray)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .frame(width: 116)
        }
        .frame(maxWidth: .infinity)
    }

    private var displayValue: String {
        step >= 1 ? String(Int(value)) : String(format: "%.1f", value)
    }
}

private struct LinkDemoButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.demoBlue.opacity(configuration.isPressed ? 0.6 : 1))
            .frame(minWidth: 100, minHeight: 44)
    }
}

private extension Color {
    static let demoBlue = Color(red: 0.153, green: 0.612, blue: 0.922)
    static let demoHighlightBlue = Color(red: 0.412, green: 0.859, blue: 1)
    static let demoGray = Color(red: 0.516, green: 0.548, blue: 0.629)
}
