(************************************************************************)
(* Copyright 2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2019-2024 Inria      -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2024-2025 Emilio J. Gallego Arias -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                    -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors           *)
(************************************************************************)
(* Rocq Language Server Protocol: Language-level AST Information        *)
(************************************************************************)

module Name : sig
  type t = string option
end

(** Information about the Ast, to move to lang *)
module Info : sig
  type t =
    { range : Range.t
    ; name : Name.t With_range.t
    ; kind : int
    ; detail : string option (* usually the type *)
    ; children : t list option
    }

  val make :
       range:Range.t
    -> name:Name.t With_range.t
    -> kind:int
    -> ?detail:string
    -> ?children:t list
    -> unit
    -> t
end
