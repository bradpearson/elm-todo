# Elm ToDo
This is a simple ToDo app that I built in an afternoon as my first Elm application. I just read the Elm docs,
asked a question on Stack Overflow and one on Slack and was able to build this. I am a JavaScript developer with no real functional programming
experience, but after messing around with React for a while, the Elm Architecture for web apps was easy to understand. I built this without debugging the app at all. The compiler basically
told me everything that needed to be fixed before I ran the application.

This isn't meant to be visually appealing, just a simple text based app that lets you add, remove and toggle complete ToDo's. Styling wasn't my goal here. 
Understanding how to build an Elm app was.

## Running The App
You need to have Elm installed as well as Node and npm. 
- npm install
- elm make
- npm start

## Some Things I learned Building This
- Building a React JS app and then building this Elm app made me understand what stateless and immutable really mean. You can cheat in React, but there is
no cheating in Elm and it made me understand the whole FP approach better.
- Understanding the Actions was a little tough. Forwarding the address onto a child compoonent was hard for me to get, but I think I understand it now.
- When you have a parent - child relationship with components, the update function needs to cascade down to the child. 
That wasn't apparent to me at first without looking at some other code.
- It's different than all the JS I have been writing and because of that, it's fun.   