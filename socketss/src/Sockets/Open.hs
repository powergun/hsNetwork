{-# LANGUAGE OverloadedStrings #-}

module Sockets.Open (demo) where

import           Codec.Binary.UTF8.String
import           Network.Socket

openSocket :: FilePath -> IO Socket
openSocket p = do
    sock <- socket AF_UNIX Stream defaultProtocol
    connect sock sockAddr
    return sock
  where
    sockAddr = SockAddrUnix . encodeString $ p

demo :: IO ()
demo = do
  let s = openSocket "/var/tmp/testsock"
  return ()
