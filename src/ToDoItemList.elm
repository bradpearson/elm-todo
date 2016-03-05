module ToDoItemList(Model, Action, update, view) where

import ToDoItem exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model = 
    { todos : List ToDoItem.Model
    , nameText : String
    , descriptionText: String
    , nextId : Int
    }

type Action
    = NoOp Int ToDoItem.Action 
    | UpdateNameText String
    | UpdateDescriptionText String
    | Add
     
update : Action -> Model -> Model 
update action model =
    case action of
        NoOp itemId toDoItemAction ->
            let updateToDo todo =
                if todo.id == itemId
                    then ToDoItem.update toDoItemAction todo
                    else todo
                
            in
                { model | todos = List.map updateToDo model.todos }
                
        Add ->
            { model |
                todos = model.todos ++
                    [
                        { id = model.nextId
                        , name = model.nameText
                        , description = model.descriptionText
                        , active = True
                        , removed = False
                        }
                    ],
                nameText = "",
                descriptionText = "",
                nextId = model.nextId + 1
            }  
            
        UpdateNameText str ->
            { model | nameText = str }
            
        UpdateDescriptionText str ->
            { model | descriptionText = str }
                            
view : Signal.Address Action -> Model -> Html
view address model = 
    let 
        fwd : ToDoItem.Model -> Html
        fwd item = 
            ToDoItem.view (Signal.forwardTo address (NoOp item.id)) item
            
        toDoItems = 
            { todos = List.map fwd model.todos
            , formData = []
            }
        
    in
        div 
            [] 
            (
                toDoItems.todos ++ 
                [div 
                    [ class "form-wrapper" ] 
                    [ text "Add New ToDo" 
                    , input
                        [ id "nameInput"
                        , placeholder "Task Name"
                        , on "keyup" targetValue (Signal.message address << UpdateNameText)  
                        ] 
                        []
                    , textarea
                        [ id "nameDescription"
                        , placeholder "Task Description"
                        , on "keyup" targetValue (Signal.message address << UpdateDescriptionText) 
                        ]
                        []
                    , button 
                        [ id "submitButton", onClick address Add ]
                        [ text "Add" ]
                    ]]
            )