
//首页+产品列表页进度条
(function($) {
	$.fn.svgCircle = function(i) {
		i = $.extend({
			parent: null,
			w: 75,
			R: 30,
			sW: 20,
			color: ["#000", "#000"],
			perent: [182, 182],
			speed: 0,
			delay: 1000
		}, i);
		return this.each(function() {
			var e = i.parent;
			if (!e) return false;
			var w = i.w;
			var r = Raphael(e, w, w),
				R = i.R,
				init = true,
				param = {
					stroke: "#ffbcb5"
				},
				hash = document.location.hash,
				marksAttr = {
					fill: hash || "#444",
					stroke: "none"
				};
			r.customAttributes.arc = function(b, c, R) {
				var d = 360 / c * b,
					a = (90 - d) * Math.PI / 180,
					x = w / 2 + R * Math.cos(a),
					y = w / 2 - R * Math.sin(a),
					color = i.color,
					path;
				if (c == b) {
					path = [
						["M", w / 2, w / 2 - R],
						["A", R, R, 0, 1, 1, w / 2 - 0.01, w / 2 - R]
					]
				} else {
					path = [
						["M", w / 2, w / 2 - R],
						["A", R, R, 0, +(d > 180), 1, x, y]
					]
				}
				return {
					path: path
				}
			};
			var f = r.path().attr({
				stroke: "#ff7e42",
				"stroke-width": i.sW
			}).attr({
				arc: [182, 182, R]
			});
			var g = r.path().attr({
				stroke: "#ff0000",
				"stroke-width": i.sW
			}).attr(param).attr({
				arc: [0.01, i.speed, R]
			});
			var h;
			if (i.perent[1] > 0) {
				setTimeout(function() {
					g.animate({
						stroke: i.color[1],
						arc: [i.perent[1], 100, R]
					}, 900, ">")
				}, i.delay)
			} else {
				g.hide()
			}
		})
	}
})(jQuery);
$(function() {
	var c = $('.processingbar');
	animateEle();
	$(window).scroll(function() {
		animateEle()
	});

	function animateEle() {
		var b = {
			top: $(window).scrollTop(),
			bottom: $(window).scrollTop() + $(window).height()
		};
		c.each(function() {
			
			if (screen.width >= 640){
			   if (b.top <= $(this).offset().top && b.bottom >= $(this).offset().top && !$(this).data('bPlay')) {
							$(this).data('bPlay', true);
							var a = $(this).find('font').text().replace(/\%/, '');
							if ($(this).find("font").text() !== "0%") {
								$(this).svgCircle({
									parent: $(this)[0],
									w:370,
									R:181,
									sW:8,
									color: ["#ffbcb5", "#ffbcb5", "#ffbcb5"],
									perent: [100, a],
									speed: 150,
									delay: 400
								})
							}
							if ($(this).find("font").text() == "0%") {
								$(this).find("font").css("color", "#fff");
								$(this).svgCircle({
									parent: $(this)[0],
									w:370,
									R:181,
									sW:8,
									color: ["#ff7e42", "#ff7e42", "#ff7e42"],
									perent: [100, a],
									speed: 150,
									delay: 400
								})
							}				
							
						}
			}else  if (screen.width >= 412){
			   if (b.top <= $(this).offset().top && b.bottom >= $(this).offset().top && !$(this).data('bPlay')) {
				$(this).data('bPlay', true);
				var a = $(this).find('font').text().replace(/\%/, '');
				if ($(this).find("font").text() !== "0%") {
					$(this).svgCircle({
						parent: $(this)[0],
						w:238,
						R:113,
						sW:8,
						color: ["#ffbcb5", "#ffbcb5", "#ffbcb5"],
						perent: [100, a],
						speed: 150,
						delay: 400
					})
				}
				if ($(this).find("font").text() == "0%") {
					$(this).find("font").css("color", "#fff");
					$(this).svgCircle({
						parent: $(this)[0],
						w:238,
						R:113,
						sW:8,
						color: ["#ff7e42", "#ff7e42", "#ff7e42"],
						perent: [100, a],
						speed: 150,
						delay: 400
					})
				}				
				
			}
			}else if (screen.width >= 360){
			   if (b.top <= $(this).offset().top && b.bottom >= $(this).offset().top && !$(this).data('bPlay')) {
				$(this).data('bPlay', true);
				var a = $(this).find('font').text().replace(/\%/, '');
				if ($(this).find("font").text() !== "0%") {
					$(this).svgCircle({
						parent: $(this)[0],
						w:216,
						R:102,
						sW:8,
						color: ["#ffbcb5", "#ffbcb5", "#ffbcb5"],
						perent: [100, a],
						speed: 150,
						delay: 400
					})
				}
				if ($(this).find("font").text() == "0%") {
					$(this).find("font").css("color", "#fff");
					$(this).svgCircle({
						parent: $(this)[0],
						w:216,
						R:102,
						sW:8,
						color: ["#ff7e42", "#ff7e42", "#ff7e42"],
						perent: [100, a],
						speed: 150,
						delay: 400
					})
				}				
				
			}
			}else {
			  if (b.top <= $(this).offset().top && b.bottom >= $(this).offset().top && !$(this).data('bPlay')) {
				$(this).data('bPlay', true);
				var a = $(this).find('font').text().replace(/\%/, '');
				if ($(this).find("font").text() !== "0%") {
					$(this).svgCircle({
						parent: $(this)[0],
						w:185,
						R:88,
						sW:8,
						color: ["#ffbcb5", "#ffbcb5", "#ffbcb5"],
						perent: [100, a],
						speed: 150,
						delay: 400
					})
				}
				if ($(this).find("font").text() == "0%") {
					$(this).find("font").css("color", "#fff");
					$(this).svgCircle({
						parent: $(this)[0],
						w:185,
						R:88,
						sW:8,
						color: ["#ff7e42", "#ff7e42", "#ff7e42"],
						perent: [100, a],
						speed: 150,
						delay: 400
					})
				}				
				
			}
			}
			
		})
		
	}
});
var pie = {
	run: function(a) {
		if (!a.id) throw new Error("must be canvas id.");
		var b = document.getElementById(a.id),
			ctx;
		if (b && (ctx = b.getContext("2d"))) {
			b.width = b.height = "200";
			var c = function() {};
			var d = a.onBefore || c;
			var e = a.onAfter || c;
			d(ctx);
			ctx.fillStyle = a.color || '#ff0000';
			var f = a.step || 1;
			var g = a.delay || 10;
			var i = 0,
				rage = 360 * (a.percent || 0);
			var h = -Math.PI * 0.5;
			var j = function() {
					i = i + f;
					if (i <= rage) {
						ctx.beginPath();
						ctx.moveTo(100, 100);
						ctx.arc(100, 100, 100, h, Math.PI * 2 * (i / 360) + h);
						ctx.fill();
						setTimeout(j, g)
					} else {
						e(ctx)
					}
				};
			j()
		}
	}
};