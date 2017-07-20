(*
  (c_flags (-I/usr/local/include))
  (c_library_flags (-ldynamic -lreactor -fPIC))
  (library_flags (-linkall))
  *)
let () =
    let r = Reactor.C.reactor_core_construct () in
    Printf.printf "hi\n"
