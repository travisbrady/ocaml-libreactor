let stubgen prefix c_headers bindings =
  let ml_out = open_out (prefix ^ "_generated.ml")
  and c_out = open_out (prefix ^ "_stubs.c") in
  let ml_fmt = Format.formatter_of_out_channel ml_out
  and c_fmt = Format.formatter_of_out_channel c_out in
  Format.fprintf c_fmt "%s@." c_headers;
  Cstubs.write_c c_fmt ~prefix bindings;
  Cstubs.write_ml ml_fmt ~prefix bindings;
  Format.pp_print_flush ml_fmt ();
  Format.pp_print_flush c_fmt ();
  close_out ml_out;
  close_out c_out

let () = stubgen "reactor" "#include <stddef.h>\n#include <stdint.h>\n#include <sys/queue.h>\n#include <sys/types.h>\n#include <sys/socket.h>\n#include <netdb.h>\n#include <dynamic.h>\n#include <reactor.h>" (module Reactor_bindings.C)
