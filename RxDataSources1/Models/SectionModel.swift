import UIKit
import RxDataSources

typealias SettingsSectionModel = SectionModel<SettingsSection, SettingsItem>

enum SettingsSection {
    case account
    case common
    case other //追加
    
    var headerHeight: CGFloat {
        return 40.0
    }
    
    var footerHeight: CGFloat {
        return 1.0
    }
}

enum SettingsItem {
    //account section
    case account
    case security
    case notification
    case contents
    
    //common section
    case sounds
    case dataUsing
    case accessibility
//    other section 追加
    case credits //追加
    case version //追加
    case privacyPolicy //追加
    
    //other
    case description(text: String)
    
    var title: String? {
        switch self {
        case .account:
            return "アカウント"
        case .security:
            return "セキュリティ"
        case .notification:
            return "通知"
        case .contents:
            return "コンテンツ設定"
        case .sounds:
            return "サウンド設定"
        case .dataUsing:
            return "データ利用時の設定"
        case .accessibility:
            return "アクセシビリティ"
        case .description:
            return nil
        case .credits:
            return "クレジット" //追加
        case .version:
            return "バージョン情報" //追加
        case .privacyPolicy:
            return "プライバシーポリシー" //追加
        }
    }
    
    var rowHeight: CGFloat {
        switch self {
        case .description:
            return 72.0
        default:
            return 48.0
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        switch self {
        case .account, .security, .notification, .contents, .sounds, .dataUsing, .accessibility, .credits, .version, .privacyPolicy: //追加
            return .disclosureIndicator
        case .description:
            return .none
        }
    }
}
