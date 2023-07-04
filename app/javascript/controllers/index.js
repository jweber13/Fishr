// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application";


import FishingTripInputController from "./fishing_trip_input_controller"
application.register("fishing-trip-input", FishingTripInputController)

import ModalhandlerController from "./modalhandler_controller"
application.register("modalhandler", ModalhandlerController)

import HelloController from "./hello_controller";
application.register("hello", HelloController);

import MenuController from "./menu_controller"
application.register("menu", MenuController)

import NewContactController from "./contact_controller"
application.register("contact", NewContactController)

import SearchContactsController from "./search_contacts_controller"
application.register("search-contacts", SearchContactsController)
