(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias and Bhakti Shah                   *)
(*************************************************************************)
(* Rocq Language Server Protocol: Files API                              *)
(*************************************************************************)

open Ppx_hash_lib.Std.Hash.Builtin
open Ppx_compare_lib.Builtin

type t = int [@@deriving hash, compare]

let make () = 0
let bump i = i + 1
let hash = Int.hash
let compare = Int.compare
let pp = Format.pp_print_int
