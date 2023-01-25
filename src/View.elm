module View exposing
    ( View, map
    , none, fromString
    , toBrowserDocument
    )

{-|

@docs View, map
@docs none, fromString
@docs toBrowserDocument

-}

import Accessibility.Styled exposing (div)
import Browser
import Colors exposing (palette)
import Css exposing (backgroundColor, borderBox, boxSizing, color, column, displayFlex, em, flexDirection, fontFamilies, fontSize, lineHeight, margin, minHeight, preWrap, qt, sansSerif, vh, whiteSpace, zero)
import Css.Global exposing (descendants, everything)
import Html.Styled
import Route exposing (Route)
import Shared.Model


type alias View msg =
    { title : String
    , body : List (Accessibility.Styled.Html msg)
    }


{-| Used internally by Elm Land to create your application
so it works with Elm's expected `Browser.Document msg` type.
-}
toBrowserDocument :
    { shared : Shared.Model.Model
    , route : Route ()
    , view : View msg
    }
    -> Browser.Document msg
toBrowserDocument { view } =
    { title = view.title
    , body =
        [ div [] view.body
        , globalStyles
        ]
            |> List.map Accessibility.Styled.toUnstyled
    }


globalStyles : Html.Styled.Html msg
globalStyles =
    Css.Global.global
        [ Css.Global.body
            [ margin zero
            , backgroundColor palette.white
            , color palette.black
            , fontFamilies [ qt "Montserrat", .value sansSerif ]
            , fontSize (em 1)
            , minHeight (vh 100)
            , whiteSpace preWrap
            , lineHeight (em 1.35)
            , displayFlex
            , flexDirection column
            , descendants [ everything [ boxSizing borderBox ] ]
            ]
        ]


{-| Used internally by Elm Land to connect your pages together.
-}
map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn view =
    { title = view.title
    , body = List.map (Html.Styled.map fn) view.body
    }


{-| Used internally by Elm Land whenever transitioning between
authenticated pages.
-}
none : View msg
none =
    { title = ""
    , body = []
    }


{-| If you customize the `View` module, anytime you run `elm-land add page`,
the generated page will use this when adding your `view` function.

That way your app will compile after adding new pages, and you can see
the new page working in the web browser!

-}
fromString : String -> View msg
fromString moduleName =
    { title = moduleName
    , body = [ Accessibility.Styled.text moduleName ]
    }
