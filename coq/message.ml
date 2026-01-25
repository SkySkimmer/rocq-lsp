(************************************************************************)
(* Copyright 2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2019-2024 Inria      -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2024-2025 Emilio J. Gallego Arias -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                    -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors           *)
(************************************************************************)
(* Rocq Language Server Protocol: Rocq Message API                      *)
(************************************************************************)

(** Messages from Coq *)
module Payload = struct
  type 'l t =
    { range : 'l option
    ; quickFix : 'l Lang.Qf.t list option
    ; msg : Pp.t
    }

  let make ?range ?quickFix msg = { range; quickFix; msg }

  let map ~f { range; quickFix; msg } =
    let quickFix = Option.map (List.map (Lang.Qf.map ~f)) quickFix in
    { range = Option.map f range; quickFix; msg }
end

type 'l t = Lang.Diagnostic.Severity.t * 'l Payload.t

let map ~f (lvl, pl) = (lvl, Payload.map ~f pl)
