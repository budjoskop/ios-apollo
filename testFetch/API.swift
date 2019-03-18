//  This file was automatically generated and should not be edited.

import Apollo

public final class ViewControllerQuery: GraphQLQuery {
  public let operationDefinition =
    "query ViewController {\n  nodes(node_type: \"Review\") {\n    __typename\n    id\n    title\n    additional_fields {\n      __typename\n      ... on TypeReview {\n        intro\n      }\n    }\n    author {\n      __typename\n      name\n    }\n    tags {\n      __typename\n      id\n      name\n    }\n    elements(type: \"image\") {\n      __typename\n      data\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("nodes", arguments: ["node_type": "Review"], type: .list(.object(Node.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    /// A query
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes = ["Nodes"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("additional_fields", type: .object(AdditionalField.selections)),
        GraphQLField("author", type: .object(Author.selections)),
        GraphQLField("tags", type: .list(.object(Tag.selections))),
        GraphQLField("elements", arguments: ["type": "image"], type: .list(.object(Element.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String? = nil, additionalFields: AdditionalField? = nil, author: Author? = nil, tags: [Tag?]? = nil, elements: [Element?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Nodes", "id": id, "title": title, "additional_fields": additionalFields.flatMap { (value: AdditionalField) -> ResultMap in value.resultMap }, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "tags": tags.flatMap { (value: [Tag?]) -> [ResultMap?] in value.map { (value: Tag?) -> ResultMap? in value.flatMap { (value: Tag) -> ResultMap in value.resultMap } } }, "elements": elements.flatMap { (value: [Element?]) -> [ResultMap?] in value.map { (value: Element?) -> ResultMap? in value.flatMap { (value: Element) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Id
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Title
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// Additional Fields
      public var additionalFields: AdditionalField? {
        get {
          return (resultMap["additional_fields"] as? ResultMap).flatMap { AdditionalField(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "additional_fields")
        }
      }

      /// Author
      public var author: Author? {
        get {
          return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "author")
        }
      }

      /// tags
      public var tags: [Tag?]? {
        get {
          return (resultMap["tags"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Tag?] in value.map { (value: ResultMap?) -> Tag? in value.flatMap { (value: ResultMap) -> Tag in Tag(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Tag?]) -> [ResultMap?] in value.map { (value: Tag?) -> ResultMap? in value.flatMap { (value: Tag) -> ResultMap in value.resultMap } } }, forKey: "tags")
        }
      }

      /// Elements
      public var elements: [Element?]? {
        get {
          return (resultMap["elements"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Element?] in value.map { (value: ResultMap?) -> Element? in value.flatMap { (value: ResultMap) -> Element in Element(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Element?]) -> [ResultMap?] in value.map { (value: Element?) -> ResultMap? in value.flatMap { (value: Element) -> ResultMap in value.resultMap } } }, forKey: "elements")
        }
      }

      public struct AdditionalField: GraphQLSelectionSet {
        public static let possibleTypes = ["TypePage", "TypeProduct", "TypeQueue", "TypeReview", "TypeTagData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["TypeReview": AsTypeReview.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeTypePage() -> AdditionalField {
          return AdditionalField(unsafeResultMap: ["__typename": "TypePage"])
        }

        public static func makeTypeProduct() -> AdditionalField {
          return AdditionalField(unsafeResultMap: ["__typename": "TypeProduct"])
        }

        public static func makeTypeQueue() -> AdditionalField {
          return AdditionalField(unsafeResultMap: ["__typename": "TypeQueue"])
        }

        public static func makeTypeTagData() -> AdditionalField {
          return AdditionalField(unsafeResultMap: ["__typename": "TypeTagData"])
        }

        public static func makeTypeReview(intro: String? = nil) -> AdditionalField {
          return AdditionalField(unsafeResultMap: ["__typename": "TypeReview", "intro": intro])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asTypeReview: AsTypeReview? {
          get {
            if !AsTypeReview.possibleTypes.contains(__typename) { return nil }
            return AsTypeReview(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsTypeReview: GraphQLSelectionSet {
          public static let possibleTypes = ["TypeReview"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("intro", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(intro: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "TypeReview", "intro": intro])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Intro
          public var intro: String? {
            get {
              return resultMap["intro"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "intro")
            }
          }
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes = ["Users"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Users", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the user
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tags"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Tags", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the tag
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// title
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Element: GraphQLSelectionSet {
        public static let possibleTypes = ["Elements"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("data", type: .scalar(JsonData.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(data: JsonData? = nil) {
          self.init(unsafeResultMap: ["__typename": "Elements", "data": data])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Element data
        public var data: JsonData? {
          get {
            return resultMap["data"] as? JsonData
          }
          set {
            resultMap.updateValue(newValue, forKey: "data")
          }
        }
      }
    }
  }
}