(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: Document Symbols Request               *)
(*************************************************************************)

(** Several todos here in terms of usability *)

let request ~token ~doc =
  let open Coq.Protect.E.O in
  let lines = Fleche.Doc.lines doc in
  let f () =
    (* XXX: What do do with feedback, return to user? *)
    let+ () = Fleche.Doc.save ~token ~doc in
    Ok `Null
  in
  Request.R.of_execution ~lines ~name:"save" ~f ()
