{-# LANGUAGE OverloadedStrings #-}

module Web.NgForm where

import Text.Blaze
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as H hiding (form, label)
import Data.Monoid
import Text.Blaze.Internal
import Control.Monad

ngForm =  H.form ! H.novalidate mempty ! formRole 

formGroup = divClass "form-group" 

checkBox ngMdl s = divClass "checkBox" $ H.label $ do
                     H.input ! H.type_ "checkbox" ! ngModel ngMdl
                     s

radios ngMdl lblVals = forM lblVals $ \(lbl,val) -> do
  divClass "radio" $ H.label $ do
      H.input ! H.type_ "radio" ! ngModel ngMdl ! H.value val
      lbl

textInput = H.input ! H.type_ "text" ! H.class_ "form-control"

emailInput = H.input ! H.type_ "email" ! H.class_ "form-control"

required = H.required (mempty)

---- utilities

formRole :: Attribute
formRole = attribute "role" " role=\"" "form"

ngModel :: AttributeValue -> Attribute
ngModel = attribute "ng-model" " ng-model=\"" 


divClass k = H.div ! H.class_ k 