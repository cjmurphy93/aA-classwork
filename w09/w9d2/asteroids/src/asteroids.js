const Util = require("./utils.js");
const MovingObject = require("./moving_objects.js");


function Asteroid (options) {
    let opt ={
        // color: Asteroid.COLOR,
        radius: Asteroid.RADIUS,
        vel: Util.randomVec(5)
    };
    opt.pos = options.pos;
    opt.game = options.game;
    MovingObject.call(this, opt);
};

Asteroid.COLOR = "#A9A9A9";
Asteroid.RADIUS = 30;

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
