//
//  Created by Wojciech Chojnacki on 22/03/2022.
//

import Foundation

public extension BlockType {

    struct ChildrenBlockValue {
        /// field used only for encoding for adding/appending new blocks
        public let children: [BlockType]?

        public init(children: [BlockType]? = nil) {
            self.children = children
        }

        public static let none = ChildrenBlockValue(children: nil)
    }

    struct TextAndChildrenBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        /// field used only for encoding for adding/appending new blocks
        public let children: [BlockType]?

        @available(*, deprecated, message: "Please use init(richText:children:) instead")
        public init(text: [RichText], children: [BlockType]? = nil) {
            self.richText = text
            self.children = children
        }
        
        public init(richText: [RichText], children: [BlockType]? = nil) {
            self.richText = richText
            self.children = children
        }
    }

    struct HeadingBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        @available(*, deprecated, message: "Please use init(richText:) instead")
        public init(text: [RichText]) {
            self.richText = text
        }
        
        public init(richText: [RichText]) {
            self.richText = richText
        }
    }

    struct ToDoBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        public let checked: Bool?
        // field used only for encoding for adding/appending new blocks
        public let children: [BlockType]?

        @available(*, deprecated, message: "Please use init(richText:checked:children:) instead")
        public init(text: [RichText], checked: Bool? = nil, children: [BlockType]? = nil) {
            self.richText = text
            self.checked = checked
            self.children = children
        }
        
        public init(richText: [RichText], checked: Bool? = nil, children: [BlockType]? = nil) {
            self.richText = richText
            self.checked = checked
            self.children = children
        }
    }

    struct ChildPageBlockValue {
        public let title: String

        public init(title: String) {
            self.title = title
        }
    }

    struct ChildDatabaseBlockValue {
        public let title: String

        public init(title: String) {
            self.title = title
        }
    }

    struct CodeBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        public let language: String?

        @available(*, deprecated, message: "Please use init(richText:language) instead")
        public init(text: [RichText], language: String? = nil) {
            self.richText = text
            self.language = language
        }
        
        public init(richText: [RichText], language: String? = nil) {
            self.richText = richText
            self.language = language
        }
    }

    struct CalloutBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        // field used only for encoding for adding/appending new blocks
        public let children: [BlockType]?
        public let icon: IconFile?

        @available(*, deprecated, message: "Please use init(richText:children:icon:) instead")
        public init(text: [RichText], children: [BlockType]? = nil, icon: IconFile? = nil) {
            self.richText = text
            self.children = children
            self.icon = icon
        }
        
        public init(richText: [RichText], children: [BlockType]? = nil, icon: IconFile? = nil) {
            self.richText = richText
            self.children = children
            self.icon = icon
        }
    }

    struct QuoteBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        // field used only for encoding for adding/appending new blocks
        public let children: [BlockType]?

        @available(*, deprecated, message: "Please use init(richText:children:) instead")
        public init(text: [RichText], children: [BlockType]? = nil) {
            self.richText = text
            self.children = children
        }
        
        public init(richText: [RichText], children: [BlockType]? = nil) {
            self.richText = richText
            self.children = children
        }
    }

    struct EmbedBlockValue {
        public let url: String
        public let caption: [RichText]

        public init(url: String, caption: [RichText]) {
            self.url = url
            self.caption = caption
        }
    }

    struct BookmarkBlockValue {
        public let url: String
        public let caption: [RichText]

        public init(url: String, caption: [RichText]) {
            self.url = url
            self.caption = caption
        }
    }

    struct FileBlockValue {
        public let file: FileFile
        public let caption: [RichText]

        public init(file: FileFile, caption: [RichText]) {
            self.file = file
            self.caption = caption
        }
    }

    struct EquationBlockValue {
        public let expression: String

        public init(expression: String) {
            self.expression = expression
        }
    }

    enum LinkToPageBlockValue {
        case page(Page.Identifier)
        case database(Database.Identifier)
        case unknown
    }

    enum SyncedBlockValue {
        case originalBlock
        case reference(Block.Identifier)
    }

    struct TemplateBlockValue {
        public let richText: [RichText]
        @available(*, deprecated, renamed: "richText")
        public var text: [RichText] {
            richText
        }
        /// field used only for encoding for adding/appending new blocks
        public let children: [BlockType]?

        @available(*, deprecated, message: "Please use init(richText:children:) instead")
        public init(text: [RichText], children: [BlockType]? = nil) {
            self.richText = text
            self.children = children
        }
        
        public init(richText: [RichText], children: [BlockType]? = nil) {
            self.richText = richText
            self.children = children
        }
    }
}

// MARK: - Codable

extension BlockType.ChildrenBlockValue: Codable {}

extension BlockType.TextAndChildrenBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
        case children
    }
}
extension BlockType.HeadingBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
    }
}
extension BlockType.ToDoBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
        case checked
        case children
    }
}

extension BlockType.ChildPageBlockValue: Codable {}

extension BlockType.ChildDatabaseBlockValue: Codable {}

extension BlockType.CodeBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
        case language
    }
}
extension BlockType.CalloutBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
        case children
        case icon
    }
}
extension BlockType.QuoteBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
        case children
    }
}

extension BlockType.EmbedBlockValue: Codable {}

extension BlockType.BookmarkBlockValue: Codable {}

extension BlockType.FileBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case caption
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.caption = try container.decode([RichText].self, forKey: .caption)
        self.file = try FileFile(from: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(caption, forKey: .caption)
        try file.encode(to: encoder)
    }
}

extension BlockType.EquationBlockValue: Codable {}

extension BlockType.LinkToPageBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case pageId = "page_id"
        case databaseId = "database_id"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case CodingKeys.pageId.rawValue:
            let value = try container.decode(Page.Identifier.self, forKey: .pageId)
            self = .page(value)
        case CodingKeys.databaseId.rawValue:
            let value = try container.decode(Database.Identifier.self, forKey: .databaseId)
            self = .database(value)
        default:
            self = .unknown
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .database(let value):
            try container.encode(CodingKeys.databaseId.rawValue, forKey: .type)
            try container.encode(value, forKey: .databaseId)
        case .page(let value):
            try container.encode(CodingKeys.pageId.rawValue, forKey: .type)
            try container.encode(value, forKey: .pageId)
        case .unknown:
            break
        }
    }
}

extension BlockType.SyncedBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case syncedFrom = "synced_from"
        case children
    }

    private struct _ReferenceValue: Codable {
        let block_id: Block.Identifier
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let reference = try container.decodeIfPresent(_ReferenceValue.self, forKey: .syncedFrom) {
            self = .reference(reference.block_id)
        } else {
            self = .originalBlock
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .reference(let identifier):
            try container.encode(_ReferenceValue(block_id: identifier), forKey: .syncedFrom)
        case .originalBlock:
            try container.encode(Optional<_ReferenceValue>.none, forKey: .syncedFrom)
        }
    }
}

extension BlockType.TemplateBlockValue: Codable {
    enum CodingKeys: String, CodingKey {
        case richText = "rich_text"
        case children
    }
}
