.TL
The Way WhatsApp Works

.LP
In this digital assignment, we will be analyzing how WhatsApp works through the means of speculation. For this purpose we will be looking at the various main features of WhatsApp and how each of them work.

.AU
Angad Sharma, 17BCE2009

.ND
10/09/2020

.NH 1
Features of WhatsApp

.NH 2
Creating Chats

.PP
Let us start with the basics. WhatsApp has an option to create chats, and it does so by allowing you to start chatting with the contacts that are saved in your phone.

.NH 2
Sending Textual Messages

.PP 
For sending text messages, WhatsApp has a server which records all incoming requests from users. A typical message format can be of the following type:

.QP
.I
from: uid1
.br
to: uid2
.br
message: hello, world
.br
time_sent: <unix timestamp>
.br
time_received: <unix_timestamp> or None
.br
time_opened: <unix_timestamp> or None
.br
new_message: False/True
.br
is_deleted: False/True
.br
is_forwarded: False/True
.br
is_visible: False/True

.PP
The payload that has been described takes care of the following cases:

.IP 1
Making sure that the sending and receiving time is recorded

.IP 2
Read receipt feature (at what time was the message read)

.IP 3
Was the received message the first one or not. If it is the first one then WhatsApp shows slightly different user interface

.IP 4
Has the message been deleted from the server altogether

.IP 5
Is the message deleted from the users end (only)

.NH 2
Sending and Re-Sending Media

.PP
Sending media can be slightly more complicated. For this purpose let us add some relevent fields for the same. The first specifies the type of message being sent. The second and third are only used when the message type is not text.

.QP
.I
message_type: voice/photo/video/text
.br
media_url: ID/None
.br
media_caption: None/Some Message

.PP
Notice how if you send a video to someone, it takes a lot of time for it to send, but if your forward the same video then it is instantaenous. This is because once you send a video, it gets uploaded onto the WhatsApp servers, which then return an ID. Hence sending media files to someone is as simple is sending them an ID/URL to the media file stored on the WhatsApp servers. Payload is included with the type of the message. If message type is related to media then the media_url (and media_caption) field is populated, otherwise it is null.

.NH 2
Start a group chat

.PP
Group chat is a fairly simple concept. You create a group with a couple of users and all messages sent to that group are visible to everyone. You can even reply to messages from people. Notice how we had the 
.B from 
and the 
.B to
fields in our payload, both of which were IDs. Well what we need for this is just another schema which stores the IDs of users present in a group to loosely couple them together.

.QP
.I
group_id: ID
.br
name: Group Name
.br
member_count: 250 < x < 1

.PP
Notice that we do not need to add the group member details in the group schema itself. This is because it is a may to many relation where one group can have many members and vice versa, therefore after database normalization it makes more sense for us to have a separate schema mapping users to groups.

.QP
.I
user_id: ID
.br
group_id: ID

.NH 2
Group administration

.PP
This is a standard access control problem. There is one group admin and many members initially. The admin can elevate privelages and make other people admin, and can also perform varius actions on the group which no other member can.

For this purpose we need to specify the type of user in a group-user mapping, which can then be read at the application level in order to determine if the user should have the rights to perform the action that they want to perform.

.QP
.I
user_id: ID
.br
group_id: ID
.br
user_type: member/admin

.NH 2
Notification Daemon

.PP
A Notification daemon is a program that runs in the background, ideally on the client side, in order to serve up message notifications. Since the WhatsApp services arealways active in the background, it is safe to assume that it uses some kind of a 2 way persistent connection rather than polling the server every second for updates. It could be a socket tunnel for the sake of our argument, which also makes sense because we can reply to the notifications themselves thereby utilizing the bidirectionality of the socket connection, but i digress.

.NH 2
WhatsApp Stories

.PP
This is a relatively new feature added to WhatsApp which takes its roots from instagram, which is also acquired by WhatsApp at the moment. This feature lets the users add some form of textual or pictoral content which can be seen by other contacts of the user, irrespective of if they have started the chat or not. 

Stories use what is known as a CRON job, which is a periodic daemon that runs on the WhatsApp servers and is responsible for periodically removing stories which have exceeded their uptime (24 hours).
