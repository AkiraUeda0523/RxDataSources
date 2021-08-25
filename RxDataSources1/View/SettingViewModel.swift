import RxSwift
import RxCocoa
import RxDataSources

class SettingsViewModel {

    let items = BehaviorRelay<[SettingsSectionModel]> (value: [])

    var itemsObservable: Observable<[SettingsSectionModel]> {
        return items.asObservable()
    }

    func setup() {
        updateItems()
    }

    func updateItems() {
        let sections: [SettingsSectionModel] = [
            accountSection(),
            commonSection(),
            otherSection() //追加
        ]
        items.accept(sections)
    }
//    追加
    private func otherSection() -> SettingsSectionModel {
        let items: [SettingsItem] = [
            .credits,
            .version,
            .privacyPolicy
        ]
        return SettingsSectionModel(model: .other, items: items)
    }

    
    
    private func accountSection() -> SettingsSectionModel {
        let items: [SettingsItem] = [
            .account,
            .security,
            .notification,
            .contents
        ]
        return SettingsSectionModel(model: .account, items: items)
    }

    private func commonSection() ->  SettingsSectionModel {
        let items: [SettingsItem] = [
            .sounds,
            .dataUsing,
            .accessibility,
            .description(text: "基本設定はこの端末でログインしている全てのアカウントに適用されます。")
        ]
        return SettingsSectionModel(model: .common, items: items)
    }
}
