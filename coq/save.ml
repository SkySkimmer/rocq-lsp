(************************************************************************)
(* Copyright 2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2019-2024 Inria      -- Dual License LGPL 2.1+ / GPL3+     *)
(* Copyright 2024-2025 Emilio J. Gallego Arias -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                    -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors           *)
(************************************************************************)
(* Rocq Language Server Protocol: Rocq Save .vo API                     *)
(************************************************************************)

(* Taken from sertop / Coq *)
let ensure_no_pending_proofs ~in_file ~st =
  match st.Vernacstate.interp.lemmas with
  | Some lemmas ->
    let pfs = Vernacstate.LemmaStack.get_all_proof_names lemmas in
    CErrors.user_err
      Pp.(
        str "There are pending proofs in file "
        ++ str in_file ++ str ": "
        ++ (pfs |> List.rev |> prlist_with_sep pr_comma Names.Id.print)
        ++ str ".")
  | None ->
    let pm = st.Vernacstate.interp.program in
    let what_for = Pp.str ("file " ^ in_file) in
    NeList.iter
      (fun pm -> Declare.Obls.check_solved_obligations ~what_for ~pm)
      pm

let ensure_out_dir file =
  let rec mkdir_p dir =
    if not (Sys.file_exists dir) then (
      mkdir_p (Filename.dirname dir);
      Unix.mkdir dir 0o755)
  in
  mkdir_p (Filename.dirname file)

let save_vo ~st ~ldir in_file =
  let st = State.to_coq st in
  let () = ensure_no_pending_proofs ~in_file ~st in
  let out_vo = Filename.(remove_extension in_file) ^ ".vo" in
  let output_native_objects = false in
  let todo_proofs = Library.ProofsTodoNone in
  (* In some cases, such as in web-worker contexts, the output .vo directory may
     not exist on the virtual worker filesystem, so we ensure the .vo creation
     won't fail because of this. Note that this is really a hack and could have
     security implications, a proper worker filesystem should be implemented
     instead. *)
  let () = ensure_out_dir out_vo in
  let () =
    Library.save_library_to todo_proofs ~output_native_objects ldir out_vo
  in
  ()

let save_vo ~token ~st ~ldir ~in_file =
  Protect.eval ~token ~f:(save_vo ~st ~ldir) in_file
