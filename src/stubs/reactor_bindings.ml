open Ctypes

module C (F : Cstubs.FOREIGN) = struct

    (*
    let reactor_user_callback = Foreign.funptr (ptr void @-> int @-> ptr void @-> returning void)

    module User = struct
        type reactor_user
        let reactor_user : reactor_user structure typ = structure "reactor_user"
        let callback = field reactor_user "callback" reactor_user_callback
        let user_state = field reactor_user "state" (ptr void)
        let () = seal reactor_user

        let reactor_user_construct = F.foreign "reactor_user_construct" F.(ptr reactor_user @-> ptr reactor_user_callback @-> ptr void @-> returning void)
    end

    module Resolver = struct
        type reactor_resolver
        let reactor_resolver : reactor_resolver structure typ = structure "reactor_resolver"
        let _ref = field reactor_resolver "ref" int
        let state = field reactor_resolver "state" int
        let user = field reactor_resolver "user" User.reactor_user
        let node = field reactor_resolver "node" (ptr char)
        let service = field reactor_resolver "service" (ptr char)
    end

    module Tcp = struct
        type reactor_tcp
        let reactor_tcp : reactor_tcp structure typ = structure "reactor_tcp"
        let _ref = field reactor_tcp "ref" short
        let state = field reactor_tcp "state" short
        let user = field reactor_tcp "user" User.reactor_user
        let socket = field reactor_tcp "socket" int
        let flags = field reactor_tcp "flags" int
        let resolver = field reactor_tcp "resolver" Resolver.reactor_resolver
    end

    type reactor_http_server
    let reactor_http_server : reactor_http_server structure typ = structure "reactor_http_server"
    let _ref = field reactor_http_server "ref" int
    let state = field reactor_http_server "state" int
    let user = field reactor_http_server "user" User.reactor_user
    let () = seal reactor_http_server
*)

    let reactor_core_construct = F.foreign "reactor_core_construct" F.(void @-> returning void)
end
