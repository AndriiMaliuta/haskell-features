matchHeader :: L.ByteString -> L.ByteString -> Maybe L.ByteString
-- "nat" here is short for "natural number"
getNat :: L.ByteString -> Maybe (Int, L.ByteString)
getBytes :: Int -> L.ByteString 
     -> Maybe (L.ByteString, L.ByteString)
parseP5 s =
 case matchHeader (L8.pack "P5") s of
    Nothing -> Nothing
    Just s1 ->
        case getNat s1 of
            Nothing -> Nothing
            Just (width, s2) ->
                case getNat (L8.dropWhile isSpace s2) of
                    Nothing -> Nothing
                    Just (height, s3) ->
                    case getNat (L8.dropWhile isSpace s3) of
                    Nothing -> Nothing
                    Just (maxGrey, s4)
                    | maxGrey > 255 -> Nothing
                    | otherwise ->
                    case getBytes 1 s4 of
                    Nothing -> Nothing
                    Just (_, s5) ->
                     case getBytes (width * height) s5 of
                      Nothing -> Nothing
                      Just (bitmap, s6) ->
                        Just (Greymap width height maxGrey bitmap, s6)