public enum Item: Int {
    case hair
    case beard
    case nosehair
    case nail
    case eyebrows
    case roomClean
    case futon
    case toilet
    
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

