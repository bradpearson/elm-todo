module ToDoItem (Model, Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model = 
    { id : Int
    , name : String
    , description : String
    , active : Bool
    , removed : Bool
    }
    

type Action 
    = Deactivate
    | Activate
    | Remove

update : Action -> Model -> Model
update action model = 
    case action of 
        Activate -> 
            { model |
                active = True
            }
        Deactivate ->
            { model |
                active = False
            }
        Remove ->
            { model |
                removed = True
            }
        
view : Signal.Address Action -> Model -> Html
view address model =
    let viewObj = {toggleText = "", activeClass = "", removedClass = "", toggleAction = ""} 
        
        getViewControls viewObj =
            if model.active == True then
                { viewObj |
                     toggleText = "Mark Complete", 
                     activeClass = "", 
                     toggleAction = Deactivate 
                }
            else
                { viewObj | 
                    toggleText = "Mark Incomplete",
                    activeClass = " inactive",
                    toggleAction = Activate 
                }
                
        getRemovedClass viewObj =
            if model.removed == True then
                { viewObj | removedClass = " removed" }
            else 
                { viewObj | removedClass = "" }
        
        viewControls = getViewControls(getRemovedClass viewObj)
    
    in
        
    div [ class ("todo-wrapper" ++ viewControls.removedClass) ]
        [ span [ class "todo-id" ] [text ("[" ++ toString model.id ++ "]")]
        , span [ class ("todo-name" ++ viewControls.activeClass) ] [ text model.name ]
        , div [ class ("todo-description" ++ viewControls.activeClass) ] [ text model.description ]
        , div [ class "todo-actions" ] 
            [ a [ href "#", class "toggle-todo", onClick address viewControls.toggleAction] [ text viewControls.toggleText ]
            , span [ class "todo-action-spacer" ] [ text "|" ]
            , a [ href "#", class "remove-todo", onClick address Remove] [ text "Remove" ]
            ]
        ]
         