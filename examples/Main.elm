module Main exposing (..)

import Source exposing (source, MediaType(..), mediaType, videoCodec, audioCodec, timeFragment)
import Html exposing (audio, video)
import Html.Attributes exposing (controls, width, height, loop)


{-| If this works, you should see a screaming scientist on recent versions of Safari & Edge,
a tractor with a big green "VP9" on recent Firefox & Chrome, and normal tractor
on everything else
-}
main =
    let
        h265 =
            source "https://s3.amazonaws.com/x265.org/video/Tears_400_x265.mp4"
                [ mediaType MP4, videoCodec "hevc", timeFragment ( 2, 3 ) ]

        vp9 =
            source "https://base-n.de/webm/out9.webm"
                [ mediaType WebMVideo, videoCodec "vp9", timeFragment ( 2, 3 ) ]

        h264 =
            source "https://s3.amazonaws.com/x265.org/video/Tractor_500kbps_x264.mp4"
                [ mediaType MP4, timeFragment ( 2, 3 ) ]
    in
        video [ controls True, width 320, height 240, loop True ]
            [ h265, vp9, h264 ]
