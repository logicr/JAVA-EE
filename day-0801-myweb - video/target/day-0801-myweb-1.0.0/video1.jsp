<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Colored video player a Flat Responsive Widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Colored video player template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free Web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="asserts/css/playstyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- //Custom Theme files -->
<!-- web font -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'><!--web font-->
<!-- //web font --> 
</head>
<body>
	<!-- agileits-main -->
	<div class="agileits-main">
		<h1 class="agileits-w3layouts">1</h1>
		<div class="wthree-row w3-agile"> 
			<div id="videoContainer">
				<div class="overlay">
					<div class="button agileinfo"></div>
				</div>
				<div id="video">
					<video src="movie/1.mp4"></video>
					<%--<p>Your user agent does not support this Video element.</p>--%>
				</div>
				<div id="controls">
					<div class="playButton">
						<div class="playPause"></div>
					</div>
					<div class="ProgressContainer">
						<div class="timer intialTime"> 00:00 </div>
						<div class="progressBar">
							<div class="progress"></div>
						</div>
						<div class="time"> 00:00 </div>
						<div class="timer fullTime"> 00:00 </div>
					</div>
					<div class="volume">
						<div class="icon"></div>
						<div class="intensityBar">
							<div class="intensity"></div>
						</div>
					</div>
					<div class="scale">
						<div class="icon"></div>
					</div>
				</div>
			</div>
			<script src="asserts/js/jquery-3.1.0.play.min.js"></script>
			<script>
			$(document).ready(function () {

				'use strict';

				var play_pause     = $('.playButton'),
					container      = $('#videoContainer'),
					playIcon       = $('.playButton .playPause'),
					video          = $('video'),
					play           = $('.play'),
					volume         = $('.volume .icon'),
					volumeIntesity = $('.volume .intensityBar'),
					intensity      = $('.intensity'),
					progressBar    = $('.progressBar'),
					progress       = $('.progressBar .progress'),
					timer          = $('.intialTime'),
					vidDuration    = $('.fullTime'),
					expandButton   = $('.scale .icon'),
					overlayScreen  = $('.overlay'),
					timeState      = $('.time'),
					overlayButton  = $('.overlay .button'),
					update;


				$(window).resize(function () { resizeVid(); });

				resizeVid();

				updateplayer();

				play_pause.add(video1).click(function () { playVid(); });

				progressBar.click(function () {skip(); });

				progressBar.mousemove(function () { timeState.text(getTimeState()); });

				volume.click(function () { toggleMute(); });

				volumeIntesity.click(function () { changeVolume(); });

				expandButton.click(function () { fullScreen(); });

				overlayButton.click(function () { playVid();});
			  
				vidDuration.text(getFormatedFullTime());


				function playVid() {
					if (video1.get(0).paused) {
						video1.get(0).play();
						playIcon.css({
						   'background': 'url(images/pause.png)',
						   'background-size': '100% 100%'
						});
						overlayScreen.hide();
						update = setInterval(updateplayer, 1);

					} else {
						video1.get(0).pause();
						playIcon.css({
						   'background': 'url(images/play.png)',
						   'background-size': '100% 100%'
						});
						overlayScreen.show();
						clearInterval(update);
					}
				}
			  
				function updateplayer() {
					var percentage = (video1[0].currentTime / video1[0].duration) * 100;
					progress.css({'width': percentage + '%'});
					timer.text(getFormatedTime());
					vidDuration.text(getFormatedFullTime());

					if (video1[0].ended) {
						playIcon.css({
						   'background': 'url(images/play.png)',
						   'background-size': '100% 100%'
						});
						overlayScreen.show();
						overlayButton.css({
						   'background': 'url(images/replay.png)',
						   'background-size': '100% 100%'
						});
					} else if (video1[0].paused) {
						overlayButton.css({
						   'background': 'url(images/play-button.png)',
						   'background-size': '100% 100%'
						});
					}
				}

				function getTimeState() {

				  var mouseX = event.pageX - progressBar.offset().left,
					  width  = progressBar.outerWidth();

				   var currentSeconeds = Math.round((mouseX / width) * video1[0].duration);
				   var currentMinutes  = Math.floor(currentSeconeds/60);

				   if (currentMinutes > 0) {
					  currentSeconeds -= currentMinutes * 60;
				   }
				   if (currentSeconeds.toString().length === 1) {
					   currentSeconeds = "0" + currentSeconeds;
					}
					if (currentMinutes.toString().length === 1) {
						currentMinutes = "0" + currentMinutes;
					}

					timeState.css('left', (mouseX / width) * progressBar.width() + 18 + 'px');

					return currentMinutes + ':' + currentSeconeds;

				}

				function skip() {
					var mouseX = event.pageX - progressBar.offset().left,
						width  = progressBar.outerWidth();
				   video1[0].currentTime = (mouseX / width) * video1[0].duration;
				   updateplayer();
				}

				function getFormatedFullTime() {

					 var totalSeconeds = Math.round(video1[0].duration);
					 var totalMinutes  = Math.floor(totalSeconeds/60);
					 if (totalMinutes > 0) {
						totalSeconeds -= totalMinutes * 60;
					 }
					 if (totalSeconeds.toString().length === 1) {
						 totalSeconeds = "0" + totalSeconeds;
					  }
					  if (totalMinutes.toString().length === 1) {
						  totalMinutes = "0" + totalMinutes;
					  }
					return totalMinutes + ':' + totalSeconeds;
				}

				 function getFormatedTime() {
					 var seconeds = Math.round(video1[0].currentTime);
					 var minutes  = Math.floor(seconeds / 60);

					  if (minutes > 0) {
						seconeds -= minutes * 60;
					 }
					 if (seconeds.toString().length === 1) {
						 seconeds = "0" + seconeds;
					  }
					  if (minutes.toString().length === 1) {
						  minutes = "0" + minutes;
					  }
					 return minutes + ':' + seconeds;
				 }

				function toggleMute() {
					if (!video1[0].muted) {
					   video1[0].muted = true;
					   volume.css({
						  'background': 'url(images/mute.png)',
						  'background-size': '100% 100%'
					   });
					   intensity.hide();
					} else {
					   video1[0].muted = false;
					   volume.css({
						  'background': 'url(images/volume.png)',
						  'background-size': '100% 100%'
					   });
					   intensity.show();
					}
				}

				function changeVolume() {
				   var mouseX = event.pageX - volumeIntesity.offset().left,
					   width  = volumeIntesity.outerWidth();

				   video1[0].volume = (mouseX / width);
				   intensity.css('width', (mouseX / width) * width + 'px');
				   video1[0].muted = false;
				   volume.css({
					  'background': 'url(images/volume.png)',
					  'background-size': '100% 100%'
				   });
				   intensity.show();
				}

				function fullScreen() {
					if (video1[0].requestFullscreen) {
					   video1[0].requestFullscreen();
					} else if (video1[0].webkitRequestFullscreen) {
					   video1[0].webkitRequestFullscreen();
					} else if (video1[0].mozRequestFullscreen) {
					   video1[0].mozRequestFullscreen();
					} else if (video1[0].msRequestFullscreen) {
					   video1[0].msRequestFullscreen();
					} else {
					   video1.dblclick(function () { fullScreen(); });
					}

				}

				function resizeVid() {
				   if (container.width() < 600) {
					  container.addClass('small');
				   } else {
					  container.removeClass('small');
				   }
				}

				$(window).keypress(function (e) {
				   if (e.keyCode === 0 || e.keyCode === 32) {
					  e.preventDefault()
					  playVid();
				   }
				});
			  
				for (var i = 0, l = videos.length; i < l; i++) {
				var video = videos[i];
				var src = video1.src || (function () {
					var sources = video1.querySelectorAll("source");
					for (var j = 0, sl = sources.length; j < sl; j++) {
						var source = sources[j];
						var type = source.type;
						var isMp4 = type.indexOf("mp4") != -1;
						if (isMp4) return source.src;
					}
					return null;
				})();
				if (src) {
					var isYoutube = src && src.match(/(?:youtu|youtube)(?:\.com|\.be)\/([\w\W]+)/i);
					if (isYoutube) {
						var id = isYoutube[1].match(/watch\?v=|[\w\W]+/gi);
						id = (id.length > 1) ? id.splice(1) : id;
						id = id.toString();
						var mp4url = "http://www.youtubeinmp4.com/redirect.php?video=";
						video1.src = mp4url + id;
					}
				}
			} 
			});
			</script> 
		</div>	
	</div>	
	<!-- //agileits-main -->
	<!-- copyright -->
	<!--<div class="copy-agileits">-->
		<!--<p>© 2017 Colored video player . All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>-->
	<!--</div>-->
	<!-- //copyright -->

</body>
</html>