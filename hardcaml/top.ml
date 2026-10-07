open! Core
open! Hardcaml
open! Signal

module I = struct
  type 'a t =
    { ui_in : 'a [@bits 8]
    ; uio_in : 'a [@bits 8]
    ; ena : 'a
    ; clk : 'a
    ; rst_n : 'a
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { uo_out : 'a [@bits 8]
    ; uio_out : 'a [@bits 8]
    ; uio_oe : 'a [@bits 8]
    }
  [@@deriving hardcaml]
end

let create ({ ui_in = _; uio_in = _; ena = _; clk; rst_n } : _ I.t) : _ O.t =
  let clear = ~:rst_n in
  let spec = Reg_spec.create ~clock:clk ~clear () in

  let counter =
    reg_fb
      spec
      ~width:8
      ~f:(fun value -> value +:. 1)
  in

  { uo_out = counter
  ; uio_out = zero 8
  ; uio_oe = zero 8
  }
;;