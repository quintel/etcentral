$(function() {
  $('#sidebar').scrollspy();
  $('.app-folders-container').appFolders({

  	// Opacity of non-selected items
  	opacity: .5,

  	// Adjust the margin-top for the folder area based on row selected?
  	marginTopAdjust: false,
  	// If margin-top-adjust is "true", the natural margin-top for the area
  	marginTopBase: 0,
  	// If margin-top-adjust is "true", the absolute value of the increment of margin-top per row
  	marginTopIncrement: 50,

  	// Time (in ms) for transitions
  	animationSpeed: 300,

  	// Use URL rewriting?
  	URLrewrite: false,
  	// If URL rewrite is enabled, the URL base of the page where used.
  	URLbase: "./",

  	// a jQuery selector containing links to content within a jQuery App Folder
  	internalLinkSelector: ".jaf-internal a",

  	// Set to true to enable one-click folder switching rather than iOS-like two clicks
  	instaSwitch: false
  });
});
