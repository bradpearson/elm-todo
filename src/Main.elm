module ToDoApp where

import ToDoItem exposing (..)
import ToDoItemList exposing (..)
import StartApp.Simple exposing (start)

todoList = [
    { id = 0
    , name = "Write Elm Application"
    , description = "Write the thing already!"
    , active = True 
    , removed = False
    }
    ,
    { id = 1
    , name = "Give Elm Presentation"
    , description = "Create a presentation to give to coworkers to show the awesomeness of Elm"
    , active = True
    , removed = False
    }]

initialModel : ToDoItemList.Model
initialModel = 
    { todos = todoList
    , nameText = ""
    , descriptionText = ""
    , nextId = 2
    }    
    
main = start 
    { model = initialModel 
    , update = ToDoItemList.update 
    , view = ToDoItemList.view
    }