(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: Low-level internal Rocq initialization *)
(*************************************************************************)

type coq_opts =
  { load_module : string -> unit  (** callback to load cma/cmo files *)
  ; load_plugin : Mltop.PluginSpec.t -> unit
        (** callback to load findlib packages *)
  ; debug : bool  (** Enable Coq Debug mode *)
  ; record_comments : bool  (** Enable Comment Recording *)
  ; vm : bool  (** Enable Coq's VM *)
  ; warnings : string option  (** Coq's Warnings *)
  }

val coq_init : coq_opts -> State.t

val doc_init :
     token:Limits.Token.t
  -> intern:Library.Intern.t
  -> root_state:State.t
  -> workspace:Workspace.t
  -> uri:Lang.LUri.File.t
  -> (State.t, Loc.t) Protect.E.t

val mk_fb_handler :
  (int * Loc.t Message.Payload.t) list ref -> Feedback.feedback -> unit
