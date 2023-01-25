module Pages.Home_ exposing (Model, Msg, page)

import Accessibility.Styled exposing (div, text)
import Css
import Html.Styled.Attributes exposing (css)
import Page exposing (Page)
import View exposing (View)


page : Page Model Msg
page =
    Page.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    let
        initialModel =
            {}

        initialCmd =
            Cmd.batch
                [ Cmd.none
                ]
    in
    ( initialModel, initialCmd )



-- UPDATE


type Msg
    = ExampleMsgReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ExampleMsgReplaceMe ->
            ( model
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Homepage"
    , body =
        [ div
            [ css []
            ]
            [ text "Hello, world!"
            ]
        ]
    }
