module Colors exposing (palette, Palette)

{-| This module holds all of the color information.


# Definition

@docs palette, Palette


# Common Helpers

> Currently, there are no helpers for this module.

-}

import Css exposing (Color, hex, hsl, rgba)
import RecordWithoutConstructorFunction exposing (RecordWithoutConstructorFunction)


type alias PaletteColor =
    RecordWithoutConstructorFunction
        { name : String
        , hue : Float
        , saturation : Float
        , lightness : Float
        , hex : String
        }


primary : PaletteColor
primary =
    { name = "blue"
    , hue = 191.0
    , saturation = 0.26
    , lightness = 0.57
    , hex = "#76a5af"
    }


secondary : PaletteColor
secondary =
    { name = "orange"
    , hue = 23.0
    , saturation = 1
    , lightness = 0.57
    , hex = ""
    }


accent : PaletteColor
accent =
    { name = "grey"
    , hue = 0.0
    , saturation = 0.0
    , lightness = 0.73
    , hex = "#bbbbbb"
    }


{-| Palette defines a palette, so that NoUnsortedRecords doesn't sort it.
-}
type alias Palette =
    RecordWithoutConstructorFunction
        { white : Color
        , black : Color
        , primary : Color
        , primaryLight : Color
        , primaryDark : Color
        , secondary : Color
        , secondaryLight : Color
        , secondaryDark : Color
        , accent : Color
        , accentLight : Color
        , accentDark : Color
        }


{-| The only place colors are defined for the whole application.
-}
palette : Palette
palette =
    { white = hex "#f5f5f5" --#ebeff9?
    , black = rgba 0 0 0 0.9
    , primary = hex primary.hex
    , primaryLight = hsl primary.hue primary.saturation 0.5
    , primaryDark = hsl primary.hue primary.saturation 0.3
    , secondary = hex secondary.hex
    , secondaryLight = hsl secondary.hue secondary.saturation 0.6
    , secondaryDark = hsl secondary.hue secondary.saturation 0.4
    , accent = hex accent.hex
    , accentLight = hsl accent.hue accent.saturation 0.98
    , accentDark = hsl accent.hue accent.saturation 0.27
    }
