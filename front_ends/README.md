# Marmot Playground

## Description

Marmot playground allows to play games with randos.

**Backend:**

For the backend it uses Appwrite. The reason behind this is simply because it's a mature, good and open source BaaS and I'm familiar with it.

You may wonder why there is a backend**S** folder. Well the plan is to also use other backends such as node.js or dart frog when they add webrtc support.

**FrontEnd**

Flutter is also the technology I'm most familiar with when it comes to front-end. Furthermore, it's an open source, multi-platform, well-tested SDK.


## How does the matchmaking works

The part that is the most interesting so far in the project is how the requests are made. So when the user triggers a request, it semi-randomly(~50% chance) either becomes a guest or a host. When you're a host, you add a request document to the DB that can be seen by all other potential players but also monitors the request in the front end. 

What a guest does is check that list, when it finds an idle, without an opponent match, it updates the request by changing the writing permission and adding itself as an opponent.

The host is then notified and the match starts for both parties.

## TODO

[X] match requests
[] actual matches
[] rock paper scissors
[] more games!



## Attributions:

### Images
    - Marmot: <a href="https://www.vecteezy.com/free-vector/playground">Playground Vectors by Vecteezy</a>
    - Rock paper scissors (Love this one): <a href="https://www.vecteezy.com/free-vector/rock-paper-scissors">Rock Paper Scissors Vectors by Vecteezy</a> 