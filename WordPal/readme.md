# WordPal: A CodePath Project

## Table of Contents
1. Overview
3. Brainstorming
4. Planning Brief 
5. Specs
6. Wireframes

## Overview

WordPal is a app which helps people learn new words. The app can conveniently hold a list of selected words through its tab system. Then the user can then select a word, and expand it to see its definition if they wish. They can also press a button to pronounce the word and its definition.

### Feature Checklist

The following **required** functionality is completed:
- [X] Ability for user to input words
- [X] Use API to fetch word definitions
- [X] Text-to-speech to pronounce words

The following **optional** features are implemented:
- [X] Word tab system
- [X] Aesthetic UI
- [X] Multiple views
- [ ] Speech recognition

The following **additional** features are implemented:
- [X] Word deletion

### New Features Implemented - Week 1 Sprint:
- [X] Ability for users to input words
- [X] Multiple views
- [X] Aesthetic UI 

### New Features Implemented - Week 2 Sprint:
- [X] Use API to fetch word definitions
- [X] Text-to-speech to pronounce words
- [X] Aesthetic UI (further improvements)
- [X] Add and delete words

### Video:

Enable video audio to hear text-to-speech:

https://user-images.githubusercontent.com/94802525/283985492-5c0609be-38b8-40a7-be2e-f6d0ab9ba9b4.mp4

## Brainstorming

Prior to development starting, multiple project ideas were floated. While ultimately the Pronouncer idea was picked, the following ideas were considered:

**1. VideoStreamer**
**Goal:** The app would retrieve a random video from a selected category
    1. Mobile: Would be a web app.
    2. Story: Is unlikely to cause much impact.
    3. Market: People interested in finding random videos.
    4. Habit: Without a reccomendation system, it's unlikely to become a regular habit.
    5. Scope: It might be very challenging, particularly since videos wouldn't be parsable as JSON.
    
**2. GifPicker**
**Goal:** The app would fetch a tableView of gifs from a website
    1. Mobile: Would be a web app.
    2. Story: People might be interested in it to share gifs.
    3. Market: People involved with social media.
    4. Habit: Again, without a robust reccomendation system, it's unlikely to become a regular habit.
    5. Scope: Would be semi-challenging.
    
**3. RestaurantFinder**
**Goal:** The app would find restaurants near you
    1. Mobile: The app is more suited to mobile, as people are more likely to look nearby restaurants from their phone as compared to their laptops.
    2. Story: Might make an impact, especially if it helps people discover local restaurants.
    3. Market: Young adults that visit restaurants frequently.
    4. Habit: Might form an occasional habit, as people seek to find new restaurants to visit.
    5. Scope: Challenging, as it would involve location-based APIs.
    
**4. Pronouncer**
**Goal:** The app would allow users to select a word. The user would then have to pronounce the word correctly.
    1. Mobile: This app is suited for mobile.
    2. Story: Unlikely to have much of an impact.
    3. Market: People who are learning English.
    4. Habit: The app needs to be further fleshed out to become a habit.
    5. Scope: Difficult, as it would involve speech recognition and microphone APIs.
    

## Brief

Note: Although Pronouncer was originally chosen as the app idea, the app morph into WordPal over the course of the project

With Pronouncer chosen as the app idea, work would start with planning out the project. The idea was to make use of iOS's built in text to speech system and the Free Dictionary API. The app would be built with SwiftUI, to take advantage of its more flexible stack system as opposed to the more rigid Storyboard-based UIKit.

During the planning phase, there were 3 key ideas. One was having a tab of selected words. Another was a button that would pronounce the word currently selected. And the third was to have a button that would allow the user to pronounce the word themselves.

Later on (after the wireframes were built), there was an attempt to implement the speech recognition with InstantSearchOverlay installed via CocoaPods. However, InstantSearchOverlay is designed to work with UIKit, and thus that feature was removed as a core feature.

As a result of the priorities change, the app was renamed into WordPal.

## Specs
Minimum Viable Product Features:
1. Ability for user to input words
2. Use API to fetch word definitions
3. Text-to-speech to pronounce words

Additional Features:
1. Word tab system
2. Aesthetic UI
3. Multiple views
4. Speech recognition

Navigation Flows:
- From home view to add word view
- From add word view back to home view


## Wireframes
Note: The app ended up straying from the wireframe concepts

Home Page:

![Wireframe-Search](https://user-images.githubusercontent.com/94802525/282224126-bf2fc773-e612-4654-ad9f-1e209143083c.png)

Search Page:

![Wireframe-Home](https://user-images.githubusercontent.com/94802525/282224124-c6c338fa-42db-49d7-955b-4e7564601037.png)
