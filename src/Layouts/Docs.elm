module Layouts.Docs exposing (view)

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
            , header = "docs"
            , links = [ ("overview", routes.docs_top) ]
            , sections = 
                [
                    { header = "elm-spa"
                    , links = 
                        [ ("overview", routes.docs_dynamic "elm-spa")
                        , ("elm-spa init", routes.docs_dynamic_dynamic "elm-spa" "init")
                        , ("elm-spa add", routes.docs_dynamic_dynamic "elm-spa" "add")
                        , ("elm-spa build", routes.docs_dynamic_dynamic "elm-spa" "build")
                        ]
                    }
                ,   { header = "pages"
                    , links = 
                        [ ("overview", routes.docs_dynamic "pages")
                        , ("static", routes.docs_dynamic_dynamic "pages" "static")
                        , ("sandbox", routes.docs_dynamic_dynamic "pages" "sandbox")
                        , ("element", routes.docs_dynamic_dynamic "pages" "element")
                        , ("component", routes.docs_dynamic_dynamic "pages" "component")
                        ]
                    }
                ]
            }