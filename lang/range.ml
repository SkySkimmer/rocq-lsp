(************************************************************************)
(* Copyright 2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2019-2024 Inria      -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2024-2025 Emilio J. Gallego Arias -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                    -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors           *)
(************************************************************************)
(* Rocq Language Server Protocol: Language-level Range                  *)
(************************************************************************)

type t =
  { start : Point.t
  ; end_ : Point.t
  }

let pp fmt { start; end_ } =
  Format.fprintf fmt "(@[%a@]--@[%a@])" Point.pp start Point.pp end_

let to_string r = Format.asprintf "%a" pp r
