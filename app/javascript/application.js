// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import './preview'
import "@hotwired/turbo-rails"
import "./controllers"
import './new'
import { Application } from "@hotwired/stimulus"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))
