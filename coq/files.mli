(*************************************************************************)
(* Copyright 2015-2019 MINES ParisTech -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2019-2024 Inria           -- Dual License LGPL 2.1+ / GPL3+ *)
(* Copyright 2024-2025 Emilio J. Gallego Arias  -- LGPL 2.1+ / GPL3+     *)
(* Copyright 2025      CNRS                     -- LGPL 2.1+ / GPL3+     *)
(* Written by: Emilio J. Gallego Arias and Bhakti Shah                   *)
(*************************************************************************)
(* Rocq Language Server Protocol: Files API                              *)
(*************************************************************************)

type t [@@deriving hash, compare]

val make : unit -> t

(** [bump ()] Signal the files have changed *)
val bump : t -> t

val hash : t -> int
val compare : t -> t -> int
val pp : Format.formatter -> t -> unit
