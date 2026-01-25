(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: Serlib plugin loader                   *)
(*************************************************************************)

(** [plugin_handler user_loader] Plugin loader that will also load the
    instrumentation plugins for serlib if those available. [user_loader] can be
    used to override the default of [Fl_dynload.load_packages] as loader. *)
val plugin_handler : (string list -> unit) option -> Mltop.PluginSpec.t -> unit
