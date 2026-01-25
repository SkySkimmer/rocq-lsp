(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias & coq-lsp contributors            *)
(*************************************************************************)
(* Rocq Language Server Protocol: Request Utils                          *)
(*************************************************************************)

(* Contents utils, should be moved to Contents.t , they mainly handle character
   enconding conversiong between protocol and prover positions, if needed *)

val get_id_at_point :
  contents:Fleche.Contents.t -> point:int * int -> string option

val get_char_at_point :
  prev:bool -> contents:Fleche.Contents.t -> point:int * int -> char option

(* Get both the uchar and its utf-8 string representation *)
val get_uchar_at_point :
     prev:bool
  -> contents:Fleche.Contents.t
  -> point:int * int
  -> (Uchar.t * string) option
