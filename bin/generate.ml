open! Core
open! Hardcaml

module Top = Proto_engine.Top

let () =
  let module Circuit = Circuit.With_interface (Top.I) (Top.O) in

  let circuit =
    Circuit.create_exn
      ~name:"tt_um_proto_engine"
      Top.create
  in

  Rtl.print Verilog circuit
;;