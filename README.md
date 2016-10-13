Resque Mailer Test Project
==========================

This sample Rails project illustrates usage of Resque::Mailer. It's also used for sanity checking when reporting or investigating an error condition.

0. Edit app/mailers/notifier.rb to set your local address for testing
1. Make sure Redis is running
2. Start Rails console
3. Send an email from the console:

    Notifier.test.deliver

Next, start a Resque worker and tail the development log to see the delivery happen:

    QUEUE=* rake environment resque:work
