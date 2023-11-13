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

struct TimelineDeliveryStatusView: View {
    enum Status {
        case sending
        case sent
    }

    let deliveryStatus: Status

    private var icon: CompoundIcon {
        switch deliveryStatus {
        case .sending:
            return CompoundIcon(customImage: Asset.Images.circle.swiftUIImage, size: .xSmall, relativeTo: .compound.bodyMD)
        case .sent:
            return CompoundIcon(\.checkCircle, size: .xSmall, relativeTo: .compound.bodyMD)
        }
    }
    
    var body: some View {
        icon
            .foregroundColor(.compound.iconSecondary)
    }
}

struct TimelineDeliveryStatusView_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        VStack {
            TimelineDeliveryStatusView(deliveryStatus: .sending)
            TimelineDeliveryStatusView(deliveryStatus: .sent)
        }
    }
}
