module Transitions exposing (transitions)

import Spa.Transition as Transition
import Utils.Spa as Spa
import Generated.Docs.Pages as Docs

transitions : Spa.Transitions msg
transitions =
    { layout = Transition.fadeElmUi 500
    , page = Transition.fadeElmUi 300
    , pages = 
        [ { path = Docs.path
          , transition = Transition.fadeElmUi 300
          } 
        ]
    }
