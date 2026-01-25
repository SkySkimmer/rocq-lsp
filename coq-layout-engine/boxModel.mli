(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: coq-layout-engine                      *)
(*************************************************************************)

(* Note: This file is independent of Coq        *)
(* XXX: TODO enforce the above in the dune file *)
type abs_kind =
  | Prod
  | Lam

module Id : sig
  type 'a t =
    { relative : string
    ; absolute : string option
    ; typ : 'a option
    }
end

module Variable : sig
  type 'a t =
    { name : string
    ; typ : 'a
    }
end

module Binder : sig
  type 'a t =
    { namel : string list
    ; typ : 'a
    }
end

(** Output Layout Box model, designed to be embedded in DOM almost directly, and
    to replace Pp.t *)
type t =
  | Variable of t option Variable.t  (** Variable *)
  | Constant of string  (** Constant *)
  | Identifier of t Id.t  (** Identifier *)
  | Sort of string list  (** Sort *)
  | App of
      { fn : t
      ; impl : t list
      ; argl : t list
      }  (** Application box *)
  | Cast of t option * t  (** Cast box *)
  | Abs of
      { kind : abs_kind
      ; binderl : t Binder.t list
      ; v : t
      }  (** Abstraction *)
  | Let of
      { lhs : t
      ; rhs : t
      ; typ : t option
      ; v : t
      }  (** Let *)
  | Notation of
      { key : string
      ; args : t list
      ; pretty : t list
      ; raw : t
      }  (** Notation *)
  | Fixpoint of t * t

(** Simple wrapping in <div> *)
module Render : sig
  val to_html :
    t -> [< Html_types.span_content_fun > `PCDATA `Span ] Tyxml.Html.elt
end
