//
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Compound
import SwiftUI

/// An image that is styled for use as the main/top/hero screen icon. This component
/// takes a compound icon. If you would like to apply it to an SFSymbol, you can call
/// the `heroImage()` modifier directly on the Image.
struct HeroImage: View {
    /// The icon that is shown.
    let icon: KeyPath<CompoundIcons, Image>
    
    var body: some View {
        CompoundIcon(icon, size: .custom(42), relativeTo: .title)
            .modifier(HeroImageModifier())
    }
}

extension Image {
    /// Styles the image for use as the main/top/hero screen icon. You should prefer
    /// the HeroImage component when possible, by using an icon from Compound.
    func heroImage(insets: CGFloat = 16) -> some View {
        resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .scaledPadding(insets, relativeTo: .title)
            .modifier(HeroImageModifier())
    }
}

private struct HeroImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.compound.iconPrimary)
            .scaledFrame(size: 70, relativeTo: .title)
            .background {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.compound.bgSubtleSecondary)
            }
            .accessibilityHidden(true)
    }
}

// MARK: - Previews

struct HeroImage_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        HStack(spacing: 20) {
            HeroImage(icon: \.lockSolid)
            Image(systemName: "hourglass")
                .heroImage()
            Image(asset: Asset.Images.serverSelectionIcon)
                .heroImage(insets: 19)
        }
    }
}
