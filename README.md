# Swift Vonage events app

<img src="https://developer.nexmo.com/assets/images/Vonage_Nexmo.svg" height="48px" alt="Nexmo is now known as Vonage" />

This is a Swift project that uses [Vapor](vapor.codes) to create a website displays data that is posted to it. It can be used as the [Event URL](https://developer.nexmo.com/voice/voice-api/webhook-reference#event-webhook) for your voice Vonage application. It is currently deployed: https://vonage-events.herokuapp.com

## Welcome to Vonage

If you're new to Vonage, you can [sign up for a Vonage API account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=github.com/nexmo-community/swiftui-make-phone-call) and get some free credit to get you started.

## Overview

When the index page at the `url/YOUR_APP_ID` (e.g. `vonage-events.herokuapp.com/1c1688de-03e2-460b-b4de-4b0dbc7d2008`) is loaded, with a GET request, it opens a websocket to the server. Any JSON sent via a HTTP POST request to the same url will sent over the websocket and displayed on the index page without reload. 

If the index page is not open, JSON sent to the server is kept and processed once the page loads.

## Running the project

Open it in Xcode by running vapor xcode and wait for Xcode to download the packages.

Set a custom working directory for your project. Go to Product > Scheme > Edit Scheme... and set the working directory to the root folder of your project.

Once done, build and run (CMD + R) and the server will be accessible on port 8080.

## Getting Help

We love to hear from you so if you have questions, comments or find a bug in the project, let us know! You can either:

* Open an issue on this repository
* Tweet at us! We're [@VonageDev on Twitter](https://twitter.com/VonageDev)
* Or [join the Vonage Developer Community Slack](https://developer.nexmo.com/community/slack)

## Further Reading

* Check out the Developer Documentation at <https://developer.nexmo.com>
