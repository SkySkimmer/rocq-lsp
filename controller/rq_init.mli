(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: Initialize Request                     *)
(*************************************************************************)

(** Setups the server configuration, takes the list of settings as a JSON dict *)
val do_settings : (string * Yojson.Safe.t) list -> unit

(** Returns answer request + workspace root directory *)
val do_initialize :
     io:Fleche.Io.CallBack.t
  -> params:(string * Yojson.Safe.t) list
  -> Yojson.Safe.t * string list
