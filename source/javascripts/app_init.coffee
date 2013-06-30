'use strict'

$ ->

  console.log 'document ready'

  paddedNumber = (number) ->
    ("00" + number).slice(-3) if number <= 999

  totalPhotos = 187
  startIndex = 1
  number = undefined
  imageIndices = _.shuffle(_.range(totalPhotos)).slice(0, 30)
  _(imageIndices).each ->
    number = Math.floor(Math.random() * (totalPhotos - startIndex + 1)) + startIndex
    #$('.m-thumbnail-container').append '<img src="images/' + paddedNumber(number) + '.jpg" class="m-thumbnail">'
    $('.m-thumbnail-container').append "<div style='background-image:url(\"images/" + paddedNumber(number) + ".jpg\")' class=\"m-thumbnail\">"
  
  i = 0
  elementsPerRow = 4
  # while i <= totalPhotos
  #   randomOffsets = _(_.range(elementsPerRow)).shuffle().slice(0, 2)
  #   console.log 'take:' + randomOffsets
  #   $(".m-thumbnail-container .m-thumbnail:eq(#{i + randomOffsets[0]})").addClass('as-square')
  #   $(".m-thumbnail-container .m-thumbnail:eq(#{i + randomOffsets[1]})").addClass('as-square')
  #   i += elementsPerRow # there are always 5 photos per row
