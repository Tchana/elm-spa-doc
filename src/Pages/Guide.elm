module Pages.Guide exposing (Model, Msg, page)

import Spa.Page
import Element exposing (..)
import Generated.Params as Params
import Utils.Spa exposing (Page)
import Ui

type alias Model =
    ()


type alias Msg =
    Never


page : Page Params.Guide Model Msg model msg appMsg
page =
    Spa.Page.static
        { title = always "Guide"
        , view = always view
        }



-- VIEW


view : Element Msg
view =
    column [ width (fill |> maximum 720), centerX ]
        [ Ui.hero 
            { title = "guide"
            , description = "Let's do stuff"
            , buttons = [ ( "getting started", "/guide/getting-started" ) ] 
            }
        , el [ width (fill |> maximum 480), centerX ] <|
             Ui.markdown """
### what can i build with elm-spa?

This entire site! And in this guide we'll build it together, from scratch. (Step-by-step, with short videos)

<iframe></iframe>
        """
        ]