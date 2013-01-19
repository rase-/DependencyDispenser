# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

dependencyDispenser = {
  views: {}
  models: {}
  utils: {}
  paths: { exercisesPath: "http://localhost:3000/exercises" }
}

dependencyDispenser.models.Exercise = Backbone.Model.extend({})
dependencyDispenser.models.Exercises = Backbone.Collection.extend({
  model: dependencyDispenser.models.Exercise
  url: dependencyDispenser.paths.exercisesPath
  computeAndDrawGeometries: (canvas) ->
    this.each (exercise) ->
      # Here we should somehow decide coordinates for each exercise, replace current with real logic
      x = 1
      y = 1
      radius = 2

      exercise.geometry = canvas.circle(x, y, radius)
      if exercise.done then exercise.geometry.attr("fill", "green") else exercise.geometry.attr("fill", "red")
      # Here we should draw arrows from dependencies to this
})

# Here we shall define some views
dependencyDispenser.views.DependencyView = Backbone.View.extend({
  initialize: ->
    @exercises = new dependencyDispenser.models.Exercises()
    @exercises.fetch({ update: true, remove: false, success: -> this.render() })
  render: ->
    # Canvas needs to be initialized
    @canvas = Raphael($("#canvas")) # Possibly needs width and height
    @exercises.computeAndDrawGeometries(@canvas)
})
