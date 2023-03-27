public enum Item: Int, CaseIterable {
    case hair
    case beard
    case nosehair
    case nail
    case eyebrows
    case roomClean
    case futon
    case toilet
    
    var name: String {
        switch self {
        case .hair:
            return "髪"
        case .beard:
            return "髭"
        case .nosehair:
            return "鼻毛"
        case .nail:
            return "爪"
        case .eyebrows:
            return "眉毛"
        case .roomClean:
            return "部屋の掃除"
        case .futon:
            return "布団"
        case .toilet:
            return "トイレ掃除"
        }
    }
    
    var word: String {
        switch self {
        case .hair:
            return "髪の毛を切りますか？"
        case .beard:
            return "髭を剃りますか？"
        case .nosehair:
            return "鼻毛を剃りますか？"
        case .nail:
            return "爪を切りますか？"
        case .eyebrows:
            return "眉毛を剃りますか？"
        case .roomClean:
            return "部屋を掃除しますか？"
        case .futon:
            return "布団を干しますか？"
        case .toilet:
            return "トイレを掃除しますか？"
        }
    }
    
    var itemWord: String {
        switch self {
        case .hair:
            return "hair"
        case .beard:
            return "beard"
        case .nosehair:
            return "nosehair"
        case .nail:
            return "nail"
        case .eyebrows:
            return "eyebrows"
        case .roomClean:
            return "roomClean"
        case .futon:
            return "futon"
        case .toilet:
            return "toilet"
        }
    }
}
