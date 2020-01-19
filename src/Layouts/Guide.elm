module Layouts.Guide exposing (view)

import Element exposing (..)
import Utils.Spa as Spa
import Element.Font as Font 
import Ui exposing (colors)
import Generated.Routes as Routes exposing (Route, routes)

view : Spa.LayoutContext msg -> Element msg
view  { page, route } =
    row
        [ width (fill |> maximum 720)
        , centerX
        , paddingEach
            { top = 32
            , left = 16
            , right = 16
            , bottom = 128
            }
        ]
        [ el [ width (px 200), alignTop ] (viewSidebar route)
        , el [ alignTop, width fill ]page
        ]


viewSidebar : Route -> Element msg 
viewSidebar route = 
    Ui.sidebar 
            { active = route
            , header = "guide"
            , links = 
                [ ("installations", routes.guide_dynamic "installation")
                , ("getting-started", routes.guide_dynamic "getting-started")
                ]
            , sections = []
            }