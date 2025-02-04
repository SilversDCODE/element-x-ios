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

import Foundation

enum SecureBackupRecoveryKeyScreenViewModelAction {
    case done(mode: SecureBackupRecoveryKeyScreenViewMode)
    case cancel
}

enum SecureBackupRecoveryKeyScreenViewMode {
    case setupRecovery
    case changeRecovery
    case fixRecovery
}

struct SecureBackupRecoveryKeyScreenViewState: BindableState {
    let mode: SecureBackupRecoveryKeyScreenViewMode
    
    var recoveryKey: String?
    var doneButtonEnabled = false
    
    var bindings: SecureBackupRecoveryKeyScreenViewBindings
    
    var title: String {
        switch mode {
        case .setupRecovery:
            return recoveryKey == nil ? L10n.screenRecoveryKeySetupTitle : L10n.screenRecoveryKeySaveTitle
        case .changeRecovery:
            return recoveryKey == nil ? L10n.screenRecoveryKeyChangeTitle : L10n.screenRecoveryKeySaveTitle
        case .fixRecovery:
            return L10n.screenRecoveryKeyConfirmTitle
        }
    }
    
    var subtitle: String {
        switch mode {
        case .setupRecovery:
            return recoveryKey == nil ? L10n.screenRecoveryKeySetupDescription : L10n.screenRecoveryKeySaveDescription
        case .changeRecovery:
            return recoveryKey == nil ? L10n.screenRecoveryKeyChangeDescription : L10n.screenRecoveryKeySaveDescription
        case .fixRecovery:
            return L10n.screenRecoveryKeyConfirmDescription
        }
    }
    
    var recoveryKeySubtitle: String {
        switch mode {
        case .setupRecovery:
            return recoveryKey == nil ? L10n.screenRecoveryKeySetupGenerateKeyDescription : L10n.screenRecoveryKeySaveKeyDescription
        case .changeRecovery:
            return recoveryKey == nil ? L10n.screenRecoveryKeyChangeGenerateKeyDescription : L10n.screenRecoveryKeySaveKeyDescription
        case .fixRecovery:
            return L10n.screenRecoveryKeyConfirmKeyDescription
        }
    }
}

struct SecureBackupRecoveryKeyScreenViewBindings {
    var confirmationRecoveryKey = ""
    var alertInfo: AlertInfo<UUID>?
}

enum SecureBackupRecoveryKeyScreenViewAction {
    case generateKey
    case copyKey
    case keySaved
    case confirmKey
    case done
    case cancel
}
