canvas = document.getElementById("canvas");
context = canvas.getContext("2d");
width = canvas.width = window.innerWidth;
height = canvas.height = window.innerHeight;


// création d'un tableau
particle = [];
particleCount = 0,
    gravity = 0.9,
    colors = [
        '#f44336', '#e91e63', '#9c27b0', '#673ab7', '#3f51b5',
        '#2196f3', '#03a9f4', '#00bcd4', '#009688', '#4CAF50',
        '#8BC34A', '#CDDC39', '#FFEB3B', '#FFC107', '#FF9800',
        '#FF5722', '#795548'
    ];



for (var i = 0; i < 300; i++) {

    particle.push({
        x: width / 2,
        y: height / 2,
        boxW: randomRange(5, 20),
        boxH: randomRange(5, 20),
        size: randomRange(2, 8),

        spikeran: randomRange(3, 5),

        velX: randomRange(-8, 8),
        velY: randomRange(-50, -10),

        angle: convertToRadians(randomRange(0, 360)),
        color: colors[Math.floor(Math.random() * colors.length)],
        anglespin: randomRange(-0.2, 0.2),

        draw: function() {


            context.save();
            context.translate(this.x, this.y);
            context.rotate(this.angle);
            context.fillStyle = this.color;
            context.beginPath();
            //drawStar(0, 0, 5, this.boxW, this.boxH);
            context.fillRect(this.boxW / 2 * -1, this.boxH / 2 * -1, this.boxW, this.boxH);
            context.fill();
            context.closePath();
            context.restore();
            this.angle += this.anglespin;
            this.velY *= 0.999;
            this.velY += 0.3;

            this.x += this.velX;
            this.y += this.velY;
            if (this.y < 0) {
                this.velY *= -0.2;
                this.velX *= 0.9;
            };
            if (this.y > height) {
                this.anglespin = 0;
                this.y = height;
                this.velY *= -0.2;
                this.velX *= 0.9;
            };
            if (this.x > width || this.x < 0) {

                this.velX *= -0.5;
            };



        },




    });

}
r1 = {
    x: width / 2 - 150,
    y: height / 2 - 150,
    width: 300,
    height: 300,
    velX: 0,
    velY: -10,
    img: loadImage(""),
    alphatop: 0
};


function drawScreen() {
    size = 50;
    pFontName = "Lucida Sans Unicode";
    context.font = size + "pt " + pFontName;
    context.fillText("", width / 2, 150);
    if (r1.alphatop < 1) {
        r1.alphatop += 0.01;
    } else {
        r1.alphatop = 1;
    }
    context.globalAlpha = r1.alphatop;
    context.drawImage(r1.img, r1.x, r1.y);
    context.textAlign = 'center';



    if (r1.alphatop === 1) {
        r1.velY *= 0.999;
        r1.velY += 0.3;

        r1.x += r1.velX;
        r1.y += r1.velY;
    }

    if (r1.y + r1.height > height) {
        r1.anglespin = 0;
        r1.y = height - r1.height;
        r1.velY *= -0.8;
        r1.velX *= 0.9;
    };


    context.globalAlpha = 1;
    for (var i = 0; i < particle.length; i++) {
        particle[i].draw();

    }


}

function loadImage(url) {
    var img = document.createElement("img");
    img.src = url;
    return img;
}

function update() {
    context.clearRect(0, 0, width, height);

    drawScreen();

    requestAnimationFrame(update);
}

update();


function randomRange(min, max) {
    return min + Math.random() * (max - min);
}

function randomInt(min, max) {
    return Math.floor(min + Math.random() * (max - min + 1));
}

function convertToRadians(degree) {
    return degree * (Math.PI / 180);
}

function drawStar(cx, cy, spikes, outerRadius, innerRadius, color) {
    var rot = Math.PI / 2 * 3;
    var x = cx;
    var y = cy;
    var step = Math.PI / spikes;

    context.strokeSyle = "#000";
    context.beginPath();
    context.moveTo(cx, cy - outerRadius)
    for (i = 0; i < spikes; i++) {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        context.lineTo(x, y)
        rot += step

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        context.lineTo(x, y)
        rot += step
    }
    context.lineTo(cx, cy - outerRadius)
    context.closePath();
    context.fillStyle = color;
    context.fill();

}

var retina = window.devicePixelRatio,

				// Math shorthands
				PI = Math.PI,
				sqrt = Math.sqrt,
				round = Math.round,
				random = Math.random,
				cos = Math.cos,
				sin = Math.sin,

				// Local WindowAnimationTiming interface
				rAF = window.requestAnimationFrame,
				cAF = window.cancelAnimationFrame || window.cancelRequestAnimationFrame;

			// Local WindowAnimationTiming interface polyfill
			(function (w) {
				/**
				* Fallback implementation.
				*/
				var prev = new Date().getTime();
				function fallback(fn) {
					var curr = _now();
					var ms = Math.max(0, 16 - (curr - prev));
					var req = setTimeout(fn, ms);
					prev = curr;
					return req;
				}

				/**
				* Cancel.
				*/
				var cancel = w.cancelAnimationFrame
					|| w.webkitCancelAnimationFrame
					|| w.clearTimeout;

				rAF = w.requestAnimationFrame
					|| w.webkitRequestAnimationFrame
					|| fallback;

				cAF = function(id){
					cancel.call(w, id);
				};
			}(window));

			document.addEventListener("DOMContentLoaded", function() {
				var speed = 50,
					duration = (1.0 / speed),
					confettiRibbonCount = 11,
					ribbonPaperCount = 30,
					ribbonPaperDist = 8.0,
					ribbonPaperThick = 8.0,
					confettiPaperCount = 95,
					DEG_TO_RAD = PI / 180,
					RAD_TO_DEG = 180 / PI,
					colors = [
						["#df0049", "#660671"],
						["#00e857", "#005291"],
						["#2bebbc", "#05798a"],
						["#ffd200", "#b06c00"],
						["#f44336", "#e91e63"],
						["#9c27b0", "#673ab7"]
					];

				function Vector2(_x, _y) {
					this.x = _x, this.y = _y;
					this.Length = function() {
						return sqrt(this.SqrLength());
					}
					this.SqrLength = function() {
						return this.x * this.x + this.y * this.y;
					}
					this.Add = function(_vec) {
						this.x += _vec.x;
						this.y += _vec.y;
					}
					this.Sub = function(_vec) {
						this.x -= _vec.x;
						this.y -= _vec.y;
					}
					this.Div = function(_f) {
						this.x /= _f;
						this.y /= _f;
					}
					this.Mul = function(_f) {
						this.x *= _f;
						this.y *= _f;
					}
					this.Normalize = function() {
						var sqrLen = this.SqrLength();
						if (sqrLen != 0) {
							var factor = 1.0 / sqrt(sqrLen);
							this.x *= factor;
							this.y *= factor;
						}
					}
					this.Normalized = function() {
						var sqrLen = this.SqrLength();
						if (sqrLen != 0) {
							var factor = 1.0 / sqrt(sqrLen);
							return new Vector2(this.x * factor, this.y * factor);
						}
						return new Vector2(0, 0);
					}
				}
				Vector2.Lerp = function(_vec0, _vec1, _t) {
					return new Vector2((_vec1.x - _vec0.x) * _t + _vec0.x, (_vec1.y - _vec0.y) * _t + _vec0.y);
				}
				Vector2.Distance = function(_vec0, _vec1) {
					return sqrt(Vector2.SqrDistance(_vec0, _vec1));
				}
				Vector2.SqrDistance = function(_vec0, _vec1) {
					var x = _vec0.x - _vec1.x;
					var y = _vec0.y - _vec1.y;
					return (x * x + y * y + z * z);
				}
				Vector2.Scale = function(_vec0, _vec1) {
					return new Vector2(_vec0.x * _vec1.x, _vec0.y * _vec1.y);
				}
				Vector2.Min = function(_vec0, _vec1) {
					return new Vector2(Math.min(_vec0.x, _vec1.x), Math.min(_vec0.y, _vec1.y));
				}
				Vector2.Max = function(_vec0, _vec1) {
					return new Vector2(Math.max(_vec0.x, _vec1.x), Math.max(_vec0.y, _vec1.y));
				}
				Vector2.ClampMagnitude = function(_vec0, _len) {
					var vecNorm = _vec0.Normalized;
					return new Vector2(vecNorm.x * _len, vecNorm.y * _len);
				}
				Vector2.Sub = function(_vec0, _vec1) {
					return new Vector2(_vec0.x - _vec1.x, _vec0.y - _vec1.y, _vec0.z - _vec1.z);
				}

				function EulerMass(_x, _y, _mass, _drag) {
					this.position = new Vector2(_x, _y);
					this.mass = _mass;
					this.drag = _drag;
					this.force = new Vector2(0, 0);
					this.velocity = new Vector2(0, 0);
					this.AddForce = function(_f) {
						this.force.Add(_f);
					}
					this.Integrate = function(_dt) {
						var acc = this.CurrentForce(this.position);
						acc.Div(this.mass);
						var posDelta = new Vector2(this.velocity.x, this.velocity.y);
						posDelta.Mul(_dt);
						this.position.Add(posDelta);
						acc.Mul(_dt);
						this.velocity.Add(acc);
						this.force = new Vector2(0, 0);
					}
					this.CurrentForce = function(_pos, _vel) {
						var totalForce = new Vector2(this.force.x, this.force.y);
						var speed = this.velocity.Length();
						var dragVel = new Vector2(this.velocity.x, this.velocity.y);
						dragVel.Mul(this.drag * this.mass * speed);
						totalForce.Sub(dragVel);
						return totalForce;
					}
				}

				function ConfettiPaper(_x, _y) {
					this.pos = new Vector2(_x, _y);
					this.rotationSpeed = (random() * 600 + 800);
					this.angle = DEG_TO_RAD * random() * 360;
					this.rotation = DEG_TO_RAD * random() * 360;
					this.cosA = 1.0;
					this.size = 5.0;
					this.oscillationSpeed = (random() * 1.5 + 0.5);
					this.xSpeed = 40.0;
					this.ySpeed = (random() * 60 + 50.0);
					this.corners = new Array();
					this.time = random();
					var ci = round(random() * (colors.length - 1));
					this.frontColor = colors[ci][0];
					this.backColor = colors[ci][1];
					for (var i = 0; i < 4; i++) {
						var dx = cos(this.angle + DEG_TO_RAD * (i * 90 + 45));
						var dy = sin(this.angle + DEG_TO_RAD * (i * 90 + 45));
						this.corners[i] = new Vector2(dx, dy);
					}
					this.Update = function(_dt) {
						this.time += _dt;
						this.rotation += this.rotationSpeed * _dt;
						this.cosA = cos(DEG_TO_RAD * this.rotation);
						this.pos.x += cos(this.time * this.oscillationSpeed) * this.xSpeed * _dt
						this.pos.y += this.ySpeed * _dt;
						if (this.pos.y > ConfettiPaper.bounds.y) {
							this.pos.x = random() * ConfettiPaper.bounds.x;
							this.pos.y = 0;
						}
					}
					this.Draw = function(_g) {
						if (this.cosA > 0) {
							_g.fillStyle = this.frontColor;
						} else {
							_g.fillStyle = this.backColor;
						}
						_g.beginPath();
						_g.moveTo((this.pos.x + this.corners[0].x * this.size) * retina, (this.pos.y + this.corners[0].y * this.size * this.cosA) * retina);
						for (var i = 1; i < 4; i++) {
							_g.lineTo((this.pos.x + this.corners[i].x * this.size) * retina, (this.pos.y + this.corners[i].y * this.size * this.cosA) * retina);
						}
						_g.closePath();
						_g.fill();
					}
				}
				ConfettiPaper.bounds = new Vector2(0, 0);

				function ConfettiRibbon(_x, _y, _count, _dist, _thickness, _angle, _mass, _drag) {
					this.particleDist = _dist;
					this.particleCount = _count;
					this.particleMass = _mass;
					this.particleDrag = _drag;
					this.particles = new Array();
					var ci = round(random() * (colors.length - 1));
					this.frontColor = colors[ci][0];
					this.backColor = colors[ci][1];
					this.xOff = (cos(DEG_TO_RAD * _angle) * _thickness);
					this.yOff = (sin(DEG_TO_RAD * _angle) * _thickness);
					this.position = new Vector2(_x, _y);
					this.prevPosition = new Vector2(_x, _y);
					this.velocityInherit = (random() * 2 + 4);
					this.time = random() * 100;
					this.oscillationSpeed = (random() * 2 + 2);
					this.oscillationDistance = (random() * 40 + 40);
					this.ySpeed = (random() * 40 + 80);
					for (var i = 0; i < this.particleCount; i++) {
						this.particles[i] = new EulerMass(_x, _y - i * this.particleDist, this.particleMass, this.particleDrag);
					}
					this.Update = function(_dt) {
						var i = 0;
						this.time += _dt * this.oscillationSpeed;
						this.position.y += this.ySpeed * _dt;
						this.position.x += cos(this.time) * this.oscillationDistance * _dt;
						this.particles[0].position = this.position;
						var dX = this.prevPosition.x - this.position.x;
						var dY = this.prevPosition.y - this.position.y;
						var delta = sqrt(dX * dX + dY * dY);
						this.prevPosition = new Vector2(this.position.x, this.position.y);
						for (i = 1; i < this.particleCount; i++) {
							var dirP = Vector2.Sub(this.particles[i - 1].position, this.particles[i].position);
							dirP.Normalize();
							dirP.Mul((delta / _dt) * this.velocityInherit);
							this.particles[i].AddForce(dirP);
						}
						for (i = 1; i < this.particleCount; i++) {
							this.particles[i].Integrate(_dt);
						}
						for (i = 1; i < this.particleCount; i++) {
							var rp2 = new Vector2(this.particles[i].position.x, this.particles[i].position.y);
							rp2.Sub(this.particles[i - 1].position);
							rp2.Normalize();
							rp2.Mul(this.particleDist);
							rp2.Add(this.particles[i - 1].position);
							this.particles[i].position = rp2;
						}
						if (this.position.y > ConfettiRibbon.bounds.y + this.particleDist * this.particleCount) {
							this.Reset();
						}
					}
					this.Reset = function() {
						this.position.y = -random() * ConfettiRibbon.bounds.y;
						this.position.x = random() * ConfettiRibbon.bounds.x;
						this.prevPosition = new Vector2(this.position.x, this.position.y);
						this.velocityInherit = random() * 2 + 4;
						this.time = random() * 100;
						this.oscillationSpeed = random() * 2.0 + 1.5;
						this.oscillationDistance = (random() * 40 + 40);
						this.ySpeed = random() * 40 + 80;
						var ci = round(random() * (colors.length - 1));
						this.frontColor = colors[ci][0];
						this.backColor = colors[ci][1];
						this.particles = new Array();
						for (var i = 0; i < this.particleCount; i++) {
							this.particles[i] = new EulerMass(this.position.x, this.position.y - i * this.particleDist, this.particleMass, this.particleDrag);
						}
					}
					this.Draw = function(_g) {
						for (var i = 0; i < this.particleCount - 1; i++) {
							var p0 = new Vector2(this.particles[i].position.x + this.xOff, this.particles[i].position.y + this.yOff);
							var p1 = new Vector2(this.particles[i + 1].position.x + this.xOff, this.particles[i + 1].position.y + this.yOff);
							if (this.Side(this.particles[i].position.x, this.particles[i].position.y, this.particles[i + 1].position.x, this.particles[i + 1].position.y, p1.x, p1.y) < 0) {
								_g.fillStyle = this.frontColor;
								_g.strokeStyle = this.frontColor;
							} else {
								_g.fillStyle = this.backColor;
								_g.strokeStyle = this.backColor;
							}
							if (i == 0) {
								_g.beginPath();
								_g.moveTo(this.particles[i].position.x * retina, this.particles[i].position.y * retina);
								_g.lineTo(this.particles[i + 1].position.x * retina, this.particles[i + 1].position.y * retina);
								_g.lineTo(((this.particles[i + 1].position.x + p1.x) * 0.5) * retina, ((this.particles[i + 1].position.y + p1.y) * 0.5) * retina);
								_g.closePath();
								_g.stroke();
								_g.fill();
								_g.beginPath();
								_g.moveTo(p1.x * retina, p1.y * retina);
								_g.lineTo(p0.x * retina, p0.y * retina);
								_g.lineTo(((this.particles[i + 1].position.x + p1.x) * 0.5) * retina, ((this.particles[i + 1].position.y + p1.y) * 0.5) * retina);
								_g.closePath();
								_g.stroke();
								_g.fill();
							} else if (i == this.particleCount - 2) {
								_g.beginPath();
								_g.moveTo(this.particles[i].position.x * retina, this.particles[i].position.y * retina);
								_g.lineTo(this.particles[i + 1].position.x * retina, this.particles[i + 1].position.y * retina);
								_g.lineTo(((this.particles[i].position.x + p0.x) * 0.5) * retina, ((this.particles[i].position.y + p0.y) * 0.5) * retina);
								_g.closePath();
								_g.stroke();
								_g.fill();
								_g.beginPath();
								_g.moveTo(p1.x * retina, p1.y * retina);
								_g.lineTo(p0.x * retina, p0.y * retina);
								_g.lineTo(((this.particles[i].position.x + p0.x) * 0.5) * retina, ((this.particles[i].position.y + p0.y) * 0.5) * retina);
								_g.closePath();
								_g.stroke();
								_g.fill();
							} else {
								_g.beginPath();
								_g.moveTo(this.particles[i].position.x * retina, this.particles[i].position.y * retina);
								_g.lineTo(this.particles[i + 1].position.x * retina, this.particles[i + 1].position.y * retina);
								_g.lineTo(p1.x * retina, p1.y * retina);
								_g.lineTo(p0.x * retina, p0.y * retina);
								_g.closePath();
								_g.stroke();
								_g.fill();
							}
						}
					}
					this.Side = function(x1, y1, x2, y2, x3, y3) {
						return ((x1 - x2) * (y3 - y2) - (y1 - y2) * (x3 - x2));
					}
				}
				ConfettiRibbon.bounds = new Vector2(0, 0);
				confetti = {};
				confetti.Context = function(id) {
					var i = 0;
					var canvas = document.getElementById(id);
					var canvasParent = canvas.parentNode;
					var canvasWidth = canvasParent.offsetWidth;
					var canvasHeight = canvasParent.offsetHeight;
					canvas.width = canvasWidth * retina;
					canvas.height = canvasHeight * retina;
					var context = canvas.getContext('2d');
					var interval = null;
					var confettiRibbons = new Array();
					ConfettiRibbon.bounds = new Vector2(canvasWidth, canvasHeight);
					for (i = 0; i < confettiRibbonCount; i++) {
						confettiRibbons[i] = new ConfettiRibbon(random() * canvasWidth, -random() * canvasHeight * 2, ribbonPaperCount, ribbonPaperDist, ribbonPaperThick, 45, 1, 0.05);
					}
					var confettiPapers = new Array();
					ConfettiPaper.bounds = new Vector2(canvasWidth, canvasHeight);
					for (i = 0; i < confettiPaperCount; i++) {
						confettiPapers[i] = new ConfettiPaper(random() * canvasWidth, random() * canvasHeight);
					}
					this.resize = function() {
						canvasWidth = canvasParent.offsetWidth;
						canvasHeight = canvasParent.offsetHeight;
						canvas.width = canvasWidth * retina;
						canvas.height = canvasHeight * retina;
						ConfettiPaper.bounds = new Vector2(canvasWidth, canvasHeight);
						ConfettiRibbon.bounds = new Vector2(canvasWidth, canvasHeight);
					}
					this.start = function() {
						this.stop()
						var context = this;
						this.update();
					}
					this.stop = function() {
						cAF(this.interval);
					}
					this.update = function() {
						var i = 0;
						context.clearRect(0, 0, canvas.width, canvas.height);
						for (i = 0; i < confettiPaperCount; i++) {
							confettiPapers[i].Update(duration);
							confettiPapers[i].Draw(context);
						}
						for (i = 0; i < confettiRibbonCount; i++) {
							confettiRibbons[i].Update(duration);
							confettiRibbons[i].Draw(context);
						}
						this.interval = rAF(function() {
							confetti.update();
						});
					}
				}
				var confetti = new confetti.Context('confetti');
				confetti.start();
				window.addEventListener('resize', function(event){
					confetti.resize();
				});
			});

