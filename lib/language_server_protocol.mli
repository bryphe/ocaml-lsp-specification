module DocumentUri : sig
  type t = string
  [@@deriving yojson]
end

module TextDocumentIdentifier : sig
  type t =
    { uri: DocumentUri.t
    ; version: int option [@default None]
    }
  [@@deriving yojson]
end

module DidCloseTextDocumentParams : sig
  type t =
    { textDocument: TextDocumentIdentifier.t }
  [@@deriving yojson]
end

module DidCloseTextDocument : sig
  type t =
    { method_ : string
    ; params : DidCloseTextDocumentParams.t option
    }
  [@@deriving yojson]

  val create : params:DidCloseTextDocumentParams.t -> t
end

module Message : sig
  val create : json:Yojson.Safe.json -> string
end
