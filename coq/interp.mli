(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: Rocq Interp API                        *)
(*************************************************************************)

(** Intepretation of "pure" Coq commands, that is to say, commands that are
    assumed not to interact with the file-system, etc... Note these commands
    will be memoized. *)
val interp :
     token:Limits.Token.t
  -> intern:Library.Intern.t
  -> st:State.t
  -> Ast.t
  -> (State.t, Loc.t) Protect.E.t

(** Interpretation of "require". We wrap this function for two reasons:

    - to make the read-effect dependency explicit
    - to workaround the lack of a pure interface in Coq *)
module Require : sig
  val interp :
       token:Limits.Token.t
    -> intern:Library.Intern.t
    -> st:State.t
    -> Files.t
    -> Ast.Require.t
    -> (State.t, Loc.t) Protect.E.t
end
