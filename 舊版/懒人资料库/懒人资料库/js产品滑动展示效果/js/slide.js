(function($){
		$.fn.slide = function(options){
		var defaults = {
			slideWidth: 890,
			autoplay: true,
			duration: 15000,
			showSlideIndex: false
		};
		var options = $.extend(defaults, options);
		return this.each(function(){
		  	var slideshow = $(this);
			var o = options;
			var currentPosition = 0;
			var slides = $('.slide');
			var numberOfSlides = slides.length;
			  
			// Remove scrollbar in JS
			$('#slidesContainer').css('overflow', 'hidden');

			// Wrap all .slides with #slideInner div
			slides.wrapAll('<div id="slideInner"></div>')
			
			// Float left to display horizontally, readjust .slides width
			.css({
				 'float' : 'left',
				 'width' : o.slideWidth
			});
			
			// Insert a clone of first slide 
			$('.slide:first').clone().appendTo('#slideInner');
			  
			// Set #slideInner width equal to total width of all slides
			$('#slideInner').css('width', o.slideWidth * (numberOfSlides+1));

			// Insert controls in the DOM
			slideshow
				.prepend('<span class="control" id="leftControl"></span>')
				.append('<span class="control" id="rightControl"></span>');

			// Insert slides index
			if(o.showSlideIndex==true)
			{
				slideshow.append('<div id="slideIndex"></div>');
				for(var i=1; i<= numberOfSlides; i++)
				{
					$('#slideIndex').append('<span id="slide-' + i + '" class="numbers">' + i + '</span>' );
				}
				$('.numbers').click(function(){ goto( ($(this).attr('id')).replace('slide-','') - 1, false)});
			}
	
			// Create event listeners for .controls clicks
			$('#leftControl').click(function(){ prev()});
			$('#rightControl').click(function(){ next()});
		  
			// Start
			init();
			//Download by http://sc.xueit.com
			//Init function
			function init()
			{
				manageControls(currentPosition);
				if(o.autoplay==true) setNextTimeOut(o.duration);
			}
			
			// Next
			function next()
			{
				currentPosition++;
				if(currentPosition >= numberOfSlides) currentPosition=0;
				slideTo(currentPosition, true);
			}
		  
			// Previous
			function prev()
			{
				currentPosition--;
				if(currentPosition <0) currentPosition=numberOfSlides-1;
				slideTo(currentPosition, false);
			}
			
			// Go to a slide 
			function goto(position)
			{
				currentPosition=position;
				slideTo(currentPosition, false);
			}
			
			// Set time out for next slide
			function setNextTimeOut(time)
			{
				$('#slidesContainer').stop();
				// Just a crap animation to get timer, I got problem with setTimeout
				$('#slidesContainer').animate({optical: 1}, time, '', function(){next();});
			}
		  
			// Slide
			function slideTo(position, continuously)
			{
				$('#slideInner').stop();
				// usual cases
				if(continuously==false || o.autoplay==false || position!=0)
				{
					$('#slideInner').animate({'marginLeft' : o.slideWidth*(-position)},'', '', 
						function(){ 
							manageControls(position);
							if(o.autoplay==true) setNextTimeOut(o.duration);
						}
					)
				}
				// autoplay: slide from last to first one continuously
				else
				{
					// slide to the 'fake' first slide (actually at the last)
					$('#slideInner').animate({'marginLeft' : o.slideWidth*(-numberOfSlides)},'', '', 
						function(){ 
							//immediately change to the 'true' first slide
							$('#slideInner').css('marginLeft',0);
							manageControls(position)
							if(o.autoplay==true) setNextTimeOut(o.duration);
						}
					)
				}
			}
			
			// manageControls: Hides and Shows controls depending on currentPosition
			function manageControls(position)
			{
				// Hide left arrow if position is first slide
				if(position==0){ $('#leftControl').show() } else{ $('#leftControl').show() };
				// Hide right arrow if position is last slide
				if(position==(numberOfSlides-1)){ $('#rightControl').show() } else{ $('#rightControl').show() };
				// Hilight the current page
				if(o.showSlideIndex==true)
				{
					// remove active class from all pages
					$('.numbers').removeClass("active");
					// add only to the current page
					$('#slide-' + (position +1)).addClass("active");
				}
			}
		});
		};
	})(jQuery);