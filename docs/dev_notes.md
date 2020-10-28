# Development Path for Battle

## Infrastructure Setup
Using the walkthrough, built the initial environment and testing infrastructure.

Using the Gemfile to setup the dependency requirements, and the basic file
structure, including spec, lib and views.

Editing the spec_helper file to enable coverage, capybara, and make it rack aware.

Built out the capybara awareness of the core class that will be used for our web
feature testing. Created our first capybara test - based on '/' site.

## starting to add functionality
Building out the player functionality using separated ERB views to get Names

using this form to build a notification page with the names in - to test functionality

assigning the variables to session variables, now makes them more transferable

utilise single responsibility principles, to split the post and get functionality

"Content" in capybara tests seems to do a matching anywhere on the page! useful - so that the enter_names_spec is still functional!

## building out the 'game path'
allowing the use of session variables to contain the names is useful for other things

use of different pages to 'chain' together views and functionality -seems a little clunky - waiting for the integrated interface with functional areas.

## extracting functionality down the stack
moving the functionality for the player class into a 'model' layer is useful, to maintain a clean controller interface / performance

has to be a better way of doing, rather than global variable - can't wait for database integration. not going to jump the gun to find another way via simple files, etc ... wait for the grand reveal! :)
